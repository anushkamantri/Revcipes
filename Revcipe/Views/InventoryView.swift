//
//  InventoryView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

let listOfIngredients = ["Rice", "Potato", "Onion", "Pesto"]
struct InventoryView: View {
    var body: some View {
        List {
            ForEach(listOfIngredients, id: \.self) {
                ingredientRow in Text(ingredientRow)
            }
        }
    }
}

#Preview {
    InventoryView()
}
