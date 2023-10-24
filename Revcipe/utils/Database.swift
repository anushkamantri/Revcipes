//
//  Database.swift
//  Revcipe
//
//  Created by SamuelJ on 10/23/23.
//

import FirebaseFirestore

final class DatabaseManager {
    static let shared = DatabaseManager()
    private init() {}
    private (set) var db = Firestore.firestore()
}
