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
        VStack {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                TabView {
                    InventoryView(uid: viewModel.currentUserId)
                        .tabItem {
                            Label("Inventory", systemImage: "basket")
                        }
                    AddItemView()
                        .tabItem {
                            Label("Add", systemImage: "plus")
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")
                        }
                }
            } else {
                NavigationView{
                    LoginView()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
