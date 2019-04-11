//
//  AddGoalVC.swift
//  GoalPost
//
//  Created by Ravi Inder Manshahia on 05/04/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit

class AddGoalVC: UIViewController {
    
    var selectedType: GoalType = .shortTerm
    
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var goalTF: UITextField!
    
    @objc func nextBtnPressed(_ sender: Any)
    {
        if goalTF.text != ""
        {
            guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createGoal") as? FinishGoal else {return}
            createGoalVC.set(goalTF.text!, type: selectedType)
            present(createGoalVC, animated: true, completion: nil)
        }
    }
    
    
   
    
    @IBAction func shortTermBtnPressed(_ sender: Any)
    {
        selectedType = .shortTerm
        selectBtnColor(sender: shortTermBtn)
        deSelectBtnColor(sender: longTermBtn)
        
        
    }
    @IBAction func longTermBtnPressed(_ sender: Any)
    {
        selectedType = .longTerm
        selectBtnColor(sender: longTermBtn)
        deSelectBtnColor(sender: shortTermBtn)
    }
    @IBAction func backButtonPressed(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        var tap = UITapGestureRecognizer(target: self, action: #selector(tapOnView(_:)))
        view.addGestureRecognizer(tap)
        
        
        let nextBtn = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
        nextBtn.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.6470588235, blue: 0.2078431373, alpha: 1)
        nextBtn.setTitle("Next", for: UIControl.State.normal)
        nextBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
        nextBtn.addTarget(self, action: #selector(nextBtnPressed(_:)), for: .touchUpInside)
        
        
        goalTF.inputAccessoryView = nextBtn
        // Do any additional setup after loading the view.
    }
    
    @objc func tapOnView(_ recognizer: UITapGestureRecognizer)
    {
        self.view.endEditing(true)
    }
    
    
    func selectBtnColor(sender: UIButton)
    {
        sender.backgroundColor = #colorLiteral(red: 0.3960784314, green: 0.8, blue: 0.3803921569, alpha: 1)
    }
    func deSelectBtnColor(sender: UIButton)
    {
        sender.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }

}


