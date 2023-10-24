//
//  Autentication.swift
//  Revcipe
//
//  Created by SamuelJ on 10/22/23.
//

import FirebaseAuth

final class AutenticationManager {
    static let shared = AutenticationManager()
    private init() {}
    
    func createUser(name: String, email: String, password: String) async throws -> RevcipeUser {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return RevcipeUser(name: name, user: authDataResult.user)
    }
    
    func login(withEmail email: String, password: String) async throws -> Void {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func getCurrentUser() -> RevcipeUser? {
        guard let currentUser = Auth.auth().currentUser else {
            return nil
        }
        return RevcipeUser(user: currentUser)
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
}
