//
//  LoginView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI
extension Color {
    
}

struct LoginView: View {
    var body: some View {
        VStack {
            // Header
            Header(title: "Revcipes", subtitle: "Let's Cook👨🏼‍🍳!", angle: 10, background: .lakeBlue)
            // Login Form
            LoginForm()
            // Create Account
            LoginGoRegisterPrompt().padding(.bottom, 30)
        }
    }
}

#Preview {
    LoginView()
}
