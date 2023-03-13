//
//  CoreDataStack.swift
//  Diary-CleanArchitecture
//
//  Copyright (c) 2023 Jeremy All rights reserved.


import CoreData

enum CoreDataError: Error {
    case fetchFailed
    case updateFailed
    case objectNotFound
}

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
        newDiary.createdAt = Date()
        try update()
    }
    
    func read() throws -> [DiaryData] {
        do {
            let requestedData = try context.fetch(Diary.fetchRequest())
                .map {
                    return DiaryData(
                        title: $0.title,
                        text: $0.text,
                        imageData: $0.iconImage,
                        iconImageData: $0.iconImage,
                        createdAt: $0.createdAt,
                        uuid: $0.uuid
                    )
                }
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
