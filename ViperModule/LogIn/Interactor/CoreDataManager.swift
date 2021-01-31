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
    func getUser(email: String, password: String) throws -> User?
    func getUsers() -> [User]?
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
        let entityValues: [String: Any] = ["email": email, "password": password]
        let entityName = "User"
        self.saveObject(entityName: entityName, entityValues: entityValues)
    }

    func getUser(email: String, password: String) throws -> User? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        let users = self.fetchObjectsFromDB(fetchRequest: fetchRequest) as? [User]
        guard let user = users?.filter({ $0.email == email}).first else { return nil }
        let aesEncrypter = AESEncrypter()
        let aesParameters = aesEncrypter.getAESParameters(from: aesEncrypter.secretKey)
        guard let encryptedpassword = user.password else { return nil }
        do {
            let decryptedPass = try aesEncrypter.aesDecrypt(encryptedData: encryptedpassword,
                                                            key: aesParameters.0,
                                                            iv: aesParameters.1)
            guard decryptedPass == password else { return nil }
            return user
        } catch let error as NSError {
            print("Could not decrypt user password for. \(email), \(error.userInfo)")
            return nil
        }
    }

    func getUsers() -> [User]? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        return self.fetchObjectsFromDB(fetchRequest: fetchRequest) as? [User]
    }
}


