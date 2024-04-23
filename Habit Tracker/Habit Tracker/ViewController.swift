//
//  ViewController.swift
//  Habit Tracker
//
//  Created by Andy Pan on 4/14/24.
//

import UIKit

class ViewController: UIViewController {
    
    private func fetchQuotes(){
        QuotesService.fetchQuotes { [weak self] fquote in
            guard let self = self else {return}
            self.configure(with: fquote)
        }
    }
    
    private func configure(with quotes: CurrentQuote){
        quote.text = quotes.text
    }

    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var emptyLabel: UILabel!
    
    var habit = [Habits]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.tableHeaderView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        fetchQuotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        refreshHabits()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "CreateSegue",
               let createVC = segue.destination as? CreateViewController {
                // Set up the closure in CreateViewController to receive the new habit
                createVC.onComposeHabit = { [weak self] habit in
                    guard let self = self else { return }
                    self.habit.append(habit)
                    Habits.save(self.habit)
                    self.tableView.reloadData()
                }
            }
        }
    
    private func refreshHabits(){
        var habit = Habits.getHabits()
        habit.sort { lhs, rhs in
            if lhs.isCompleted && rhs.isCompleted {
                return lhs.completedDate! < rhs.completedDate!
            }
            else if !lhs.isCompleted && !rhs.isCompleted {
                return lhs.createdDate < rhs.createdDate
            }
            else{
                return !lhs.isCompleted && rhs.isCompleted
            }
        }
        self.habit = habit
        emptyLabel.isHidden = !habit.isEmpty
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath) as! TableViewCell
        let habit = habit[indexPath.row]
        cell.configure(with: habit, onButtonTapped: {_ in 
            habit.save()
        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            habit.remove(at: indexPath.row)
            Habits.save(habit)
            tableView.deleteRows(at: [indexPath],  with: .automatic)
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1.
        tableView.deselectRow(at: indexPath, animated: false)
        // 2.
        let selectedTask = habit[indexPath.row]
        // 3.
        performSegue(withIdentifier: "ComposeSegue", sender: selectedTask)
    }
}
