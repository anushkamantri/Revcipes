//
//  RegisterView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            // Header
            Header(title: "Register", subtitle: "Start Your Chef Journey⛵", angle: -15, background: .orange)
            // Login Form
            RegisterForm()
            // Create Account
            RegisterGoLoginPrompt().padding(.bottom, 30)
        }.navigationBarHidden(true)
    }
}

#Preview {
    RegisterView()
}
