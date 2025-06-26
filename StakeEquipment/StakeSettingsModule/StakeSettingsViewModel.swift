import SwiftUI

class StakeSettingsViewModel: ObservableObject {
    let contact = StakeSettingsModel()
    
    @Published var sound: Bool {
        didSet {
            UserDefaults.standard.set(sound, forKey: "sound")
        }
    }
    
    @Published var vibration: Bool {
        didSet {
            UserDefaults.standard.set(vibration, forKey: "vibration")
        }
    }
    
    init() {
        self.vibration = UserDefaults.standard.bool(forKey: "vibration")
        self.sound = UserDefaults.standard.bool(forKey: "sound")
    }
    
}
