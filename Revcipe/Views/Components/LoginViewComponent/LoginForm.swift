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
            TextField("Email...", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .onChange(of: viewModel.email) {_ in
                    viewModel.password = ""
                }
            Button {
                viewModel.login()
            } label: {
                Text("Log In")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
        }.padding()
        Spacer()
    }
}

#Preview {
    LoginView()
}
