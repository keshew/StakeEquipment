import SwiftUI

struct StakeQuizView: View {
    @StateObject var viewModel = StakeQuizViewModel()
    @State private var showResult: Bool = false
    
    var body: some View {
        ZStack {
            Color(red: 22/255, green: 42/255, blue: 57/255).ignoresSafeArea()
            if showResult {
                QuizResultView(viewModel: viewModel, onRetake: {
                    viewModel.startQuiz()
                    showResult = false
                })
            } else {
                QuizContentView(viewModel: viewModel, onFinish: {
                    showResult = true
                })
            }
        }
    }
}

struct QuizContentView: View {
    @ObservedObject var viewModel: StakeQuizViewModel
    var onFinish: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                // 1. Subtitle всегда
                Text("Wash like a Champion")
                    .PoppinsBold(size: 17, color: .white)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 18)
                    .background(Color(red: 32/255, green: 56/255, blue: 87/255))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 24)
                    .padding(.horizontal, 20)
                // 2. Цитата всегда
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "book.fill")
                        .foregroundColor(Color(red: 60/255, green: 120/255, blue: 255/255))
                    Text("\"Winning doesn't start on the field, it starts in the laundry room.\"")
                        .Poppins(size: 13, color: .white.opacity(0.8))
                }
                .padding(.horizontal, 20)
                .padding(.top, 6)
                .padding(.bottom, 8)
                // 3. Вопрос всегда слева, жирный
                Text(viewModel.questions[viewModel.currentIndex].question)
                    .PoppinsBold(size: 18, color: .white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)
                    .padding(.top, 20)
                VStack(spacing: 12) {
                    ForEach(0..<viewModel.questions[viewModel.currentIndex].answers.count, id: \.self) { i in
                        QuizAnswerRow(
                            letter: String(UnicodeScalar(65 + i)!),
                            text: viewModel.questions[viewModel.currentIndex].answers[i],
                            isSelected: viewModel.selectedAnswers[viewModel.currentIndex] == i,
                            state: viewModel.answerState[i],
                            action: { viewModel.selectAnswer(i) }
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                // Explanation
                if viewModel.isAnswered,
                   viewModel.currentIndex < viewModel.questions.count,
                   viewModel.currentIndex < viewModel.selectedAnswers.count {
                    Rectangle()
                        .fill(Color(red: 32/255, green: 56/255, blue: 87/255))
                        .overlay {
                            HStack(alignment: .top, spacing: 8) {
                                ZStack(alignment: .leading) {
                                    Circle()
                                        .fill(Color(red: 30/255, green: 60/255, blue: 120/255))
                                        .frame(width: 28, height: 28)
                                    Image(systemName: "info.circle.fill")
                                        .foregroundColor(Color(red: 60/255, green: 120/255, blue: 255/255))
                                }
                                .padding(.leading)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Explanation:")
                                        .PoppinsBold(size: 13, color: .white)
                                    Text(viewModel.questions[viewModel.currentIndex].explanation)
                                        .Poppins(size: 13, color: .white.opacity(0.8))
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    .cornerRadius(12)
                    .padding(.top, 18)
                    .frame(height: 85)
                    .padding(.horizontal, 20)
                }
                // Индикатор прогресса — по 4 овала с номерами
                let block = viewModel.currentIndex / 4
                HStack(spacing: 10) {
                    Capsule()
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        .background(Color.clear)
                        .overlay(
                            HStack(spacing: 10) {
                                ForEach(0..<4) { j in
                                    let idx = block * 4 + j
                                    if idx < viewModel.totalQuestions {
                                        ZStack {
                                            Circle()
                                                .fill(idx == viewModel.currentIndex ? Color(red: 60/255, green: 120/255, blue: 255/255) : Color(red: 32/255, green: 56/255, blue: 87/255))
                                                .frame(width: 36, height: 36)
                                            Text("\(idx+1)")
                                                .PoppinsBold(size: 16, color: .white.opacity(idx == viewModel.currentIndex ? 1 : 0.7))
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 4)
                        )
                        .frame(width: 210, height: 54)
                }
                .padding(.top, 16)
            }
            Spacer()
            Button(action: {
                if viewModel.currentIndex == viewModel.totalQuestions - 1 {
                    onFinish()
                } else {
                    viewModel.nextQuestion()
                }
            }) {
                HStack {
                    Spacer()
                    Text(viewModel.currentIndex == viewModel.totalQuestions - 1 ? "Finish Quiz" : "Next Question  →")
                        .PoppinsBold(size: 15, color: .white)
                    Spacer()
                }
                .padding()
                .background(viewModel.isAnswered ? Color(red: 45/255, green: 115/255, blue: 211/255) : Color(red: 32/255, green: 56/255, blue: 87/255))
                .cornerRadius(12)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 84)
            .disabled(!viewModel.isAnswered)
            

        }
    }
}

struct QuizAnswerRow: View {
    let letter: String
    let text: String
    let isSelected: Bool
    let state: AnswerState
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(state == .wrong && isSelected ? Color.red : Color(red: 32/255, green: 56/255, blue: 87/255))
                        .frame(width: 32, height: 32)
                    Text(letter)
                        .PoppinsBold(size: 16, color: .white)
                }
                Text(text)
                    .PoppinsBold(size: 15, color: .white)
                Spacer()
                if isSelected {
                    if state == .correct {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color(red: 60/255, green: 120/255, blue: 255/255))
                    } else if state == .wrong {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isSelected ? (state == .correct ? Color(red: 60/255, green: 120/255, blue: 255/255) : Color.red) : Color.white.opacity(0.1),
                        lineWidth: 2
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(isSelected && state == .wrong ? Color.red.opacity(0.15) : Color(red: 24/255, green: 48/255, blue: 72/255))
                    )
            )
        }
        .disabled(state != .none)
    }
}

struct QuizResultView: View {
    @ObservedObject var viewModel: StakeQuizViewModel
    var onRetake: () -> Void
    @State var isTab = false
    @State var isSharePresented = false
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                Text("Quiz Results")
                    .PoppinsBold(size: 20, color: .white)
                
                ZStack {
                    Circle()
                        .fill(Color(red: 32/255, green: 56/255, blue: 87/255))
                        .frame(width: 80, height: 80)
                    Image(systemName: "trophy.fill")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(Color(red: 60/255, green: 120/255, blue: 255/255))
                }
                .padding(.top, 12)
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(red: 32/255, green: 56/255, blue: 87/255))
                    VStack(spacing: 2) {
                        Text("\(viewModel.correctCount())/16")
                            .PoppinsBold(size: 32, color: Color(red: 60/255, green: 120/255, blue: 255/255))
                        Text("Outstanding Score!")
                            .PoppinsBold(size: 16, color: .white)
                        Text("You're a true football equipment expert")
                            .Poppins(size: 13, color: .white.opacity(0.8))
                    }
                    .padding(16)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                // Темы
                VStack(spacing: 10) {
                    ForEach(viewModel.topics) { topic in
                        HStack(spacing: 14) {
                            ZStack {
                                Circle()
                                    .fill(Color(red: 30/255, green: 60/255, blue: 120/255))
                                    .frame(width: 28, height: 28)
                                Text("\(topic.number)")
                                    .PoppinsBold(size: 15, color: .white)
                            }
                            VStack(alignment: .leading, spacing: 2) {
                                Text(topic.title)
                                    .PoppinsBold(size: 15, color: .white)
                                Text(topic.subtitle)
                                    .Poppins(size: 12, color: .white.opacity(0.7))
                            }
                            Spacer()
                            let score = viewModel.scoreForTopic(topic)
                            Text("\(score)/4")
                                .PoppinsBold(size: 15, color: score == 4 ? Color(red: 60/255, green: 120/255, blue: 255/255) : .red)
                        }
                        .padding(10)
                        .background(Color(red: 24/255, green: 48/255, blue: 72/255))
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                // Кнопки
                Button(action: { onRetake() }) {
                    HStack {
                        Spacer()
                        Text("Retake Quiz")
                            .PoppinsBold(size: 15, color: .white)
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 45/255, green: 115/255, blue: 211/255))
                    .cornerRadius(12)
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                Button(action: {}) {
                    HStack {
                        Spacer()
                        Text("Share Results")
                            .PoppinsBold(size: 15, color: .white.opacity(0.7))
                            .onTapGesture {
                                isSharePresented = true
                            }
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 32/255, green: 56/255, blue: 87/255))
                    .cornerRadius(12)
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                Spacer()
                
                Color.clear.frame(height: 80)
            }
        }
        .scrollDisabled(UIScreen.main.bounds.width > 380  ? true : false)
        .onAppear() {
            UserDefaultsManager().markAchievement3Done()
            UserDefaultsManager().addTenPoints()
        }
        .sheet(isPresented: $isSharePresented) {
            ShareSheet(items: ["\(viewModel.correctCount())"])
        }
    }
}

#Preview {
    StakeQuizView()
}

