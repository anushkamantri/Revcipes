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
    
    func addIngredient(name: String) throws {
        if name == "" {
            throw MyError.runtimeError("Ingredient name cannot be empty")
        }
        else if ingredients.contains(name) {
            throw MyError.runtimeError(name + " already exists");
        }
        else {
            ingredients.append(name);
        }
    }
    
    func removeIngredient(name: String) {
        ingredients = ingredients.filter(){$0 != name}
    }
}
