import SwiftUI

enum StakeTab: String, CaseIterable {
    case home, guide, quiz, profile
    var title: String {
        switch self {
        case .home: return "Home"
        case .guide: return "Guide"
        case .quiz: return "Quiz"
        case .profile: return "Profile"
        }
    }
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .guide: return "book.fill"
        case .quiz: return "trophy.fill"
        case .profile: return "person.fill"
        }
    }
}

struct StakeTabBar: View {
    var selected: StakeTab
    var body: some View {
        HStack(spacing: 0) {
            ForEach(StakeTab.allCases, id: \.self) { tab in
                VStack(spacing: 4) {
                    Image(systemName: tab.icon)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(selected == tab ? Color(red: 60/255, green: 120/255, blue: 255/255) : .white.opacity(0.7))
                    Text(tab.title)
                        .Poppins(size: 12, color: selected == tab ? Color(red: 60/255, green: 120/255, blue: 255/255) : .white.opacity(0.7))
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 10)
        .background(Color(red: 24/255, green: 48/255, blue: 72/255))
        .cornerRadius(18)
        .padding(.horizontal, 8)
        .padding(.bottom, 8)
    }
} 