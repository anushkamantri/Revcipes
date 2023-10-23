//
//  User.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation
import FirebaseAuth

struct RevcipeUser: Codable {
    let uid: String
    let name: String?
    let email: String?
    let photoURL: String?
    let joined: TimeInterval
    
    init(name: String, user: User) {
        self.uid = user.uid
        self.name = name
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
        self.joined = Date().timeIntervalSince1970
    }
    
    init(user: User) {
        self.init(name: user.displayName ?? "Anonymous Celery", user: user)
    }
    
}
