import SwiftUI

class StakeQuizViewModel: ObservableObject {
    @Published var questions: [StakeQuizQuestion] = []
    @Published var currentIndex: Int = 0
    @Published var selectedAnswers: [Int?] = Array(repeating: nil, count: 16)
    @Published var showResult: Bool = false
    @Published var isAnswered: Bool = false
    @Published var isCorrect: Bool = false
    @Published var answerState: [AnswerState] = Array(repeating: .none, count: 3)
    
    let totalQuestions = 16
    
    init() {
        startQuiz()
    }
    
    func startQuiz() {
        questions = StakeQuizModel.allQuestions.shuffled().prefix(totalQuestions).map { $0 }
        currentIndex = 0
        selectedAnswers = Array(repeating: nil, count: totalQuestions)
        showResult = false
        isAnswered = false
        isCorrect = false
        answerState = Array(repeating: .none, count: 3)
    }
    
    func selectAnswer(_ index: Int) {
        guard !isAnswered else { return }
        selectedAnswers[currentIndex] = index
        isAnswered = true
        let correct = questions[currentIndex].correctIndex == index
        isCorrect = correct
        for i in 0..<answerState.count {
            if i == index {
                answerState[i] = correct ? .correct : .wrong
            } else {
                answerState[i] = .none
            }
        }
    }
    
    func nextQuestion() {
        if currentIndex < totalQuestions - 1 {
            currentIndex += 1
            isAnswered = false
            isCorrect = false
            answerState = Array(repeating: .none, count: 3)
        } else {
            showResult = true
        }
    }
    
    func correctCount() -> Int {
        zip(questions, selectedAnswers).filter { q, a in a == q.correctIndex }.count
    }
}

enum AnswerState {
    case none, correct, wrong
}

struct StakeQuizTopic: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let subtitle: String
    let questionRange: Range<Int>
}

extension StakeQuizViewModel {
    // Темы жёстко по 4 вопроса, как на макете
    var topics: [StakeQuizTopic] {
        [
            .init(number: 1, title: "Wash like a Champion", subtitle: "Equipment washing", questionRange: 0..<4),
            .init(number: 2, title: "Drying and Storage", subtitle: "Proper care methods", questionRange: 4..<8),
            .init(number: 3, title: "Fabric Knowledge", subtitle: "Materials & maintenance", questionRange: 8..<12),
            .init(number: 4, title: "Equipment Mastery", subtitle: "Professional care", questionRange: 12..<16)
        ]
    }
    
    func scoreForTopic(_ topic: StakeQuizTopic) -> Int {
        topic.questionRange.reduce(0) { acc, idx in
            guard idx < questions.count, idx < selectedAnswers.count else { return acc }
            return acc + (selectedAnswers[idx] == questions[idx].correctIndex ? 1 : 0)
        }
    }
}
