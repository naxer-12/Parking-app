//
//  BaseRepository.swift
//  carpa
//
//  Created by MacBook Pro on 23/05/21.
//  Copyright © 2021 carpark. All rights reserved.
//

import Foundation
protocol BaseRepository {

    associatedtype T

    func createRecord(record: T)
    func getAll() -> [T]?
    func get(byIdentifier id: UUID) -> T?
    func updateRecord(record: T) -> Bool
    func deleteRecord(byIdentifier id: UUID) -> Bool
}
