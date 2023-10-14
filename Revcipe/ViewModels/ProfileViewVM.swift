//
//  ProfileViewVM.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation
import FirebaseAuth

class ProfileViewVM: ObservableObject {
    init() {
    }
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("TODO: FIX LOGOUT")
        }
    }
}
