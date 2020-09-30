//
//  LogInViewController.swift
//  Final Project
//
//  Created by Luka Khaburdzania on 8/3/20.
//  Copyright © 2020 Luka Khaburdzania. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class LogInViewController: UIViewController {
    
    //MARK: Class variables
    
    let db = Firestore.firestore()
    
    //MARK: IBOutlets
    
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var logInBtn: UIButton!
    @IBOutlet var errorLbl: UILabel!
    
    //MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLbl.alpha = 0
        hideKeyboardWhenTappedAround()
        Utilities.styleFilledButton(logInBtn)
        Utilities.styleTextField(emailTxt)
        Utilities.styleTextField(passwordTxt)
    }
    
    @IBAction func logInButtonClicked(_ sender: Any) {
        // Create cleaned versions of the text field
        let email = emailTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // Couldn't sign in
                self.errorLbl.text = error!.localizedDescription
                self.errorLbl.alpha = 1
            }
            else {
                let vc = TabBarController(nibName: "TabBarController", bundle: nil)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}
