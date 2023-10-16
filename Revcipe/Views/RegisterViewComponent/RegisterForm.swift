//
//  RegisterForm.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct RegisterForm: View {
    @StateObject var viewModel = RegisterViewVM()
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                TextField("Your Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                Text(viewModel.nameErrorMessage).font(.system(size: 12, weight: .light)).foregroundColor(.red)
                
            }
            VStack(alignment: .leading) {
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                Text(viewModel.emailErrorMessage).font(.system(size: 12, weight: .light)).foregroundColor(.red)
            }
            VStack(alignment: .leading) {
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                Text(viewModel.passwordErrorMessage).font(.system(size: 12, weight: .light)).foregroundColor(.red)
            }
            VStack (alignment: .leading) {
                    SecureField("Confirm Password", text: $viewModel.password_confirm)
                    .textFieldStyle(DefaultTextFieldStyle())
                Text(viewModel.confirmPasswordErrorMessage).font(.system(size: 12, weight: .light)).foregroundColor(.red)
            }
            Button {
                viewModel.register()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.green)
                    Text("Create Account").foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    RegisterForm()
}
