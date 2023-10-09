//
//  ContentView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            NavigationView{
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
