import Foundation
import FirebaseAuth

class MainViewVM: ObservableObject {
    @Published var currentUserId: String = ""
    @Published var notSignedIn: Bool = true

    @Published var userCuisines: [String] = []
    @Published var notChoseCuisines: Bool = true

    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if let user = user {
                self?.currentUserId = user.uid
                self?.notSignedIn = false
                if let savedCuisines = UserDefaults.standard.stringArray(forKey: "userCuisines") {
                    self?.userCuisines = savedCuisines
                } else {
                    self?.userCuisines = []
                }
            } else {
                self?.currentUserId = ""
                self?.notSignedIn = true
                // Reset userCuisines when the user is not signed in.
                self?.userCuisines = []
            }
            self?.notChoseCuisines = self?.userCuisines.isEmpty ?? true
        }
        self.currentUserId = Auth.auth().currentUser?.uid ?? ""
        self.notSignedIn = self.currentUserId.isEmpty
        self.loadUserCuisines()
    }
    
    private func loadUserCuisines() {
        if let savedCuisines = UserDefaults.standard.stringArray(forKey: "userCuisines") {
            userCuisines = savedCuisines
            notChoseCuisines = userCuisines.isEmpty
        }
    }
    
    private func saveUserCuisines() {
        UserDefaults.standard.set(userCuisines, forKey: "userCuisines")
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
        
        // Reset userCuisines when the user signs out.
        userCuisines = []
        notChoseCuisines = true

        // Clear the saved userCuisines in UserDefaults as well
        UserDefaults.standard.removeObject(forKey: "userCuisines")
    }
}
