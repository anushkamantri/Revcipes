//
//  ProfileView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewVM()
    var body: some View {
        NavigationView {
            
            
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Button {
                    viewModel.logout()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.blue)
                        Text("Log out").foregroundColor(.white)
                            .bold()
                    }
                }.frame(height: 30).padding(EdgeInsets())
            }.navigationTitle("Profile")
        }
        
    }
}

#Preview {
    ProfileView()
}
