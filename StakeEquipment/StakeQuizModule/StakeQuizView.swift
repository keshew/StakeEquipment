import SwiftUI

struct StakeQuizView: View {
    @StateObject var StakeQuizModel =  StakeQuizViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    StakeQuizView()
}

