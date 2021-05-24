//
//  ViewController.swift
//  Digital Store 2
//
//  Created by user191299 on 5/24/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var cnsVerticalContent: NSLayoutConstraint!
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController{
    
    func registerKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    func unregisterKeyboardNotification(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: Notification){
        
        let keyboardAnimationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        let finalPosYViewContent = self.viewContent.frame.origin.y + self.viewContent.frame.height
        
        if finalPosYViewContent > keyboardFrame.origin.y{
            
            UIView.animate(withDuration: keyboardAnimationDuration){
            self.cnsVerticalContent.constant = keyboardFrame.origin.y - finalPosYViewContent
            self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification){
        
        let keyboardAnimationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: keyboardAnimationDuration){
            self.cnsVerticalContent.constant = 0
            self.view.layoutIfNeeded()
        }
    }

}

