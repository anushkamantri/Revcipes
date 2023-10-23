import SwiftUI

struct InventoryItemView: View {
    var viewModel: InventoryViewVM;
    private let name: String;
    
    init(vm: InventoryViewVM, name: String) {
        self.viewModel = vm;
        self.name = name;
    }
    
    var body: some View {
        HStack {
            Text(name).padding();
            Spacer()
            Button("X", action: removeIngredient).padding().foregroundColor((Color(#colorLiteral(red: 0.37, green: 0.65, blue: 0.98, alpha: 1))));
        }
    }
    
    func removeIngredient() {
        viewModel.removeIngredient(name: self.name)
    }
}

#Preview {
    InventoryItemView(vm: InventoryViewVM(), name: "preview")
}
