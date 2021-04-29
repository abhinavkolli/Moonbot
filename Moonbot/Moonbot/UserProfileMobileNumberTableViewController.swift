//
//  UserProfileMobileNumberTableViewController.swift
//  Moonbot
//
//  Created by Vaille, Ciaran A on 4/16/21.
//  Copyright © 2021 Kolli, Abhinav R. All rights reserved.
//

import UIKit

class UserProfileMobileNumberTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var countryCodeLabel: UILabel!
    @IBOutlet var mobileNumberLabel: UILabel!
    
    @IBOutlet var countryCodeTextField: UITextField!
    @IBOutlet var mobileNumberTextField: UITextField!
    
    let countryCodePicker = UIPickerView()
    
    var currentCountryPickerOptionSelected: MobileNumberCountryCode?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let userMobileNumberCountryCode = UserProfileTableViewController.userProfileTableViewController?.userMobileNumberCountryCode {
            countryCodeLabel.text = userMobileNumberCountryCode.rawValue
        }
        if let userMobileNumber = UserProfileTableViewController.userProfileTableViewController?.userMobileNumber {
            var mobileNumberLabelNewText = "(" + String(userMobileNumber).prefix(3) + ") " + String(userMobileNumber)[String(userMobileNumber).index(String(userMobileNumber).endIndex, offsetBy: -1 * (String(userMobileNumber).count - 3))...]
            mobileNumberLabelNewText = mobileNumberLabelNewText.prefix(9) + "-" + mobileNumberLabelNewText[mobileNumberLabelNewText.index(mobileNumberLabelNewText.endIndex, offsetBy: -1 * (mobileNumberLabelNewText.count - 9))...]
            mobileNumberLabel.text = mobileNumberLabelNewText
        }
        
        createCountryCodePicker()
        
        mobileNumberTextField.text = " "
    }
    
    func createCountryCodePicker() {
        //toolbar
        let toolbar = UIToolbar(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.frame.size.width, height: CGFloat(44))))
        toolbar.sizeToFit()
               
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
               
        //assign toolbar
        countryCodeTextField.inputAccessoryView = toolbar
               
        //assign country code picker to the text field
        countryCodeTextField.inputView = countryCodePicker
               
        //assigns options of country code picker
        countryCodePicker.delegate = self
        countryCodePicker.dataSource = self
        //countryPickerData = getCountryCodePickerPossibleValues()
        
        //set current country selected in country code picker
        if let userMobileNumberCountryCode = UserProfileTableViewController.userProfileTableViewController?.userMobileNumberCountryCode {
            countryCodePicker.selectRow(getMobileNumberCountryCodeIndex(mobileNumberCountryCode: userMobileNumberCountryCode), inComponent: 0, animated: true)
        } else {
            countryCodePicker.selectRow(getMobileNumberCountryCodeIndex(mobileNumberCountryCode: MobileNumberCountryCode.UnitedStates), inComponent: 0, animated: true)
        }
    }
    
    @objc func donePressed() {
        if let mobileNumberCountryCode = currentCountryPickerOptionSelected {
            UserProfileTableViewController.userProfileTableViewController?.userMobileNumberCountryCode = mobileNumberCountryCode
            
            countryCodeLabel.text = mobileNumberCountryCode.rawValue
        }
        
        self.view.endEditing(true)
    }
    
    @IBAction func CountryCodeTextFieldEditingChanged() {
        countryCodeTextField.text = String.init()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MobileNumberCountryCode.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        for (mobileNumberCountryCodeIndex, mobileNumberCountryCode) in MobileNumberCountryCode.allCases.enumerated() {
            if mobileNumberCountryCodeIndex == row {
                return mobileNumberCountryCode.rawValue
            }
        }
        
        return "Something Went Wrong"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        for (mobileNumberCountryCodeIndex, mobileNumberCountryCode) in MobileNumberCountryCode.allCases.enumerated() {
            if mobileNumberCountryCodeIndex == row {
                currentCountryPickerOptionSelected = mobileNumberCountryCode
                return
            }
        }
    }
    
    func getCountryCodePickerPossibleValues() -> [String] {
        var countryCodePickerPossibleValues: [String] = [String]()
        
        for mobileNumberCountryCode in MobileNumberCountryCode.allCases {
            countryCodePickerPossibleValues.append(mobileNumberCountryCode.rawValue)
        }
        
        return countryCodePickerPossibleValues
    }
    
    func getMobileNumberCountryCodeIndex(mobileNumberCountryCode: MobileNumberCountryCode) -> Int {
        for (possibleMatchIndex, possibleMobileNumberCountryCodeMatch) in MobileNumberCountryCode.allCases.enumerated() {
            if mobileNumberCountryCode.rawValue == possibleMobileNumberCountryCodeMatch.rawValue {
                return possibleMatchIndex
            }
        }
        
        return 0
    }
    
    @IBAction func MobileNumberTextFieldEditingChanged() {
        //Gets the editing from the text field.
        if mobileNumberTextField.text!.count > 1 {
            mobileNumberLabel.text!.append(contentsOf: mobileNumberTextField.text![mobileNumberTextField.text!.index(mobileNumberTextField.text!.endIndex, offsetBy: -1 * (mobileNumberTextField.text!.count - 1))...])
        }
        else if mobileNumberTextField.text!.count < 1 {
            if mobileNumberLabel.text!.count > 0 {
                mobileNumberLabel.text!.removeLast()
            }
        }
        
        //Resets the text field.
        mobileNumberTextField.text = " "
        
        //Creates temporary variables.
        let mobileNumberOnlyNumbers = mobileNumberLabel.text!.filter("0123456789.".contains)
        var mobileNumberEdited = mobileNumberOnlyNumbers
        
        //Adds the parenthesis on the front three numbers.
        if mobileNumberOnlyNumbers.count > 3 {
            mobileNumberEdited = "(" + mobileNumberOnlyNumbers.prefix(3) + ") " + mobileNumberOnlyNumbers[mobileNumberOnlyNumbers.index(mobileNumberOnlyNumbers.endIndex, offsetBy: -1 * (mobileNumberOnlyNumbers.count - 3))...]
        }
        
        //Adds the dash between the middle and last set of numbers.
        if mobileNumberOnlyNumbers.count > 6 {
            mobileNumberEdited = mobileNumberEdited.prefix(9) + "-" + mobileNumberOnlyNumbers[mobileNumberOnlyNumbers.index(mobileNumberOnlyNumbers.endIndex, offsetBy: -1 * (mobileNumberOnlyNumbers.count - 6))...]
        }
        
        if mobileNumberEdited.count > 14 {
            mobileNumberEdited = String(mobileNumberEdited.prefix(14))
        }
        
        //Sets the value of the label.
        mobileNumberLabel.text = mobileNumberEdited
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Save the mobile number country code.
        if let mobileNumberCountryCode = currentCountryPickerOptionSelected {
            UserProfileTableViewController.userProfileTableViewController?.userMobileNumberCountryCode = mobileNumberCountryCode
        }
        //Save the mobile number.
        let filteredMobileNumber = mobileNumberLabel.text!.filter("0123456789.".contains)
        if filteredMobileNumber.count == 10 {
            UserProfileTableViewController.userProfileTableViewController?.userMobileNumber = Int(filteredMobileNumber)
        }
    }
    
    
    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */

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
