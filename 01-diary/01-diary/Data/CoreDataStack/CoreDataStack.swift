//
//  CoreDataStack.swift
//  01-diary
//
//  Copyright (c) 2023 Jeremy All rights reserved.


import CoreData

enum CoreDataError: Error {
    case fetchFailed
    case updateFailed
}

final class CoreDataStack: CRUDable {
    typealias ReqeustableModel =  NSManagedObject
    private let manager: CoreDataPersistentManager
    private let context: NSManagedObjectContext
    
    init(manager: CoreDataPersistentManager) {
        self.manager = manager
        self.context = manager.container.viewContext
    }
    
    func create() throws {
        let newDiary = Diary(context: context)
        newDiary.createdAt = Date()
        try update()
    }
    
    func read() throws -> [Diary] {
        do {
            let requestedData = try context.fetch(Diary.fetchRequest())
            return requestedData
        } catch {
            throw CoreDataError.fetchFailed
        }
    }
    
    func update() throws {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            throw CoreDataError.updateFailed
        }
    }
    
    func delete(object: Diary) {
        context.delete(object)
    }
}
