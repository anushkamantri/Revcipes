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
    @Published var nameErrorMessage = ""
    @Published var emailErrorMessage = ""
    @Published var passwordErrorMessage = ""
    @Published var confirmPasswordErrorMessage = ""
    
    init() {}
    
    func resetErrorMessages() {
        emailErrorMessage = ""
        passwordErrorMessage = ""
        confirmPasswordErrorMessage = ""
    }
    
    func register() {
        resetErrorMessages()
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
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            nameErrorMessage = "Name cannot be empty"
            print("Name cannot be empty")
            return false
        }
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            emailErrorMessage = "Email cannot be empty"
            return false
        }
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            passwordErrorMessage = "Password cannot be empty"
            return false
        }
        guard !password_confirm.trimmingCharacters(in: .whitespaces).isEmpty else {
                confirmPasswordErrorMessage = "Please confirm password"
                return false
              }
        guard email.contains("@") && email.contains(".") else {
            emailErrorMessage = "Please enter a valid email"
            return false
        }
        guard password.count >= 6 else {
            passwordErrorMessage = "Please use a longer password"
            return false
        }
        guard password == password_confirm else {
            confirmPasswordErrorMessage = "Please make sure you have identical password"
            return false
        }
        return true
    }
}
