//
//  CoreDataError.swift
//  Diary-CleanArchitecture
//
//  Copyright (c) 2023 Jeremy All rights reserved.
    

import Foundation

enum CoreDataError: Error {
    case fetchFailed
    case updateFailed
    case objectNotFound
}
