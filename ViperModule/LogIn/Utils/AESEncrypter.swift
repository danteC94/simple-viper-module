//
//  AESEncrypter.swift
//  ViperModule
//
//  Created by dante on 31/01/2021.
//

import Foundation
import CryptoSwift

// TODO: store sharedKey on keychain
let sharedKey = "WpaPGv7jzcHN3DbwLiMXFL2ysXvWf2eW"

class AESEncrypter {
    let secretKey: String

    init(secretKey: String = sharedKey) {
        self.secretKey = secretKey
    }

    func getAESParameters(from secretKey: String) -> (String, String) {
        let index = secretKey.index(secretKey.startIndex, offsetBy: 16)
        let key = String(secretKey[..<index])
        let iv = String(secretKey[index...])
        return (key, iv)
    }

    func aesEncrypt(pass: String, key: String, iv: String) throws -> Data {
        let aes = try AES(key: key, iv: iv, padding: .pkcs7)
        let inputData = Data(pass.utf8)
        let encryptedBytes = try aes.encrypt(inputData.bytes)

        return Data(encryptedBytes)
    }

    func aesDecrypt(encryptedData: Data, key: String, iv: String) throws -> String? {
        let aes = try AES(key: key, iv: iv, padding: .pkcs7)
        let decryptedBytes = try aes.decrypt(encryptedData.bytes)

        return String(bytes: decryptedBytes, encoding: .utf8)
    }
}
