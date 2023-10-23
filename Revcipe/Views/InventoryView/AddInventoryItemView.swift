//
//  AddItemView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct AddInventoryItemView: View {
    var viewModel: InventoryViewVM;
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var ingredientName = ""
    @State private var buttonPrompt = "Add Ingredient";
    @State private var errorMessage = ""
    
    init(vm: InventoryViewVM) {
        viewModel = vm;
    }
    
    var body: some View {
        VStack{
            Button(buttonPrompt) {
                showingAlert1.toggle()
            }
            .frame(width: 0.8*UIScreen.main.bounds.width)
            .padding(_:10)
            .foregroundColor(.white)
            .background(Color(#colorLiteral(red: 0.37, green: 0.65, blue: 0.98, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            // temporary hack for re-displaying dialog after user inputs invalid input
            .alert(errorMessage == "" ? "Enter an ingredient" : errorMessage, isPresented: $showingAlert1) {
                TextField("Enter an ingredient", text: $ingredientName)
                Button("Cancel", action: {errorMessage = ""})
                Button("OK", action: submit1)
            }
            .alert(errorMessage == "" ? "Enter an ingredient" : errorMessage, isPresented: $showingAlert2) {
                TextField("Enter an ingredient", text: $ingredientName)
                Button("Cancel", action: {errorMessage = ""})
                Button("OK", action: submit2)
                    .alert("Enter an ingredient", isPresented: $showingAlert2){}
            }
        }
    }
    
    func submit1() {
        do {
            try viewModel.addIngredient(name: ingredientName);
            errorMessage = ""
        }
        catch MyError.runtimeError(let msg) {
            errorMessage = msg
            showingAlert2 = true
        }
        catch {
            errorMessage = "Error adding ingredient"
            showingAlert2 = true
        }
        ingredientName = "";
    }
    
    func submit2() {
        do {
            try viewModel.addIngredient(name: ingredientName);
            errorMessage = ""
        }
        catch MyError.runtimeError(let msg) {
            errorMessage = msg
            showingAlert1 = true
        }
        catch {
            errorMessage = "Error adding ingredient"
            showingAlert1 = true
        }
        ingredientName = "";
    }
}

#Preview {
    AddInventoryItemView(vm: InventoryViewVM())
}
