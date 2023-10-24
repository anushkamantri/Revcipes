//
//  AddItemView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct InventoryAddItemView: View {
    @Binding var showErrorAlert: Bool
    @Binding var errorAlertMsg: String
    
    @StateObject var viewModel: InventoryAddItemViewVM = InventoryAddItemViewVM()
    var body: some View {
        Group {
            TextField("New Ingredient...", text: $viewModel.newItem)
            Button("Cancel") {viewModel.reset()}
            Button("OK") {
                do {
                    try viewModel.save()
                } catch {
                    showErrorAlert = true
                    guard let error = error as? ErrorWithMessage else {
                        errorAlertMsg = "Unexpected Error"
                        return
                    }
                    errorAlertMsg = error.message
                }
            }
        }
    }
}
