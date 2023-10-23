//
//  ContentView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewVM()
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                UserView()
            }
        }
        .fullScreenCover(isPresented: $viewModel.notSignedIn, content: {
            NavigationStack{
                LoginView()
            }
        })
    }
    
    @ViewBuilder
    func UserView() -> some View {
        TabView {
            InventoryListView(uid: viewModel.currentUserId)
                .tabItem {
                    Label("Inventory", systemImage: "basket")
                }
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "globe")
                }
            ProfileView(showSignInVoew: $showSignInView)
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
