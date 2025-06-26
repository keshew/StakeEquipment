import SwiftUI

class StakeGuideViewModel: ObservableObject {
    let contact = StakeGuideModel()
    @Published var pickedGallery = Gallery(image: "", title: "", text: "", isDone: false)
    @Published var arrayOfGallery: [Gallery] = [] {
        didSet {
            saveToUserDefaults()
        }
    }
    
    private let userDefaultsKey = "GalleryState"
    
    init() {
        loadFromUserDefaults()
    }
    
    func toggleDone(for index: Int) {
        guard arrayOfGallery.indices.contains(index) else { return }
        arrayOfGallery[index].isDone.toggle()
    }
    
    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(arrayOfGallery) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([Gallery].self, from: data) {
            arrayOfGallery = decoded
        } else {
            arrayOfGallery = [
                Gallery(image: "1level1", title: "How to wash a football uniform", text: "Turn it inside out, wash it in cold water on a delicate mode. No air conditioning!", isDone: false),
                Gallery(image: "guide2", title: "How to remove the smell from the mold", text: "Soak in soda or vinegar before washing — this is how bacteria are destroyed.", isDone: false),
                Gallery(image: "guide3", title: "Shoe Care", text: "Clean by hand, wipe dry, do not run on the battery. Keep it with paper inside.", isDone: false),
                Gallery(image: "guide4", title: "How to wash gaiters and shields", text: "Gaiters-separately from the rest. Shields-wipe with a damp cloth and soap.", isDone: false),
                Gallery(image: "guide5", title: "How to dry the goalkeeper's gloves", text: "Don't twist it! Wrap it in a towel, away from the sun.", isDone: false),
                Gallery(image: "guide6", title: "Post-match processing", text: "Don't throw your uniform in your bag — air it out first. It is better to wash immediately.", isDone: false)
            ]
        }
    }
}
