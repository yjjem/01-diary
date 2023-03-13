//
//  CoreDataStack.swift
//  01-diary
//
//  Copyright (c) 2023 Jeremy All rights reserved.
    

import CoreData

final class CoreDataStack: CRUDable {
    let container: CoreDataPersistentContainer
    
    init(container: CoreDataPersistentContainer) {
        self.container = container
    }
    
    func create() {
        return
    }
    
    func read() {
        return
    }
    
    func update() {
        return
    }
    
    func delete() {
        return
    }
}
