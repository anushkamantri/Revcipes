//
//  InventoryView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct InventoryListView: View {
    
    @State var showErrorAlert = false
    @State var errorAlertMsg = ""
    @StateObject var viewModel = InventoryListViewVM()
    
//    @FirestoreQuery var items: [IngredientList]
    
    init(uid: String) {
//        self._items = FirestoreQuery(collectionPath: "users/\(uid)/inventory/ingredients")
    }
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(["2", "3"], id: \.self) {
                        item in
                        Text(item)
//                            InventoryItemView(vm: viewModel, name: ingredient)
                        
                    }
                }
            }
            .navigationTitle("Inventory").foregroundColor(.black)
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button {
                            viewModel.showAddItemAlert = true
                        } label: {
                            Label("Record Manually", systemImage: "square.and.pencil")
                        }
                        Button {
                            print("OCR")
                        } label: {
                            Label("Scan Receipt", systemImage: "doc.viewfinder")
                        }
                        Button {
                            print("Image Recon")
                        } label: {
                            Label("Scan Fridge", systemImage: "camera")
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .alert("Add Item", isPresented: $viewModel.showAddItemAlert) {
                InventoryAddItemView(showErrorAlert: $showErrorAlert,
                                     errorAlertMsg: $errorAlertMsg)
            }
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Cannot add item 🤔"), message: Text(errorAlertMsg))
            }
        }
    }
}

#Preview {
    InventoryListView(uid:  "FJnoXjdEKNVvyyKN6uUAOO4EpJ92")
}
