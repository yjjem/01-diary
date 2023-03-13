//
//  TestCoreDataStack.swift
//  Diary-CleanArchitecture
//
//  Copyright (c) 2023 Jeremy All rights reserved.

@testable import Diary_CleanArchitecture
import XCTest
import CoreData

final class TestCoreDataStack: XCTestCase {
    
    var sut: CoreDataStack!

    override func setUpWithError() throws {
        sut = CoreDataStack(manager: .testing)
    }

    override func tearDownWithError() throws {
        sut.context.reset()
        sut = nil
    }

    func test_새로운_일기_1개가_제대로_생성되는지() throws {
        let newDiary = DiaryData(
            title: "Hello",
            text: "Text",
            imageData: nil,
            iconImageData: nil,
            createdAt: .init(),
            uuid: .init()
        )
        try sut.create(using: newDiary)
        
        let fetchResult = try sut.read()
        print(fetchResult)
        XCTAssertNoThrow(fetchResult)
        XCTAssertEqual(fetchResult.count, 1)
    }
}
