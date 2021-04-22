//
//  RegisterUserViewController.swift
//  Login and Sign Up View
//
//  Created by Obhan, Dev P on 4/12/21.
//  Copyright © 2021 Obhan, Dev P. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController {

@IBOutlet weak var firstNameTextField: UITextField!
@IBOutlet weak var lastNameTextField: UITextField!
@IBOutlet weak var emailAddressTextField: UITextField!
@IBOutlet weak var passwordTextField: UITextField!
@IBOutlet weak var repeatPasswordTextField: UITextField!
    
override func viewDidLoad() {
super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        print("Cancel button tapped")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        print("Sign Up button tapped")
        
   /*    // Valiate required fields are not empty
        if  (firstNameTextField.text?.isEmpty)! ||
            (lastNameTextField.text?.isEmpty)! ||
            (emailAddressTextField.text?.isEmpty)! ||
            (passwordTextField.text?.isEmpty)!}
        {
            // Display Alert message and return
            displayMessage(userMessage: "All fields are required to fill in")
            return
        }
        
        // Validate password
        if
            (passwordTextField.text?.elementsEqual(repeatPasswordTextField.text!))! != true
        {
            // Display alert message and return
            displayMessage(userMessage: "Please make sure that the passwords match")
            return
        }
        
    // Create Activity Indicator
        
        let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        
        // Positive Actity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        // Prevent Activity Indicator from hiding when stopAnimating()  is called
        myActivityIndicator.hidesWhenStopped = false
        
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
        
        // Send HTTP request to Register user
        let myUrl = URL(string: "http://loginandsignupview/api/login")
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "POST" // Compose a query string
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let postString = ["firstName": firstNameTextField.text!,
                          "lastName": lastNameTextField.text!,
                          "userName": emailAddressTextField.text!,
                          "userPassword": passwordTextField.text!,
                          ] as [String: String]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            displayMessage(userMessage: "Something went wrong. Try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
        
            self.removeActivityIndicator(activityIndicator: myActivityIndicator)
            
            if error != nil
            {self.displayMessage(userMessage: "Could not succesfully perform this request. Please try again later.")
                print("error=\(String(describing: error))")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    
                    let userId = parseJSON["userId"] as? String
                    print("User id: \(String(describing: userId"))")
                    
                        if (userId?isEmpty)!
                        {
                        
                    }
                }
            }
            
            task.resume()
            
        }
    
}

func displayMessage(userMessage:String) -> Void {
    DispatchQueue.main.async {
        
        let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default)
        { (action:UIAlertAction!) in
        // Code in this block will trigger when OK button tapped
        print("OK button tapped")
        DispatchQueue.main.async
            {
                self.dismiss(animated: true, completion: nil)
        }
            
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)


    } */

 


 }

        





}
