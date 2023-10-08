//
//  RevcipeApp.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI
import FirebaseCore

@main
struct RevcipeApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
