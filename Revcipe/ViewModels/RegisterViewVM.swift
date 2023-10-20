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
        clearErrorMessages();
        var valid = true;
        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            nameErrorMessage = "Name cannot be empty"
            print("Name cannot be empty")
            valid = false
        }
        if email.trimmingCharacters(in: .whitespaces).isEmpty {
            emailErrorMessage = "Email cannot be empty"
            valid = false
        }
        if password.trimmingCharacters(in: .whitespaces).isEmpty {
            passwordErrorMessage = "Password cannot be empty"
            valid = false
        }
        if password_confirm.trimmingCharacters(in: .whitespaces).isEmpty {
                confirmPasswordErrorMessage = "Please confirm password"
            valid = false
              }
        if !email.contains("@") || !email.contains(".") {
            emailErrorMessage = "Please enter a valid email"
            valid = false
        }
        if password.count < 6 {
            passwordErrorMessage = "Please use a longer password"
            valid = false
        }
        if password != password_confirm {
            confirmPasswordErrorMessage = "Please make sure you have identical password"
            valid = false
        }
        return valid
    }
    
    func clearErrorMessages() {
        nameErrorMessage = ""
        emailErrorMessage = ""
        passwordErrorMessage = ""
        confirmPasswordErrorMessage = ""
    }
}
