//
//  InventoryViewVM.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation
import FirebaseFirestore

class InventoryListViewVM: ObservableObject {
    @Published var ingredients = [String]()
    @Published var showAddItemAlert = false
    init() {
        // fetch from the database
    }
    
    func removeIngredient(name: String) {
        ingredients = ingredients.filter(){$0 != name}
    }
}

class InventoryAddItemViewVM: ObservableObject {
    @Published var newItem: String = ""
    @Published var itemList: [String] = []
    
    private let uid: String
    private let db: Firestore
    
    init() {
        uid = AutenticationManager.shared.getCurrentUser()?.uid ?? ""
        db = DatabaseManager.shared.db
        fetchInventory()
    }
    private func fetchInventory() {
        let db = DatabaseManager.shared.db
        db.document("users/\(uid)/inventory/ingredients").getDocument { (doc, err) in
            if let doc = doc, doc.exists {
                if let data = doc.data() {
                    if let remoteList = data["list"] as? [String] {
                        self.itemList = remoteList
                    }
                }
            } else {
                return
            }
        }
    }
    
    func reset() {
        newItem = ""
    }
    
    func save() throws {
        let newItem = self.newItem.lowercased()
        guard !newItem.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw AddItemError.InvalidItemError("Input cannot be empty")
        }
        if self.itemList.contains(newItem) {
            throw AddItemError.ItemExistedError("\(self.newItem) is already in your list!")
        }
        itemList.append(newItem)
        db.document("users/\(uid)/inventory/ingredients").setData(["list":itemList])
        self.reset()
    }
}
