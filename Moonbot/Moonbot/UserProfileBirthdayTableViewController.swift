//
//  UserProfileBirthdayTableViewController.swift
//  Moonbot
//
//  Created by Vaille, Ciaran A on 4/14/21.
//  Copyright © 2021 Kolli, Abhinav R. All rights reserved.
//

import UIKit

class UserProfileBirthdayTableViewController: UITableViewController {

    @IBOutlet var birthdayDateTextField: UITextField!
    
    @IBOutlet var birthdayDateLabel: UILabel!
    
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //sets key settings on the date formatter
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        //updates the birthday date label to accurately reflect the user's birthday
        if let birthdayDate = UserProfileTableViewController.userProfileTableViewController?.userBirthdayDate {
            birthdayDateLabel.text = dateFormatter.string(from: birthdayDate)
        }
        
        //date picker actually gets created
        createDatePicker()
    }
    
    func createDatePicker() {
        //toolbar
        let toolbar = UIToolbar(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.frame.size.width, height: CGFloat(44))))
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        birthdayDateTextField.inputAccessoryView = toolbar
        
        //assign date picker to the text field
        birthdayDateTextField.inputView = datePicker
 
        //date picker mode
        datePicker.datePickerMode = .date
        
        //set min and max date of date picker
        let calendar = Calendar(identifier: .gregorian)

        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar

        components.year = -18
        components.month = 0
        let maxDate = calendar.date(byAdding: components, to: currentDate)!

        components.year = -120
        let minDate = calendar.date(byAdding: components, to: currentDate)!
        
        datePicker.maximumDate = maxDate
        datePicker.minimumDate = minDate
        
        //set current date of date picker
        if let birthdayDate = UserProfileTableViewController.userProfileTableViewController?.userBirthdayDate {
            datePicker.date = birthdayDate
        }
    }
    
    @objc func donePressed() {
        //updates user profile table view
        UserProfileTableViewController.userProfileTableViewController?.userBirthdayDate = datePicker.date
        
        //updates the birthday date label
        birthdayDateLabel.text = dateFormatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    @IBAction func BirthdayDateTextFieldEditingChanged(_ sender: UITextField) {
        birthdayDateTextField.text = String.init()
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            createDatePicker()
        }
    }*/
    
    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    /*override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
