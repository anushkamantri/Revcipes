//
//  LoginPrompt.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct RegisterGoLoginPrompt: View {
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        VStack {
            Text("Have an Account?")
            Button(action: {
                self.goBack()
            }) {
                Text("Log In")
            }
        }
    }
    func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    RegisterGoLoginPrompt()
}
