//
//  LoginViewVM.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//
import FirebaseAuth
import Foundation

final class LoginViewVM: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func login() {
        errorMessage = ""
        guard validate() else {return}
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if error != nil {
                self?.errorMessage = "Incorrect email or password"
            }
        }
    }
    
    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        return true
    }
}

