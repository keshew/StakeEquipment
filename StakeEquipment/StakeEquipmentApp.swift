import SwiftUI

@main
struct StakeEquipmentApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaultsManager().isFirstLaunch() {
                StakeOnboardingView()
            } else {
                StakeTabBarView()
                    .onAppear() {
                        UserDefaultsManager().recordGameLaunchDate()
                    }
            }
        }
    }
}
