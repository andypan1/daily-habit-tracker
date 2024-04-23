
//
//  TableViewCell.swift
//  Habit Tracker
//
//  Created by Andy Pan on 4/21/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var taskButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var streakCounter: UILabel!
    
    var onButtonTapped: ((Habits) -> Void)?
    var habit: Habits!
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        habit.isCompleted = !habit.isCompleted
        update(with: habit)
        onButtonTapped?(habit)
    }
    
    func configure(with habit: Habits, onButtonTapped:((Habits) -> Void)?){
        self.habit = habit
        self.onButtonTapped = onButtonTapped
        update(with: habit)
    }
    
    private func update(with habit: Habits){
        titleLabel.text = habit.title
        titleLabel.textColor = habit.isCompleted ? .secondaryLabel : .label
        noteLabel.text = habit.note
        noteLabel.isHidden = habit.note == "" || habit.note == nil
        streakCounter.text = "Streak: \(habit.streak)"
        taskButton.isSelected = habit.isCompleted
        taskButton.tintColor = habit.isCompleted ? .systemBlue : .tertiaryLabel
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) { }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }

}
