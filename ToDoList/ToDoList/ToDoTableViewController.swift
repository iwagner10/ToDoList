//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Indi Wagner on 8/2/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var listOfToDo : [ToDoCD] = []
    
/*
    func createToDo() -> [ToDoCLass] {
        let swiftToDo = ToDoCLass()
        swiftToDo.description = "Learn Swift"
        swiftToDo.important = true
        
        let dogToDo = ToDoCLass()
        dogToDo.description = "Walk the dog"
        
        let waterToDo = ToDoCLass()
        swiftToDo.description = "Drink a gallon of water"
        swiftToDo.important = true
        
        return [swiftToDo, dogToDo, waterToDo]
    
    }*/
    
    func getToDos() {
        if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let dataFromCoreData = try?
                accessToCoreData.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                listOfToDo = dataFromCoreData
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //listOfToDo = createToDo()
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfToDo.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let eachToDo = listOfToDo[indexPath.row]
        
        if let thereIsDescription = eachToDo.descriptionInCD {
            if eachToDo.importantInCD {
                cell.textLabel?.text = "!!!" + thereIsDescription
            } else {
                cell.textLabel?.text = eachToDo.descriptionInCD
            }
        }
        
        cell.textLabel?.text = eachToDo.descriptionInCD
        
        if eachToDo.importantInCD {
            cell.textLabel?.text = "!!!" + eachToDo.descriptionInCD!
        } else {
            cell.textLabel?.text = eachToDo.descriptionInCD
        }
        
        return cell
    }

    // MARK: - Navigation
    
    override func viweWillAppear(_ animated: Bool) {
        getToDos()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as? AddToDoViewController {
            nextAddToDoVC.previousToDoTVC = self
        }
        
        if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
            if let chosenToDo = sender as? ToDoCLass {
                nextCompletedToDoVC.selectedToDo = chosenToDo
                nextCompletedToDoVC.previousToDoVC = self
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eachToDo = listOfToDo[indexPath.row]
        
        performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }


}
