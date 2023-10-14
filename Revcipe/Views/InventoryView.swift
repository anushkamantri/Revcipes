//
//  InventoryView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

let listOfIngredients = ["Rice", "Potato", "Onion", "Pesto"]
struct InventoryView: View {
    let uid: String
    init(uid: String) {
        self.uid = uid
    }
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(listOfIngredients, id: \.self) {
                        ingredientRow in Text(ingredientRow)
                    }.foregroundColor((Color(#colorLiteral(red: 0.37, green: 0.65, blue: 0.98, alpha: 1))))
                    Section(footer:
                                HStack(alignment: .center) {
                        Spacer()
                        
                        AddItemView()
                        Spacer()
                        
                    }) {
                        EmptyView()
                    }
                    
                }.navigationTitle("Inventory").foregroundColor(.black)
            }
        }
    }
}

#Preview {
    InventoryView(uid:  "30")
}
