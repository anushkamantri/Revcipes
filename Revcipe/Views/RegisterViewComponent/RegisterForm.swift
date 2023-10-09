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
            TextField("Your Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            SecureField("Confirm Password", text: $viewModel.password_confirm)
                .textFieldStyle(DefaultTextFieldStyle())
            Button {
                viewModel.register()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.green)
                    Text("Create Account").foregroundColor(.white)
                        .bold()
                }
            }
            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    RegisterForm()
}
