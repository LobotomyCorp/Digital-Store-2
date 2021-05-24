//
//  SecondViewController.swift
//  Digital Store 2
//
//  Created by user191299 on 5/24/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func closeKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
