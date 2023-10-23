//
//  MainViewVM.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation
import FirebaseAuth

class MainViewVM: ObservableObject {
    @Published var currentUserId: String = ""
    @Published var notSignedIn: Bool = true
    private var handler: AuthStateDidChangeListenerHandle?
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] (auth, user) in
            self?.currentUserId = user?.uid ?? ""
            self?.notSignedIn = self?.currentUserId == ""
        }
        self.currentUserId = Auth.auth().currentUser?.uid ?? ""
        self.notSignedIn = self.currentUserId == ""

    }
}
