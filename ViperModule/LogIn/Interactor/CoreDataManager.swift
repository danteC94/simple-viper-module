//
//  CoreDataManager.swift
//  ViperModule
//
//  Created by dante on 31/01/2021.
//

import CoreData
import Foundation

protocol DataBaseManager {
    func saveUser(email: String, password: String)
    func getUser(email: String, password: String) throws -> UserMO?
    func getUsers() -> [NSManagedObject]?
}

class CoreDataManager {
    func fetchObjectsFromDB(fetchRequest: NSFetchRequest<NSManagedObject>) -> [NSManagedObject]? {
        guard let managedContext = ViperModule.context else { return nil }
        do {
            let objects = try managedContext.fetch(fetchRequest)
            return objects
        } catch let error as NSError {
          print("Could not fetch objects. \(error), \(error.userInfo)")
            return nil
        }
    }

    func saveObject(entityName: String, entityValues: [String: Any]) {
        guard let managedContext = ViperModule.context else { return }

        let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext)!
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        _ = entityValues.map { key, value in
            user.setValue(value, forKey: key)
        }

        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not save object. \(error), \(error.userInfo)")
        }
    }
}

extension CoreDataManager: DataBaseManager {
    func saveUser(email: String, password: String) {
        let aesEncrypter = AESEncrypter()
        let aesParameters = aesEncrypter.getAESParameters(from: aesEncrypter.secretKey)
        do {
            let encryptedPassword = try aesEncrypter.aesEncrypt(pass: password,
                                                                key: aesParameters.0,
                                                                iv: aesParameters.1)
            let entityValues: [String: Any] = ["email": email, "password": encryptedPassword]
            let entityName = "User"
            self.saveObject(entityName: entityName, entityValues: entityValues)
        } catch let error as NSError {
            print("Could not decrypt user password for. \(email), \(error.userInfo)")
        }
    }

    func getUser(email: String, password: String) throws -> UserMO? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        let users = self.fetchObjectsFromDB(fetchRequest: fetchRequest)
        guard let user = users?.filter({ ($0.value(forKey: "email")) as? String == email}).first else { return nil }
        let aesEncrypter = AESEncrypter()
        let aesParameters = aesEncrypter.getAESParameters(from: aesEncrypter.secretKey)
        guard let encryptedpassword = user.value(forKey: "password") as? Data else { return nil }
        do {
            let decryptedPass = try aesEncrypter.aesDecrypt(encryptedData: encryptedpassword,
                                                            key: aesParameters.0,
                                                            iv: aesParameters.1)
            guard decryptedPass == password else { return nil }
            return UserMO(email: email, password: encryptedpassword)
        } catch let error as NSError {
            print("Could not decrypt user password for. \(email), \(error.userInfo)")
            return nil
        }
    }

    func getUsers() -> [NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        return self.fetchObjectsFromDB(fetchRequest: fetchRequest)
    }
}


