//
//  RegisterPrompt.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct LoginGoRegisterPrompt: View {
    @State private var showingSignIn = false
    var body: some View {
        VStack {
            Text("New User?")
            NavigationLink("Create an Account", destination: RegisterView())
        }
    }
    
}

#Preview {
    LoginView()
}
