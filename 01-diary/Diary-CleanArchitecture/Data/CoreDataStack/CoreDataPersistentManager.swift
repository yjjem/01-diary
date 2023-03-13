//
//  CoreDataPersistentContainer.swift
//  Diary-CleanArchitecture
//
//  Copyright (c) 2023 Jeremy All rights reserved.


import CoreData

fileprivate enum Container {
    static let name = "Diary"
}

struct CoreDataPersistentManager {
    static let shared = CoreDataPersistentManager()
    static let testing = CoreDataPersistentManager(inMemory: true)
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: Container.name)
        if inMemory {
            let persistentStoreDescription = NSPersistentStoreDescription()
            persistentStoreDescription.type = NSInMemoryStoreType
            container.persistentStoreDescriptions = [persistentStoreDescription]
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
