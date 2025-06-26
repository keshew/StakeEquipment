import SwiftUI

struct StakeOnboardingView: View {
    @StateObject var stakeOnboardingModel =  StakeOnboardingViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 44/255, green: 112/255, blue: 207/255), Color(red: 22/255, green: 42/255, blue: 58/255)], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            Image(stakeOnboardingModel.contact.arrayOfImageOnb[stakeOnboardingModel.currentIndex])
                .resizable()
                .frame(width: stakeOnboardingModel.currentIndex != 2 ? 360 : 280, height: stakeOnboardingModel.currentIndex != 2 ? 700 : 420)
                .position(stakeOnboardingModel.currentIndex != 2 ? CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2.1) : CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4))
            
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack(spacing: 40) {
                        Text(stakeOnboardingModel.contact.arrayOfTitleText[stakeOnboardingModel.currentIndex])
                            .PoppinsBold(size: 24)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: -20) {
                                ForEach(0..<stakeOnboardingModel.contact.arrayOfItemText.count, id: \.self) { index in
                                    Rectangle()
                                        .fill(Color(red: 26/255, green: 56/255, blue: 88/255))
                                        .overlay {
                                            HStack {
                                                Image(stakeOnboardingModel.contact.arrayOfImageItem[index])
                                                    .resizable()
                                                    .frame(width: index <= 1 ? 20 : 16, height: 24)
                                                
                                                Text(stakeOnboardingModel.contact.arrayOfItemText[index])
                                                    .Poppins(size: 13)
                                            }
                                        }
                                        .frame(width: 123, height: 54)
                                        .cornerRadius(56)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        
                        Button(action: {
                            if stakeOnboardingModel.currentIndex <= 1 {
                                withAnimation {
                                    stakeOnboardingModel.currentIndex += 1
                                }
                            } else {
                                
                            }
                        }) {
                            Rectangle()
                                .fill(Color(red: 45/255, green: 115/255, blue: 211/255))
                                .overlay {
                                    HStack {
                                        Text(stakeOnboardingModel.currentIndex != 2 ? "Next" : "Start")
                                            .Poppins(size: 16)
                                        
                                        Image(systemName: "arrow.right")
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundStyle(.white)
                                    }
                                }
                                .frame(height: 56)
                                .cornerRadius(16)
                                .padding(.horizontal, 40)
                                .shadow(color: .white.opacity(0.1), radius: 10, y: 10)
                        }
                    }
                    .padding(.vertical)
                    .background(
                        VStack(spacing: 0) {
                            Color(red: 22/255, green: 42/255, blue: 58/255).blur(radius: 10).opacity(0.8)
                            
                            Color(red: 22/255, green: 42/255, blue: 58/255).blur(radius: 10)
                        }
                    )
                    .padding(.top, stakeOnboardingModel.currentIndex != 2 ? 460 : 493)
                }
            }
            .scrollDisabled(UIScreen.main.bounds.width > 380  ? true : false)
        }
    }
}

#Preview {
    StakeOnboardingView()
}

