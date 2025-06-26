import SwiftUI

struct StakeTabBarView: View {
    @StateObject var stakeTabBarModel =  StakeTabBarViewModel()
    @State private var selectedTab: CustomTabBar.TabType = .Home

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                if selectedTab == .Home {
                    StakeHomeView(selectedTab: $selectedTab)
                } else if selectedTab == .Guide {
                    StakeGuideView()
                } else if selectedTab == .Quiz {
                    StakeQuizView()
                } else if selectedTab == .Profile {
                    StakeSettingsView()
                }
            }
            .frame(maxHeight: .infinity)
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 0)
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StakeTabBarView()
}

struct CustomTabBar: View {
    @Binding var selectedTab: TabType
    
    enum TabType: Int {
        case Home
        case Guide
        case Quiz
        case Profile
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                Rectangle()
                    .fill(Color(red: 21/255, green: 42/255, blue: 57/255))
                    .frame(height: 110)
                    .edgesIgnoringSafeArea(.bottom)
                    .offset(y: 35)
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                    .offset(y: -20)
            }
            
            HStack(spacing: 0) {
                TabBarItem(imageName: "house.fill", tab: .Home, selectedTab: $selectedTab)
                TabBarItem(imageName: "book.fill", tab: .Guide, selectedTab: $selectedTab)
                TabBarItem(imageName: "graduationcap.fill", tab: .Quiz, selectedTab: $selectedTab)
                TabBarItem(imageName: "person.fill", tab: .Profile, selectedTab: $selectedTab)
            }
            .padding(.top, 10)
            .frame(height: 60)
        }
    }
}

struct TabBarItem: View {
    let imageName: String
    let tab: CustomTabBar.TabType
    @Binding var selectedTab: CustomTabBar.TabType
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 12) {
                VStack {
                    Image(systemName: imageName)
                        .resizable()
                        .frame(
                            width: 20,
                            height: 18
                        )
                        .foregroundStyle(selectedTab == tab ? Color(red: 46/255, green: 115/255, blue: 211/255) : Color(red: 182/255, green: 188/255, blue: 196/255))
                        .overlay {
                            if tab == .Quiz {
                                Circle()
                                    .fill(Color(red: 46/255, green: 115/255, blue: 211/255))
                                    .frame(width: 10, height: 10)
                                    .offset(x: 15, y: -15)
                            }
                        }
                    
                    Text("\(tab)")
                        .Poppins(
                            size: 12,
                            color: selectedTab == tab
                            ? Color(red: 46/255, green: 115/255, blue: 211/255)
                            : Color(red: 182/255, green: 188/255, blue: 196/255)
                        )
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
