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
                InventoryView()
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
