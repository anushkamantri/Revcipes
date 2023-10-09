//
//  LoginForm.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//
import SwiftUI

struct LoginForm: View {
    @StateObject var viewModel = LoginViewVM()
    var body: some View {
        VStack{
            Form {
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                Button {
                    viewModel.login()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.blue)
                        Text("Log In").foregroundColor(.white)
                            .bold()
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }
                
            }
            
        }
    }
}

#Preview {
    LoginView()
}
