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
            Header(title: "Register", subtitle: "Start Your Chef Journy⛵", angle: -15, background: .orange)
            // Login Form
            LoginForm()
            // Create Account
            LoginPrompt().padding(.bottom, 30)
            Spacer()
        }.navigationBarHidden(true)
    }
}

#Preview {
    RegisterView()
}
