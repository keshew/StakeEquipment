import SwiftUI

struct StakeHomeView: View {
    @StateObject var viewModel = StakeHomeViewModel()
    @Binding var selectedTab: CustomTabBar.TabType
    var body: some View {
        ZStack {
            Color(red: 22/255, green: 42/255, blue: 57/255).ignoresSafeArea()
            
            ScrollView {
                VStack {
                    VStack(spacing: 5) {
                        Text("Home")
                            .PoppinsBold(size: 20)
                        
                        Text("FootCare Pro")
                            .Poppins(size: 12, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                    }
                    .padding(.top)
                    
                    Rectangle()
                        .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color(red: 30/255, green: 68/255, blue: 115/255))
                                .overlay {
                                    VStack {
                                        HStack {
                                            Circle()
                                                .fill(Color(red: 30/255, green: 68/255, blue: 115/255))
                                                .frame(width: 48, height: 48)
                                                .overlay {
                                                    Image(systemName: "soccerball")
                                                        .font(.system(size: 20))
                                                        .foregroundStyle(Color(red: 45/255, green: 115/255, blue: 211/255))
                                                }
                                            
                                            VStack(alignment: .leading) {
                                                Text("Current Level")
                                                    .Poppins(size: 14, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                
                                                Text("Mid-league Player")
                                                    .PoppinsBold(size: 20)
                                            }
                                            .padding(.leading, 5)
                                            
                                            Spacer()
                                        }
                                        .padding(.leading)
                                        
                                        ZStack(alignment: .leading) {
                                            Rectangle()
                                                .fill(Color(red: 46/255, green: 69/255, blue: 90/255))
                                                .frame(height: 8)
                                                .cornerRadius(16)
                                            
                                            Rectangle()
                                                .fill(Color(red: 45/255, green: 115/255, blue: 211/255))
                                                .frame(width: 100, height: 8)
                                                .cornerRadius(16)
                                        }
                                        .padding(.horizontal)
                                        
                                        HStack {
                                            VStack {
                                                Circle()
                                                    .fill(Color(red: 45/255, green: 115/255, blue: 211/255))
                                                    .frame(width: 12, height: 12)
                                                
                                                Text("Young\nPlayer")
                                                    .Poppins(size: 10, color: Color(red: 45/255, green: 115/255, blue: 211/255))
                                                    .multilineTextAlignment(.center)
                                            }
                                            
                                            Spacer()
                                            
                                            VStack {
                                                Circle()
                                                    .fill(Color(red: 69/255, green: 90/255, blue: 109/255))
                                                    .frame(width: 8, height: 8)
                                                
                                                Text("Mid-league\nPlayer")
                                                    .Poppins(size: 10, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                    .multilineTextAlignment(.center)
                                            }
                                            
                                            Spacer()
                                            
                                            VStack {
                                                Circle()
                                                    .fill(Color(red: 69/255, green: 90/255, blue: 109/255))
                                                    .frame(width: 8, height: 8)
                                                
                                                Text("Team\nCaptain")
                                                    .Poppins(size: 10, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                    .multilineTextAlignment(.center)
                                            }
                                            
                                            Spacer()
                                            
                                            VStack {
                                                Circle()
                                                    .fill(Color(red: 69/255, green: 90/255, blue: 109/255))
                                                    .frame(width: 8, height: 8)
                                                
                                                Text("Clean Pass\nMaster")
                                                    .Poppins(size: 10, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                    .multilineTextAlignment(.center)
                                            }
                                        }
                                        .padding(.horizontal)
                                        .padding(.top, 10)
                                    }
                                }
                        }
                        .frame(height: 168)
                        .cornerRadius(16)
                        .padding(.horizontal, 20)
                        .padding(.top)
                    
                    HStack {
                        Text("Quick Access")
                            .PoppinsBold(size: 16)
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            Rectangle()
                                .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(red: 30/255, green: 68/255, blue: 115/255))
                                        .overlay {
                                            VStack(spacing: 8) {
                                                Image(.div)
                                                    .resizable()
                                                    .frame(width: 48, height: 48)
                                                
                                                Text("Care Progress")
                                                    .Poppins(size: 14)
                                                
                                                Text("Track your equipment care routine")
                                                    .Poppins(size: 10, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                    .multilineTextAlignment(.center)
                                            }
                                        }
                                }
                                .frame(height: 144)
                                .cornerRadius(16)
                                .onTapGesture {
                                    viewModel.isProgress = true
                                }
                               
                            
                            Rectangle()
                                .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(red: 30/255, green: 68/255, blue: 115/255))
                                        .overlay {
                                            VStack(spacing: 8) {
                                                Image("div-2")
                                                    .resizable()
                                                    .frame(width: 48, height: 48)
                                                
                                                Text("Cleaning Gallery")
                                                    .Poppins(size: 14)
                                                
                                                Text("Visual guides for gear maintenance")
                                                    .Poppins(size: 10, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                    .multilineTextAlignment(.center)
                                            }
                                        }
                                }
                                .frame(height: 144)
                                .cornerRadius(16)
                                .onTapGesture {
                                    selectedTab = .Guide
                                }
                        }
                        
                        HStack(spacing: 20) {
                            Rectangle()
                                .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(red: 30/255, green: 68/255, blue: 115/255))
                                        .overlay {
                                            VStack(spacing: 8) {
                                                Image("div-3")
                                                    .resizable()
                                                    .frame(width: 48, height: 48)
                                                
                                                Text("Soccer Quiz")
                                                    .Poppins(size: 14)
                                                
                                                Text("Test your equipment\nknowledge")
                                                    .Poppins(size: 10, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                    .multilineTextAlignment(.center)
                                            }
                                        }
                                }
                                .frame(height: 144)
                                .cornerRadius(16)
                                .onTapGesture {
                                    selectedTab = .Quiz
                                }
                            
                            Rectangle()
                                .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(red: 30/255, green: 68/255, blue: 115/255))
                                        .overlay {
                                            VStack(spacing: 8) {
                                                Image("div-4")
                                                    .resizable()
                                                    .frame(width: 48, height: 48)
                                                
                                                Text("Settings")
                                                    .Poppins(size: 14)
                                                
                                                Text("Customize your app\nexperience")
                                                    .Poppins(size: 10, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                    .multilineTextAlignment(.center)
                                            }
                                        }
                                }
                                .frame(height: 144)
                                .cornerRadius(16)
                                .onTapGesture {
                                    selectedTab = .Profile
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .scrollDisabled(UIScreen.main.bounds.width > 380  ? true : false)
        }
        .fullScreenCover(isPresented: $viewModel.isProgress) {
            StakeProgressView()
        }
    }
}

#Preview {
    StakeHomeView(selectedTab: .constant(.Home))
}

