import SwiftUI

class StakeHomeViewModel: ObservableObject {
    private let model = StakeHomeModel()
    @Published var isProgress = false
}
