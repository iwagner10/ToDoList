//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Indi Wagner on 8/2/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var listOfToDo : [ToDoCLass] = []
    
    func createToDo() -> [ToDoCLass] {
        let swiftToDo = ToDoCLass()
        swiftToDo.description = "Learn Swift"
        swiftToDo.important = true
        
        let dogToDo = ToDoCLass()
        dogToDo.description = "Walk the dog"
        
        return [swiftToDo, dogToDo]
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listOfToDo = createToDo()
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let eachToDo = listOfToDo[indexPath.row]
        cell.textLabel?.text = eachToDo.description
        
        if eachToDo.important {
            cell.textLabel?.text = "!" + eachToDo.description
        } else {
            cell.textLabel?.text = eachToDo.description
        }
        
        return cell
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
