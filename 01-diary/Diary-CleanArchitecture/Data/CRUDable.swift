//
//  CRUDable.swift
//  Diary-CleanArchitecture
//
//  Copyright (c) 2023 Jeremy All rights reserved.
    

import Foundation

protocol CRUDable {
    func create(using data: DiaryData) throws
    func read() throws -> [DiaryData]
    func update() throws
    func delete(object: Diary) 
}
