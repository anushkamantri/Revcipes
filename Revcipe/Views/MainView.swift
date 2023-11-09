//
//  ContentView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewVM()
    
    var body: some View {
        ZStack {
            NavigationView {
                UserView()
            }.blur(radius: viewModel.notSignedIn ? 10 : 0)
        }
        .fullScreenCover(isPresented: $viewModel.notSignedIn, content: {
            NavigationStack{
                LoginView()
            }
        }
        )
        .fullScreenCover(isPresented: $viewModel.notChoseCuisines, content: {
            TasteEvalView(viewModel: viewModel)
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
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
