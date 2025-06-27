import SwiftUI

class UserDefaultsManager: ObservableObject {
    private let defaults = UserDefaults.standard
    
    private let keys = ["boolKey1", "boolKey2", "boolKey3", "boolKey4"]
    private let dateKeys = ["boolKey1_date", "boolKey2_date", "boolKey3_date", "boolKey4_date"]
    
    
    func saveBoolValue1(_ value: Bool) {
        saveBool(value, forKeyIndex: 0)
    }
    
    func saveBoolValue2(_ value: Bool) {
        saveBool(value, forKeyIndex: 1)
    }
    
    func saveBoolValue3(_ value: Bool) {
        saveBool(value, forKeyIndex: 2)
    }
    
    func saveBoolValue4(_ value: Bool) {
        saveBool(value, forKeyIndex: 3)
    }
    
    private func saveBool(_ value: Bool, forKeyIndex index: Int) {
        guard keys.indices.contains(index), dateKeys.indices.contains(index) else { return }
        let key = keys[index]
        let dateKey = dateKeys[index]
        
        defaults.set(value, forKey: key)
        defaults.set(Date(), forKey: dateKey)
    }
    
    // MARK: - Чтение булевых значений с проверкой 24 часов
    
    func readBoolValue1() -> Bool {
        return readBool(forKeyIndex: 0)
    }
    
    func readBoolValue2() -> Bool {
        return readBool(forKeyIndex: 1)
    }
    
    func readBoolValue3() -> Bool {
        return readBool(forKeyIndex: 2)
    }
    
    func readBoolValue4() -> Bool {
        return readBool(forKeyIndex: 3)
    }
    
    private func readBool(forKeyIndex index: Int) -> Bool {
        guard keys.indices.contains(index), dateKeys.indices.contains(index) else { return false }
        let key = keys[index]
        let dateKey = dateKeys[index]
        
        if let lastDate = defaults.object(forKey: dateKey) as? Date {
            if Date().timeIntervalSince(lastDate) > 24 * 60 * 60 {
                defaults.set(false, forKey: key)
                defaults.set(Date(), forKey: dateKey)
                return false
            }
        } else {
            defaults.set(false, forKey: key)
            defaults.set(Date(), forKey: dateKey)
            return false
        }
        
        return defaults.bool(forKey: key)
    }
    
    func isFirstLaunch() -> Bool {
        let defaults = UserDefaults.standard
        let isFirstLaunch = defaults.bool(forKey: "isFirstLaunch")
        
        if !isFirstLaunch {
            defaults.set(true, forKey: "isFirstLaunch")
            return true
        }
        
        return false
    }
    
    private enum Keys: String {
        case achievement1 = "achievement1"
        case achievement2 = "achievement2"
        case achievement3 = "achievement3"
        case achievement4 = "achievement4"
        
        case achievement2Date = "achievement2Date"
        case achievement3Date = "achievement3Date"
        case achievement4Dates = "achievement4Dates"
    }
    
    // MARK: - Achievement 1 (всегда выполнено)
    func isAchievement1Done() -> Bool {
        return true
    }
    
    // MARK: - Achievement 2 (заход на экран 2)
    func markAchievement2Done() {
        defaults.set(true, forKey: Keys.achievement2.rawValue)
        defaults.set(Date(), forKey: Keys.achievement2Date.rawValue)
    }
    
    func isAchievement2Done() -> Bool {
        return defaults.bool(forKey: Keys.achievement2.rawValue)
    }
    
    // MARK: - Achievement 3 (заход на экран 3)
    func markAchievement3Done() {
        defaults.set(true, forKey: Keys.achievement3.rawValue)
        defaults.set(Date(), forKey: Keys.achievement3Date.rawValue)
    }
    
    func isAchievement3Done() -> Bool {
        return defaults.bool(forKey: Keys.achievement3.rawValue)
    }
    
    // MARK: - Achievement 4 (заход 3 дня подряд)
    
    func recordGameLaunchDate() {
        var dates = loadAchievement4Dates()
        let today = Calendar.current.startOfDay(for: Date())
        
        if !dates.contains(today) {
            dates.append(today)
            dates = Array(dates.sorted().suffix(3))
            saveAchievement4Dates(dates)
        }
    }
    
    func isAchievement4Done() -> Bool {
        let dates = loadAchievement4Dates().sorted()
        guard dates.count >= 3 else { return false }
        
        let calendar = Calendar.current
        
        for i in 1..<dates.count {
            guard let prevDay = calendar.date(byAdding: .day, value: 1, to: dates[i-1]) else { return false }
            if !calendar.isDate(prevDay, inSameDayAs: dates[i]) {
                return false
            }
        }
        return true
    }
    
    // MARK: - Вспомогательные методы для Achievement 4
    
    private func loadAchievement4Dates() -> [Date] {
        if let data = defaults.data(forKey: Keys.achievement4Dates.rawValue),
           let dates = try? JSONDecoder().decode([Date].self, from: data) {
            return dates
        }
        return []
    }
    
    private func saveAchievement4Dates(_ dates: [Date]) {
        if let data = try? JSONEncoder().encode(dates) {
            defaults.set(data, forKey: Keys.achievement4Dates.rawValue)
        }
    }
    
    func isAchievement5Done() -> Bool {
        return false
    }
    
    private let key = "userPoints"
    
    func addTenPoints() {
        let current = defaults.integer(forKey: key)
        defaults.set(current + 5, forKey: key)
    }
    
    func getPoints() -> Int {
        return defaults.integer(forKey: key)
    }
    
    func clearAllKeys() {
        for key in keys {
            defaults.removeObject(forKey: key)
        }
        for dateKey in dateKeys {
            defaults.removeObject(forKey: dateKey)
        }
        
        defaults.removeObject(forKey: Keys.achievement2.rawValue)
        defaults.removeObject(forKey: Keys.achievement2Date.rawValue)
        defaults.removeObject(forKey: Keys.achievement3.rawValue)
        defaults.removeObject(forKey: Keys.achievement3Date.rawValue)
        defaults.removeObject(forKey: Keys.achievement4Dates.rawValue)
        
        defaults.removeObject(forKey: key)
    }

}
