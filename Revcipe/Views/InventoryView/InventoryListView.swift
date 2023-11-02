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
    
    //    private var items = [String]()
    
    init(uid: String) {
        
    }
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.itemList, id: \.self) { item in
                    Text(item)
                        .swipeActions() {
                            Button("Delete") {
                                print(item)
                                viewModel.remove(item: item)
                            }.tint(.red)
                        }
                }.listStyle(PlainListStyle())
            }
            .onAppear() {
                viewModel.updateListener()
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
                                     errorAlertMsg: $errorAlertMsg, viewModel: InventoryAddItemViewVM(parentInstance: viewModel)
                )
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
