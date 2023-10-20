//
//  InventoryViewVM.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import Foundation

// View Model for Invertory View
// Primary Tab
class InventoryViewVM: ObservableObject {
    @Published var ingredients: [String] = [];
    init() {
    }
    
    func addIngredient(name: String) {
        ingredients.append(name);
    }
}
