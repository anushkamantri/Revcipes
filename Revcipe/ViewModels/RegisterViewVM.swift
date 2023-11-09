//
//  RegisterViewVM.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation

final class RegisterViewVM: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var password_confirm = ""
    @Published var nameErrorMessage = ""
    @Published var emailErrorMessage = ""
    @Published var passwordErrorMessage = ""
    @Published var confirmPasswordErrorMessage = ""
    @Published var registerErrorMessage = ""
    @Published var cuisines: [String] = []

    
    init() {}
    func resetField() {
        name = ""
        email = ""
        password = ""
        password_confirm = ""
    }
    func resetErrorMessages() {
        nameErrorMessage = ""
        emailErrorMessage = ""
        passwordErrorMessage = ""
        confirmPasswordErrorMessage = ""
    }
    
    func register() throws{
        resetErrorMessages()
        guard validate() else {return}
        Task {
            let newUser = try await AutenticationManager.shared.createUser(name: name, email: email, password: password)
//            let newUser = try await AutenticationManager.shared.createUser(name: name, email: email, password: password, cuisines: cuisines)
            self.insertUserRecord(user: newUser)
        }
    }
    
    private func insertUserRecord(user: RevcipeUser) {
        let db = DatabaseManager.shared.db
        db.collection("users").document(user.uid).setData(user.asDictionary())
    }
    
    func validate() -> Bool {
        resetErrorMessages();
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
}
