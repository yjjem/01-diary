//
//  CRUDable.swift
//  01-diary
//
//  Copyright (c) 2023 Jeremy All rights reserved.
    

import Foundation

protocol CRUDable {
    func create() throws
    func read() throws -> [Diary]
    func update() throws
    func delete(object: Diary)
}
