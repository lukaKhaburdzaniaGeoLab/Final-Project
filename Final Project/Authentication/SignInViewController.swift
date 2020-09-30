//
//  SignInViewController.swift
//  Final Project
//
//  Created by Luka Khaburdzania on 8/3/20.
//  Copyright © 2020 Luka Khaburdzania. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet var logInBtn: UIButton!
    @IBOutlet var registrationBtn: UIButton!
    
    //MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleFilledButton(logInBtn)
        Utilities.styleHollowButton(registrationBtn)
    }
    
    //MARK: View setup
    
    @IBAction func logInButtonClicked(_ sender: Any) {
        let vc = LogInViewController(nibName: "LogInViewController", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func registrationButtonClicked(_ sender: Any) {
        let vc = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }


}

