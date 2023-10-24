//
//  LoginViewVM.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation

final class LoginViewVM: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func login() {
        guard validate() else {return}
        Task {
            do {
                try await AutenticationManager.shared.login(withEmail: email, password: password)
            } catch {
                DispatchQueue.main.async {[weak self] in
                    self?.errorMessage = "Incorrect email or password"
                }
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

