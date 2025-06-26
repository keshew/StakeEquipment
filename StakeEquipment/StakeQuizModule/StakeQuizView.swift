import SwiftUI

struct StakeQuizView: View {
    @StateObject var stakeQuizModel =  StakeQuizViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    StakeQuizView()
}

