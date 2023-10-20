//
//  AddItemView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct AddItemView: View {
    var viewModel: InventoryViewVM;
    @State private var showingAlert = false
    @State private var ingredientName = ""
    @State private var buttonPrompt = "Add Ingredient";
    
    init(vm: InventoryViewVM) {
        viewModel = vm;
    }
    
    var body: some View {
        Button(buttonPrompt) {
            showingAlert.toggle()
        }
        .frame(width: 0.8*UIScreen.main.bounds.width)
        .padding(_:10)
        .foregroundColor(.white)
        .background(Color(#colorLiteral(red: 0.37, green: 0.65, blue: 0.98, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
        
        .alert("Enter an ingredient", isPresented: $showingAlert) {
            TextField("Enter an ingredient", text: $ingredientName)
            Button("OK", action: submit)
        }
    }
    
    func submit() {
        viewModel.addIngredient(name: ingredientName);
        ingredientName = "";
    }
}

#Preview {
    AddItemView(vm: InventoryViewVM())
}
