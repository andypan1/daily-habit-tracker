//
//  Habits.swift
//  Habit Tracker
//
//  Created by Andy Pan on 4/14/24.
//

import UIKit

struct Habits: Codable{
    var title: String
    var note: String?
    var streak: Int
    
    init(title: String, note: String? = nil, streak: Int) {
        self.title = title
        self.note = note
        self.streak = streak
    }
    
    var isCompleted: Bool = false {
        didSet{
            if isCompleted{
                streak += 1;
            }
            else {
                streak = 0;
            }
        }
    }
    
    mutating func updateStreak(isCompletedToday: Bool) {
        if isCompletedToday {
            isCompleted = true
        } else {
            isCompleted = false
        }
    }
    
    var id: String = UUID().uuidString
}

extension Habits {
    
    static func save(_ habits: [Habits]){
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(habits)
        defaults.set(encodedData, forKey: "SavedHabits")
    }
    
    static func getHabits () -> [Habits] {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "SavedHabits"){
            let decodedTasks = try! JSONDecoder().decode([Habits].self, from: data)
            return decodedTasks
        }
        else{
            return []
        }
    }
    
    func save() {
        var habits = Habits.getHabits()
        if let index = habits.firstIndex(where: {$0.id == self.id}){
            habits.remove(at: index)
            habits.insert(self, at: index)
        }
        else{
            habits.append(self)
        }
        Habits.save(habits)
    }
}
