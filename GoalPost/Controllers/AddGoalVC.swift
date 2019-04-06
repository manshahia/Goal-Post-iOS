//
//  AddGoalVC.swift
//  GoalPost
//
//  Created by Ravi Inder Manshahia on 05/04/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit

class AddGoalVC: UIViewController {
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var goalTF: UITextField!
    
    @IBAction func nextBtnPressed(_ sender: Any)
    {
        
    }
    @IBAction func goalTermTypeBtnPressed(_ sender: UIButton)
    {
        
    }
    @IBAction func backButtonPressed(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
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

}
