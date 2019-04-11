//
//  FinishGoal.swift
//  GoalPost
//
//  Created by Ravi Inder Manshahia on 07/04/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit

var appDelegate = UIApplication.shared.delegate as? AppDelegate

class FinishGoal: UIViewController {

    var desc : String!
    var goalType : GoalType!
    
    @IBOutlet weak var pointsTF: UITextField!
    @IBAction func backBtnPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var tap = UITapGestureRecognizer(target: self, action: #selector(tapOnView(_:)))
        self.view.addGestureRecognizer(tap)
        
        
        let createGoalBtn = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
        createGoalBtn.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.6470588235, blue: 0.2078431373, alpha: 1)
        createGoalBtn.setTitle("Create Goal", for: UIControl.State.normal)
        createGoalBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
        createGoalBtn.addTarget(self, action: #selector(createGoalBtnPressed), for: .touchUpInside)
        
        
        pointsTF.inputAccessoryView = createGoalBtn
        // Do any additional setup after loading the view.
    }
    
    @objc func createGoalBtnPressed()
    {
        if pointsTF.text != ""
        {
            save { (success) in
                if success{
                    
                    self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func save(_ completion: (Bool) -> () )
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.descrption = desc!
        goal.type = goalType.rawValue
        goal.progress = 0
        goal.totalCounter = Int32(pointsTF.text!)!
        
        do
        {
            try managedContext.save()
            completion(true)
        }catch {
            debugPrint("Error: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    @objc func tapOnView(_ recognizer: UITapGestureRecognizer)
    {
        self.view.endEditing(true)
    }
    
    func set(_ desc: String, type: GoalType)
    {
        self.desc = desc
        self.goalType = type
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
