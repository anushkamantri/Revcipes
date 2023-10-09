//
//  LoginView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
            VStack {
                // Header
                Header(title: "Revcipes", subtitle: "Let's Cook👨🏼‍🍳!", angle: 15, background: #colorLiteral(red: 0.37, green: 0.65, blue: 0.98, alpha: 1))
                // Login Form
                LoginForm()
                // Create Account
                RegisterPrompt().padding(.bottom, 30)
            }
    }
}

#Preview {
    LoginView()
}
