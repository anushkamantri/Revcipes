//
//  RegisterPrompt.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct RegisterPrompt: View {
    var body: some View {
        VStack {
            Text("New User?")
            NavigationLink(destination: RegisterView()) {
                Text("Create an Account")
            }.navigationBarHidden(true)
        }
    }
    
}

#Preview {
    LoginView()
}
