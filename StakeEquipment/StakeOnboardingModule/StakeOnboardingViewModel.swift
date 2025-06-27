import SwiftUI

class StakeOnboardingViewModel: ObservableObject {
    let contact = StakeOnboardingModel()
    @Published var currentIndex = 0
    @Published var isTab = false
}
