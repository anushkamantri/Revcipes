import SwiftUI;

struct TextFieldWithError : View {
    private var prompt: String;
    private var text: Binding<String>;
    private var errorMessage: String;
    
    init(prompt: String, text: Binding<String>, errorMessage: String) {
        self.prompt = prompt;
        self.text = text;
        self.errorMessage = errorMessage;
    }
    
    var body: some View {
        VStack {
            TextField(prompt, text: text);
            Text(errorMessage);
        }
    }
}
