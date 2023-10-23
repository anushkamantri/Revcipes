//
//  InventoryView.swift
//  Revcipe
//
//  Created by SamuelJ on 10/8/23.
//

import SwiftUI

struct InventoryListView: View {
    @StateObject var viewModel = InventoryViewVM();
    
    let uid: String
    init(uid: String) {
        self.uid = uid
    }
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.ingredients, id: \.self) {
                        ingredient in InventoryItemView(vm: viewModel, name: ingredient)
                    }
                    Section(footer:
                                HStack(alignment: .center) {
                        Spacer()
                        
                        AddInventoryItemView(vm: viewModel)
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
    InventoryListView(uid:  "30")
}
