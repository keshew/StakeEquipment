import SwiftUI

struct StakeProgressView: View {
    @StateObject var stakeProgressModel =  StakeProgressViewModel()
    @Environment(\.presentationMode) var presentationMode
    let achievementsDone = [UserDefaultsManager().isAchievement1Done(), UserDefaultsManager().isAchievement2Done(), UserDefaultsManager().isAchievement3Done(), UserDefaultsManager().isAchievement4Done()]
    
    let manager = UserDefaultsManager()
    var body: some View {
        ZStack {
            Color(red: 22/255, green: 42/255, blue: 57/255).ignoresSafeArea()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Circle()
                                .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                                .frame(width: 40, height: 40)
                                .overlay {
                                    Image(systemName: "arrow.left")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        Text("Progress")
                            .PoppinsBold(size: 24)
                            .padding(.trailing, 50)
                            
                        
                        Spacer()
                    }
                    
                    Rectangle()
                        .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                        .overlay {
                            VStack {
                                HStack {
                                    VStack(alignment: .leading) {
                                        let pointsPerAchievement = 25
                                        let currentPoints = achievementsDone.filter { $0 }.count * pointsPerAchievement
                                        let maxPoints = 500
                                     

                                        Text("Current points")
                                            .Poppins(size: 14, color: Color(red: 183/255, green: 191/255, blue: 199/255))
                                        
                                        Text("\(currentPoints) / \(maxPoints)")
                                            .PoppinsBold(size: 24)
                                    }
                                    
                                    Spacer()
                                    
                                    Circle()
                                        .fill(Color(red: 28/255, green: 62/255, blue: 99/255))
                                        .frame(width: 64, height: 64)
                                        .overlay {
                                            Circle()
                                                .stroke(Color(red: 45/255, green: 115/255, blue: 211/255), lineWidth: 4)
                                                .frame(width: 48, height: 48)
                                                .overlay {
                                                    VStack {
                                                        let pointsPerAchievement = 25
                                                        let currentPoints = achievementsDone.filter { $0 }.count * pointsPerAchievement
                                                        let maxPoints = 500
                                                        let progressPercent = Int(Double(currentPoints) / Double(maxPoints) * 100)
                                                        
                                                        Text("\(progressPercent)%")
                                                            .PoppinsBold(size: 16)
                                                    }
                                                }
                                        }
                                }
                                .padding(.horizontal, 10)
                                
                                let completedCount = achievementsDone.filter { $0 }.count
                                AchievementProgressBar(completedCount: completedCount)
                                
                                HStack {
                                    Text("Each achievement = 25 points")
                                        .Poppins(size: 14, color: Color(red: 183/255, green: 191/255, blue: 199/255))
                                        .padding(.leading, 10)
                                    
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 150)
                        .cornerRadius(16)
                        .padding(.horizontal)
                    
                    //MARK: - 1
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color(red: 45/255, green: 115/255, blue: 211/255))
                                .frame(width: 48, height: 48)
                                .overlay {
                                    Text("1")
                                        .PoppinsBold(size: 16)
                                }
                                .padding(.leading)
                            
                            VStack(alignment: .leading) {
                                Text("Young Soccer Player")
                                    .PoppinsBold(size: 16)
                                
                                Text("Complete tasks to level up")
                                    .Poppins(size: 12, color: Color(red: 160/255, green: 171/255, blue: 183/255))
                            }
                                .padding(.leading, 10)
                            
                            Spacer()
                        }
                        
                        VStack(spacing: 15) {
                            let achievementsDone: [Bool] = [
                                manager.isAchievement1Done(),
                                manager.isAchievement2Done(),
                                manager.isAchievement3Done(),
                                manager.isAchievement4Done(),
                                manager.isAchievement5Done()
                            ]
                            ForEach(0..<stakeProgressModel.contact.arrayOfAchiev.count, id: \.self) { index in
                                HStack {
                                    Rectangle()
                                        .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                                        .overlay {
                                            HStack(alignment: .top) {
                                                Image(stakeProgressModel.contact.arrayOfAchiev[index].image)
                                                    .resizable()
                                                    .frame(width: 32, height: 32)
                                                
                                                VStack(alignment: .leading, spacing: 8) {
                                                    Text(stakeProgressModel.contact.arrayOfAchiev[index].title)
                                                        .Poppins(size: 16)
                                                    
                                                    if achievementsDone[index] {
                                                        ZStack(alignment: .leading) {
                                                            Rectangle()
                                                                .fill(Color(red: 46/255, green: 69/255, blue: 90/255))
                                                                .frame(height: 8)
                                                                .cornerRadius(16)
                                                            
                                                            Rectangle()
                                                                .fill(Color(red: 45/255, green: 115/255, blue: 211/255))
                                                                .frame(height: 8)
                                                                .cornerRadius(16)
                                                        }
                                                    } else {
                                                        ZStack(alignment: .leading) {
                                                            Rectangle()
                                                                .fill(Color(red: 46/255, green: 69/255, blue: 90/255))
                                                                .frame(height: 8)
                                                                .cornerRadius(16)
                                                            
                                                            Rectangle()
                                                                .fill(Color(red: 45/255, green: 115/255, blue: 211/255))
                                                                .frame(width: 0, height: 8)
                                                                .cornerRadius(16)
                                                        }
                                                    }
                                                }
                                                
                                                Spacer()
                                                
                                                if achievementsDone[index] {
                                                    Circle()
                                                        .fill(Color(red: 44/255, green: 115/255, blue: 221/255))
                                                        .overlay(content: {
                                                            Image(systemName: "checkmark")
                                                                .font(.system(size: 12))
                                                                .foregroundStyle(.white)
                                                        })
                                                        .frame(width: 24, height: 24)
                                                    
                                                } else {
                                                    Text("0/1")
                                                        .Poppins(size: 12, color: Color(red: 160/255, green: 171/255, blue: 183/255))
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 85)
                                        .cornerRadius(16)
                                        .padding(.horizontal)
//                                        .padding(.leading, 60)
                                }
                            }
                        }
                    }
                    .padding(.top)
                    
                    //MARK: - 2
                    
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color(red: 67/255, green: 84/255, blue: 98/255))
                                .frame(width: 48, height: 48)
                                .overlay {
                                    Text("2")
                                        .PoppinsBold(size: 16, color: Color(red: 178/255, green: 181/255, blue: 183/255))
                                }
                                .padding(.leading)
                            
                            VStack(alignment: .leading) {
                                Text("Middle of the league")
                                    .PoppinsBold(size: 16)
                                
                                Text("Locked - Complete Level 1 first")
                                    .Poppins(size: 12, color: Color(red: 160/255, green: 171/255, blue: 183/255))
                            }
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Image(systemName: "lock.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(Color(red: 122/255, green: 124/255, blue: 131/255))
                                .padding(.trailing, 20)
                        }
                        
                        VStack(spacing: 15) {
                            ForEach(0..<stakeProgressModel.contact.arrayOfAchiev2.count, id: \.self) { index in
                                HStack {
                                    Rectangle()
                                        .fill(Color(red: 61/255, green: 67/255, blue: 95/255).opacity(0.3))
                                        .overlay {
                                            HStack {
                                                Image(stakeProgressModel.contact.arrayOfAchiev2[index].image)
                                                    .resizable()
                                                    .frame(width: 32, height: 32)
                                                
                                                VStack(alignment: .leading, spacing: 7) {
                                                    Text(stakeProgressModel.contact.arrayOfAchiev2[index].title)
                                                        .Poppins(size: 16)
                                                    
                                                }
                                                
                                                Spacer()
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 80)
                                        .cornerRadius(16)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        .opacity(0.5)
                    }
                    .padding(.top)
                    
                    //MARK: - 3
                    
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color(red: 67/255, green: 84/255, blue: 98/255))
                                .frame(width: 48, height: 48)
                                .overlay {
                                    Text("3+")
                                        .PoppinsBold(size: 16, color: Color(red: 178/255, green: 181/255, blue: 183/255))
                                }
                                .padding(.leading)
                            
                            VStack(alignment: .leading) {
                                Text("Team Captain & Beyond")
                                    .PoppinsBold(size: 16)
                                
                                Text("Complete previous levels to unlock")
                                    .Poppins(size: 12, color: Color(red: 160/255, green: 171/255, blue: 183/255))
                            }
                            .padding(.leading, 10)
                            
                            Spacer()
                            
                            Image(systemName: "lock.fill")
                                .font(.system(size: 20))
                                .foregroundStyle(Color(red: 122/255, green: 124/255, blue: 131/255))
                                .padding(.trailing, 20)
                        }
                    }
                    .padding(.top)
                    
                }
                .padding(.top)
            }
        }
    }
}

struct AchievementProgressBar: View {
    let completedCount: Int
    let maxCount: Int = 20
    let fullWidth: CGFloat = UIScreen.main.bounds.width > 900 ? 960 : (UIScreen.main.bounds.width > 600 ? 760 : 300)
    let pointsPerAchievement: CGFloat = 20
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(red: 46/255, green: 69/255, blue: 90/255))
                .frame(width: fullWidth, height: 10)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Rectangle()
                .fill(Color(red: 45/255, green: 115/255, blue: 211/255))
                .frame(width: min(fullWidth, CGFloat(completedCount) * pointsPerAchievement), height: 10)
                .cornerRadius(10)
                .padding(.horizontal, 5)
                .animation(.easeInOut, value: completedCount)
        }
        
    }
}

#Preview {
    StakeProgressView()
}

