//
//  CoreDataStack.swift
//  Diary-CleanArchitecture
//
//  Copyright (c) 2023 Jeremy All rights reserved.


import CoreData

final class CoreDataStack: CRUDable {
    let context: NSManagedObjectContext
    let manager: CoreDataPersistentManager
    
    init(manager: CoreDataPersistentManager, inMemory: Bool = false) {
        self.manager = manager
        self.context = manager.container.viewContext
    }
    
    func create(using data: DiaryData) throws {
        let newDiary = Diary(context: context)
        newDiary.title = data.title
        newDiary.text = data.text
        newDiary.image = data.imageData
        newDiary.iconImage = data.iconImageData
        newDiary.createdAt = data.createdAt
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
