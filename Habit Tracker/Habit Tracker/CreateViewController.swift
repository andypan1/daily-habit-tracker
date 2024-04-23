//
//  CreateViewController.swift
//  Habit Tracker
//
//  Created by Andy Pan on 4/15/24.
//

import UIKit

class CreateViewController: UIViewController {

   
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var titleLabel: UITextField!
    
    var onComposeHabit: ((Habits) -> Void)? = nil
    
    @IBAction func addHabit(_ sender: Any) {
        guard let title = titleLabel.text, !title.isEmpty
        else{
            presentAlert(title: "Oops...", message: "Make sure to add a title!")
            return
        }
        var habit: Habits
        
        habit = Habits(title: title, streak: 0)
        onComposeHabit?(habit)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func presentAlert(title: String, message: String) {
        // 1.
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        // 2.
        let okAction = UIAlertAction(title: "OK", style: .default)
        // 3.
        alertController.addAction(okAction)
        // 4.
        present(alertController, animated: true)
    }
}
