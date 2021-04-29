//
//  ViewController.swift
//  Login and Sign Up View
//
//  Created by Obhan, Dev P on 3/31/21.
//  Copyright © 2021 Obhan, Dev P. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButtonTapped(_ sender: Any) {
        print("Sign in button tapped")
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        print("Register button tapped")
        
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterUserViewController") as! RegisterUserViewController
        
        self.present(registerViewController, animated: true)
    }
    
}

