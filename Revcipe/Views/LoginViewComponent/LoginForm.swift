//
//  LoginForm.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct LoginForm: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        Form {
            TextField("Email Address", text: $email)
            
                .textFieldStyle(DefaultTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(DefaultTextFieldStyle())
            Button {
                // Attempt log in
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.blue)
                    Text("Log In").foregroundColor(.white)
                        .bold()
                }
            }
            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    LoginView()
}
