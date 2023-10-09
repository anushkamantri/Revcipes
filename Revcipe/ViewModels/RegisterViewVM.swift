//
//  RegisterViewVM.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class RegisterViewVM: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var password_confirm = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else {return}
        Auth.auth().createUser(withEmail: email, password: password) {[weak self]result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id:id, name:name, email: email, joined:Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !password_confirm.trimmingCharacters(in: .whitespaces).isEmpty else {
                errorMessage = "Please fill in all the field"
                return false
              }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Please use a longer password"
            return false
        }
        guard password == password_confirm else {
            errorMessage = "Please make sure you have identical password"
            return false
        }
        return true
    }
}
