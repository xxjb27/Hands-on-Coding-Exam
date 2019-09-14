//
//  ViewController.swift
//  Hands on Coding Exam
//
//  Created by Janine Basilio on 13/09/2019.
//  Copyright © 2019 Janine Basilio. All rights reserved.
//

import UIKit

let gender = ["Female","Male"]
class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtMiddleInitial: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var pickerGender: UIPickerView!
    @IBOutlet weak var lblAge: UILabel!
    
    @IBOutlet weak var lblGender: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerGender.delegate = self
        pickerGender.dataSource = self
        //datePicker.delegate = self
        
        // Do any additional setup after loading the view.
        txtFirstName.delegate = self as? UITextFieldDelegate
        txtMiddleInitial.delegate = self as? UITextFieldDelegate
        txtLastName.delegate = self as? UITextFieldDelegate
        txtEmailAddress.delegate = self as? UITextFieldDelegate
        txtMobileNumber.delegate = self as? UITextFieldDelegate
        
        lblGender.text = ""
        
        
        datePicker.setDate(Date(), animated: false)
        
        //pickerGender.selectRow(1, inComponent: 0, animated: true)
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(ViewController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        
        if lblGender.text == "" {
            let alertController = UIAlertController(title: "Warning!", message: "Gender should not be empty", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            // Show the alert action
            self.present(alertController, animated: true) { }
        }
    }
    @objc func didTapView(){
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         lblGender.text = "\(gender[row])"
    }
    
    @IBAction func btnFirstName(_ sender: UITextField) {
        if (txtFirstName.text == "") {
            // Create alert dialog
            let alertController = UIAlertController(title: "Warning!", message: "First Name should not be empty", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            // Show the alert action
            self.present(alertController, animated: true) { }
        }
        
    }
    
    @IBAction func btnMiddleInitial(_ sender: UITextField) {
        if (txtMiddleInitial.text == "") {
            // Create alert dialog
            let alertController = UIAlertController(title: "Warning!", message: "Middle Initial should not be empty", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            // Show the alert action
            self.present(alertController, animated: true) { }
        }
        else if (txtMiddleInitial.text?.count)! > 3 {
            // Create alert dialog
            let alertController = UIAlertController(title: "Warning!", message: "Middle Initial should not be more than 3", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            // Show the alert action
            self.present(alertController, animated: true) { }
            
        }
    }
    
    @IBAction func txtLastName(_ sender: UITextField) {
        if (txtLastName.text == "") {
            // Create alert dialog
            let alertController = UIAlertController(title: "Warning!", message: "Last Name should not be empty", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            // Show the alert action
            self.present(alertController, animated: true) { }
        }
    }
    
    @IBAction func txtEmailAddress(_ sender: UITextField) {
        let stringEmailAddress = txtEmailAddress.text
        let emailAddress = stringEmailAddress?.suffix(10)
       
        if (txtEmailAddress.text == "") {
            // Create alert dialog
            let alertController = UIAlertController(title: "Warning!", message: "Email Address should not be empty", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            // Show the alert action
            self.present(alertController, animated: true) { }
        }
        else if emailAddress != "@yahoo.com" && emailAddress != "@gmail.com" {
            let alertController = UIAlertController(title: "Alert!", message: "Email Address should last with @yahoo.com or @gmail.com", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            
            // Show the alert action
            self.present(alertController, animated: true) { }
        }
        print(emailAddress)
    }
    
    @IBAction func btnMobileNumber(_ sender: UITextField) {
        var stringMobileNumber = txtMobileNumber.text
        var first2 = stringMobileNumber?.prefix(2)
        
        if (txtMobileNumber.text == "") {
            // Create alert dialog
            let alertController = UIAlertController(title: "Warning!", message: "Mobile Number should not be empty", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            // Show the alert action
            self.present(alertController, animated: true) { }
        }
        
        else if first2 != "09" {
            let alertController = UIAlertController(title: "Alert!", message: "Mobile Number should starts with 09.", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            
            // Show the alert action
            self.present(alertController, animated: true) { }
        }
        else if (txtMobileNumber.text?.count)! <= 10 {
            let alertController = UIAlertController(title: "Alert!", message: "Mobile Number should be 11 numbers.", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            
            // Show the alert action
            self.present(alertController, animated: true) { }
        }
        
    }
    
    @IBAction func btnDatePicker(_ sender: Any) {
                //1 - get selected date from date picker
        let birthDate = self.datePicker.date
        
        //2 - get today date
        let today = Date()
        
        //3 - create an instance of the user's current calendar
        let calendar = Calendar.current
        
        //4 - use calendar to get difference between two dates
        let components = calendar.dateComponents([.year, .month, .day], from: birthDate, to: today)
        
        let ageYears = components.year
        let ageMonths = components.month
        let ageDays = components.day
        var age = 0
        age = ageYears!
        //5 - display age in label
        self.lblAge.text = "\(ageYears!)"
        
        if ageYears! <= 17{
            let alertController = UIAlertController(title: "Alert!", message: "Age should be 18 above.", preferredStyle: .alert)
            // let generation:String = String(txtGeneration.text!)!
            
            
            // Create ok alert action
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                print("Ok button is clicked")
            }
            // Add the ok alert action to your alert dialog
            alertController.addAction(OKAction)
            
            
            // Show the alert action
            self.present(alertController, animated: true) { }
        }
    }
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        
        if (textField.tag == 1){
            if string.count > 0 {
                let allowedCharacters = CharacterSet(charactersIn: "0123456789").inverted
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.count == 0
                
            }
        }
        if (textField.tag == 2){
            if string.count > 0 {
                let allowedCharacters = CharacterSet(charactersIn: "ABCDEFGHIJKLKMNOPQRSTUVWXYZ.")
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.count == 0
            }
            
        }
        if (textField.tag == 3){
            if string.count > 0 {
                let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ")
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.count == 0
            }
        }
        if (textField.tag == 4){
            if string.count > 0 {
                //var allowedCharacters = CharacterSet.letters
                let allowedCharacters = CharacterSet(charactersIn: "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ@_. ")
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.count == 0
            }
        }
        if (textField.tag == 5){
            if string.count > 0 {
                //var allowedCharacters = CharacterSet.letters
                let allowedCharacters = CharacterSet(charactersIn: "0123456789")
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return unwantedStr.count == 0
            }
            
            
        }
        return true
        
    }
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
        
    }
    
}
