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
    
    override func viewWillAppear(_ animated: Bool) {
        fetch { (success) in
            if success {
                    tableView.reloadData()
            }
        }
        
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
}


extension GoalPost {
    
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
