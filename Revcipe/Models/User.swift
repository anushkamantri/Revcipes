//
//  User.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
