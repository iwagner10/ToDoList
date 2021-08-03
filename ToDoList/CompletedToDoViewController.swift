//
//  CompletedToDoViewController.swift
//  ToDoList
//
//  Created by Indi Wagner on 8/2/21.
//

import UIKit

class CompletedToDoViewController: UIViewController {

    var previousToDoVC = ToDoTableViewController()
    var selectedToDo = ToDoCLass()
    
    @IBOutlet weak var toDoDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoDisplay.text = selectedToDo.description
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTapped(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
