//
//  CoreDataPersistentContainer.swift
//  01-diary
//
//  Copyright (c) 2023 Jeremy All rights reserved.


import CoreData

fileprivate enum Container {
    static let name = "Diary"
}

struct CoreDataPersistentContainer {
    static let shared = CoreDataPersistentContainer()
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: Container.name)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
