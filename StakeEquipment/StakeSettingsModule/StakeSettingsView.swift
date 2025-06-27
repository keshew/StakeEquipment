import SwiftUI

struct StakeSettingsView: View {
    @StateObject var stakeSettingsModel =  StakeSettingsViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 22/255, green: 42/255, blue: 57/255).ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("Settings")
                        .PoppinsBold(size: 20)
                    
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
                                                .frame(width: 64, height: 64)
                                                .overlay {
                                                    Image(systemName: "person.fill")
                                                        .font(.system(size: 30))
                                                        .foregroundStyle(Color(red: 45/255, green: 115/255, blue: 211/255))
                                                }
                                            
                                            VStack(alignment: .leading) {
                                                Text("Young Player")
                                                    .PoppinsBold(size: 20)
                                                
                                                Text("Level 1 • 450 XP")
                                                    .Poppins(size: 14, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                
                                                HStack {
//                                                    ZStack(alignment: .leading) {
//                                                        Rectangle()
//                                                            .fill(Color(red: 46/255, green: 69/255, blue: 90/255))
//                                                            .frame(height: 8)
//                                                            .cornerRadius(16)
//                                                        
//                                                        Rectangle()
//                                                            .fill(Color(red: 45/255, green: 115/255, blue: 211/255))
//                                                            .frame(width: 50, height: 8)
//                                                            .cornerRadius(16)
//                                                    }
                                                    
                                                    ProgressBarView2(currentValue: CGFloat(UserDefaultsManager().getPoints()))
                                                    
                                                    let points = UserDefaultsManager().getPoints()
                                                    Text("\(points / 5)%")
                                                        .Poppins(size: 14, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                        .padding(.trailing, 50)
                                                        .padding(.leading, 5)
                                                }
                                            }
                                            .padding(.leading, 5)
                                            
                                            Spacer()
                                        }
                                        .padding(.leading)
                                        
                                     
                                    }
                                }
                        }
                        .frame(height: 108)
                        .cornerRadius(16)
                        .padding(.horizontal, 20)
                        .padding(.top)
                    
                    HStack {
                        Text("Preferences")
                            .PoppinsBold(size: 16)
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    VStack(spacing: 20) {
                        Rectangle()
                            .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(red: 30/255, green: 68/255, blue: 115/255))
                                    .overlay {
                                        HStack {
                                            Circle()
                                                .fill(Color(red: 45/255, green: 115/255, blue: 211/255).opacity(0.3))
                                                .frame(width: 40, height: 40)
                                                .overlay {
                                                    Image(systemName: "iphone.homebutton")
                                                        .foregroundStyle(Color(red: 45/255, green: 115/255, blue: 211/255))
                                                }
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Vibration")
                                                    .Poppins(size: 14)
                                                
                                                Text("Haptic feedback")
                                                    .Poppins(size: 12, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                    .multilineTextAlignment(.center)
                                            }
                                            .padding(.leading, 5)
                                            
                                            Toggle("", isOn: $stakeSettingsModel.vibration)
                                                .toggleStyle(CustomToggleStyle())
                                        }
                                        .padding(.horizontal)
                                    }
                            }
                            .frame(height: 74)
                            .cornerRadius(16)
                        
                        Rectangle()
                            .fill(Color(red: 25/255, green: 49/255, blue: 72/255))
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color(red: 30/255, green: 68/255, blue: 115/255))
                                    .overlay {
                                        HStack {
                                            Circle()
                                                .fill(Color(red: 45/255, green: 115/255, blue: 211/255).opacity(0.3))
                                                .frame(width: 40, height: 40)
                                                .overlay {
                                                    Image(systemName: "speaker.wave.3.fill")
                                                        .foregroundStyle(Color(red: 45/255, green: 115/255, blue: 211/255))
                                                }
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Sound Effects")
                                                    .Poppins(size: 14)
                                                
                                                Text("App interaction sounds")
                                                    .Poppins(size: 11, color: Color(red: 182/255, green: 188/255, blue: 196/255))
                                                    .multilineTextAlignment(.center)
                                            }
                                            .padding(.leading, 5)
                                            
                                            Toggle("", isOn: $stakeSettingsModel.sound)
                                                .toggleStyle(CustomToggleStyle())
                                        }
                                        .padding(.horizontal)
                                    }
                            }
                            .frame(height: 74)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top)
            }
            .scrollDisabled(UIScreen.main.bounds.width > 380  ? true : false)
        }
    }
}

#Preview {
    StakeSettingsView()
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? Color(red: 45/255, green: 115/255, blue: 211/255) : Color(red: 69/255, green: 90/255, blue: 109/255))
                .frame(width: 48, height: 24)
                .overlay(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                        .offset(x: configuration.isOn ? 11 : -11)
                        .animation(.easeInOut, value: configuration.isOn)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct ProgressBarView2: View {
    let maxWidth: CGFloat = UIScreen.main.bounds.width > 900 ? 960 : (UIScreen.main.bounds.width > 600 ? 760 : 340)
    let maxValue: CGFloat = 500
    var currentValue: CGFloat

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(red: 46/255, green: 69/255, blue: 90/255))
                .frame(height: 8)
                .cornerRadius(16)

            Rectangle()
                .fill(Color(red: 45/255, green: 115/255, blue: 211/255))
                .frame(width: (currentValue / maxValue) * maxWidth, height: 8)
                .cornerRadius(16)
                .animation(.easeInOut, value: currentValue)
        }
    }
}
