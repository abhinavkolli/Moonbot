//
//  UserProfileTableViewController.swift
//  Moonbot
//
//  Created by Vaille, Ciaran A on 3/29/21.
//  Copyright © 2021 Kolli, Abhinav R. All rights reserved.
//

import UIKit

class UserProfileTableViewController: UITableViewController {
    
    static var userProfileTableViewController: UserProfileTableViewController?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var mobileNumberLabel: UILabel!
    
    var userFirstName: String? = "Ciaran" {
        didSet {
            updateNameLabelText()
        }
    }
    var userLastName: String? = "Vaille" {
        didSet {
            updateNameLabelText()
        }
    }
    
    var userBirthdayDate: Date? {
        didSet {
            updateBirthdayLabel()
        }
    }
    
    var userMobileNumberCountryCode: MobileNumberCountryCode?
    
    var userMobileNumber: Int? = 9728049380 {
        didSet {
            updateMobileNumberLabel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let userProfileTableViewController = UserProfileTableViewController.userProfileTableViewController {
            userFirstName = userProfileTableViewController.userFirstName
            userLastName = userProfileTableViewController.userLastName
            userBirthdayDate = userProfileTableViewController.userBirthdayDate
            userMobileNumberCountryCode = userProfileTableViewController.userMobileNumberCountryCode
            userMobileNumber = userProfileTableViewController.userMobileNumber
        }
        UserProfileTableViewController.userProfileTableViewController = self
        
        self.navigationItem.hidesBackButton = true
        
        /*if let nameLabelText = nameLabel.text {
            //Creates an array that should have two indexes. Index 0 = user first name, Index 1 = user last name.
            let fullNameArr = nameLabelText.split{$0 == " "}.map(String.init)
            
            //Sets the variables that indicates the user's first name and last name based on what the nameLabel's text was set to on the storyboard.
            userFirstName = fullNameArr[0]
            if fullNameArr.count > 1 {
                userLastName = fullNameArr[1]
            }
        }*/
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateNameLabelText()
        updateBirthdayLabel()
        updateMobileNumberLabel()
    }
    
    func updateNameLabelText() {
        if let firstName = userFirstName, let lastName = userLastName {
            nameLabel.text = firstName + " " + lastName
        }
    }
    
    func updateBirthdayLabel() {
        if let birthdayDate = userBirthdayDate {
            //formatter
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            
            //updating label
            birthdayLabel.text = formatter.string(from: birthdayDate)
        }
    }
    
    func updateMobileNumberLabel() {
        if let mobileNumber = userMobileNumber {
            var mobileNumberLabelNewText = "(" + String(mobileNumber).prefix(3) + ") " + String(mobileNumber)[String(mobileNumber).index(String(mobileNumber).endIndex, offsetBy: -1 * (String(mobileNumber).count - 3))...]
            mobileNumberLabelNewText = mobileNumberLabelNewText.prefix(9) + "-" + mobileNumberLabelNewText[mobileNumberLabelNewText.index(mobileNumberLabelNewText.endIndex, offsetBy: -1 * (mobileNumberLabelNewText.count - 9))...]
            mobileNumberLabel.text = mobileNumberLabelNewText
        }
    }

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