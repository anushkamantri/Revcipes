//
//  InventoryViewVM.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation
import FirebaseFirestore

class InventoryListViewVM: ObservableObject {
    @Published var showAddItemAlert = false
    @Published var itemList = [String]()
    
    private var listener: (any ListenerRegistration)?
    fileprivate var uid: String?
    fileprivate let db: Firestore
    init() {
        self.db = DatabaseManager.shared.db
        guard let uid = AutenticationManager.shared.getCurrentUser()?.uid else {return}
        self.uid = uid
        listener = db.collection("users/\(uid)/inventory").addSnapshotListener({ [weak self] querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            self?.itemList = documents.map { $0.documentID.replacingOccurrences(of: "_", with: " ") }
        })
    }
    
    func updateListener() {
        print("JUST UPDATED LISTENER2")
        print("JUST UPDATED LISTENER")
        guard let uid = AutenticationManager.shared.getCurrentUser()?.uid else {return}
        self.uid = uid
        listener?.remove()
        listener = db.collection("users/\(uid)/inventory").addSnapshotListener({ [weak self] querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            self?.itemList = documents.map { $0.documentID.replacingOccurrences(of: "_", with: " ") }
        })
    }
    
    func remove(item: String) {
        
    }
    
    deinit {
        listener?.remove()
        print("LISTENER REMOVED")
    }
}

class InventoryAddItemViewVM: ObservableObject {
    @Published var newItem: String = ""
    unowned let parentInstance: InventoryListViewVM
    
    init(parentInstance: InventoryListViewVM) {
        print("ADD INITIALIZED")
        self.parentInstance = parentInstance
    }
    
    func reset() {
        newItem = ""
    }
    
    func save() throws {
        defer {
            self.reset()
        }
        guard !newItem.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw AddItemError.InvalidItemError("Input cannot be empty")
        }
        let newItem = self.newItem
            .trimmingCharacters(in: .whitespaces)
            .lowercased()
            .replacingOccurrences(of: " ", with: "_")
        if parentInstance.itemList.contains(newItem) {
            throw AddItemError.ItemExistedError("\(self.newItem) is already in your list!")
        }
        guard let uid = parentInstance.uid else {
            throw AuthError.NotLoggedInError("Not Logged In")
        }
        parentInstance.db.document("users/\(uid)/inventory/\(newItem)").setData([:])
    }
}
