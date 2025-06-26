import SwiftUI

struct AchievModel {
    var image: String
    var title: String
    var subtitle: String
    var status: Status
    var isCompleted: Bool
}

enum Status: String {
    case inProgress
    case completed
    case locked
}

struct StakeProgressModel {
    let arrayOfAchiev = [AchievModel(image: "1level1", title: "\"First form\" — Add an item", subtitle: "Add the first chicken", status: Status.inProgress, isCompleted: false),
                           AchievModel(image: "1level2", title: "\"After the match\" - Read the care instructions", subtitle: "Read the cleaning instructions", status: Status.inProgress, isCompleted: false),
                           AchievModel(image: "1level3", title: "\"Test pass\" — Pass 3 questions", subtitle: "Answer 3 questions", status: Status.inProgress, isCompleted: false),
                           AchievModel(image: "guide3", title:  "\"3 days in the game\" — Enter 3 consecutive days", subtitle: "Go to the app", status: Status.inProgress, isCompleted: false),
                           AchievModel(image: "guide2", title: "\"No smell — no foul\" — Complete the odour elimination card", subtitle: "Pass the hygiene card", status: Status.inProgress, isCompleted: false)]
      
      let arrayOfAchiev2 = [AchievModel(image: "2level1", title: "\"Boots without dirt\" - Read the cleaning guide", subtitle: "Learn feeding", status: Status.locked, isCompleted: false),
                           AchievModel(image: "2level2", title: "\"5 in a row\" — Complete 5 cards", subtitle: "Read", status: Status.locked, isCompleted: false)]
      
      let arrayOfAchiev3 = [AchievModel(image: "2level1", title: "Herbs and supplements", subtitle: "Pass the card", status: Status.locked, isCompleted: false),
                           AchievModel(image: "2level5", title: "8 correct answers", subtitle: "Pass the quiz", status: Status.locked, isCompleted: false),
                           AchievModel(image: "2level3", title: "10 completed cards", subtitle: "Successfully", status: Status.locked, isCompleted: false),
                           AchievModel(image: "2level4", title:  "Week with chickens", subtitle: "Enter 7 days", status: Status.locked, isCompleted: false),
                           AchievModel(image: "2level5", title: "Repeated care", subtitle: "Mark 3 actions again", status: Status.locked, isCompleted: false)]
      
      let arrayOfAchiev4 = [AchievModel(image: "4level1", title: "No mistakes", subtitle: "Pass the quiz for 100%", status: Status.locked, isCompleted: false)]
}


