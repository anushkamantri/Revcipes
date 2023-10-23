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
        VStack {
            VStack(alignment: .leading) {
                TextField("Your Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                Text(viewModel.nameErrorMessage).font(.system(size: 12, weight: .light)).foregroundColor(.red)
                
            }
            VStack(alignment: .leading) {
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                Text(viewModel.emailErrorMessage).font(.system(size: 12, weight: .light)).foregroundColor(.red)
            }
            VStack(alignment: .leading) {
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                Text(viewModel.passwordErrorMessage).font(.system(size: 12, weight: .light)).foregroundColor(.red)
            }
            VStack (alignment: .leading) {
                SecureField("Confirm Password", text: $viewModel.password_confirm)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .onChange(of: viewModel.password) {_ in
                        viewModel.password_confirm = ""
                    }
                Text(viewModel.confirmPasswordErrorMessage).font(.system(size: 12, weight: .light)).foregroundColor(.red)
            }
            Button {
                do {
                    try viewModel.register()
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("Create User")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .background(.green)
                    .cornerRadius(10)
            }
            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
        }.padding()
        Spacer()
    }
}

#Preview {
    RegisterForm()
}
