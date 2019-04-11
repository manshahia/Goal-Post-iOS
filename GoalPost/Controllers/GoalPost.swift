//
//  ViewController.swift
//  GoalPost
//
//  Created by Ravi Inder Manshahia on 05/04/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit
import CoreData

class GoalPost: UIViewController {
    
    var goals : [Goal] = []

    @IBAction func addGoalBtnPressed(_ sender: Any) {
    }

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchGoalData()
    {
        fetch { (success) in
            if success {
                //tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        fetchGoalData()
        tableView.reloadData()
        
    }


}

extension GoalPost : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else {return UITableViewCell() }
        
        let goal = goals[indexPath.row]
        
        cell.confirgureCell(description: goal.descrption!, type: goal.type!, duration: Int(goal.progress))
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Editing
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            
            
            
            print("Goals Number: \(self.goals.count)")
            self.removeGoal(at: indexPath)
            print("Goals Number: \(self.goals.count)")
            self.fetchGoalData()
            print("Goals Number: \(self.goals.count)")
            tableView.deleteRows(at: [indexPath], with: .automatic)


            
        }
        
        
        let addAction = UITableViewRowAction(style: .normal, title: "Add 1") { (rowAction, indexPath) in
            
            self.setProgress(at: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        return [deleteAction, addAction]
    }
    
    
}


extension GoalPost {
    
    func setProgress(at indexPath: IndexPath)
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let chosenGoal = goals[indexPath.row]
        if chosenGoal.progress < chosenGoal.totalCounter
        {
            chosenGoal.progress += 1
        }
        else
        {
            return
        }
        
        do {
            try managedContext.save()
        } catch {
            debugPrint("Error while increasing progress")
        }
        
    }
    
    func removeGoal(at indexPath: IndexPath)
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
        } catch {
            debugPrint("Error while Removing GOAL, \(error.localizedDescription)")
        }
    }
    
    func fetch(completion: (_ success : Bool)->())
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do {
            goals = try managedContext.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint("Failed \(error.localizedDescription)")
            completion(false)
        }
    }
}
