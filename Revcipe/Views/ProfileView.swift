//
//  ProfileView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewVM()
    @Binding var showSignInVoew:Bool
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    do {
                        try AutenticationManager.shared.logout()
                    } catch {
                        print("TODO: FIX LOGOUT")
                    }
                } label: {
                    Text("Sign Out")
                        .font(.headline)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(height: 55)
                        .foregroundStyle(.white)
                        .background(.red)
                        .cornerRadius(10)
                }.padding(EdgeInsets())
            }.navigationTitle("Profile")
            Spacer()
        }.padding()
    }
}

#Preview {
    ProfileView(showSignInVoew: .constant(true))
}
