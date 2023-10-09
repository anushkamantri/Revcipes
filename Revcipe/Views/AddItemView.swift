//
//  AddItemView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct AddItemView: View {
    @State private var showingAlert = false
    @State private var ingredientName = ""
    @State private var buttonPrompt = "What can I cook today?";
    
    var body: some View {
        Button(buttonPrompt) {
            showingAlert.toggle()
        }
        .padding()
        .foregroundColor(.white)
        .background(Color(#colorLiteral(red: 0.37, green: 0.65, blue: 0.98, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
        .alert("Enter an ingredient", isPresented: $showingAlert) {
            TextField("Enter an ingredient", text: $ingredientName)
            Button("OK", action: submit)
        }
    }
    
    func submit() {
        print("You entered \(ingredientName)")
    }
}

#Preview {
    AddItemView()
}
