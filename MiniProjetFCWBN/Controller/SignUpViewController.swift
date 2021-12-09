//
//  SignUpViewController.swift
//  MiniProjetFCWBN
//
//  Created by MASTERAPP on 23/11/21.
//

import UIKit
import Alamofire
class SignUpViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var roleField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    var selectedRole: String?
    let roleList = ["assure", "SOS", "assurance"]
    
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return roleList.count
        }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return roleList[row] // dropdown item
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selectedRole = roleList[row] // selected item
    roleField.text = selectedRole
    }
    @IBAction func RegisterButtonQction(_ sender: Any) {
        let url = "http://localhost:8080/api/auth/signup"
        let username = usernameField.text!
        let firstname = firstNameField.text!
        let lastname = lastNameField.text!
        let phone = phoneNumberField.text!
        let address = addressField.text!
        let email = emailField.text!
        let password = passwordField.text!
        let confirmPassword = confirmPasswordField.text!
        let roles = roleField.text!
        

        let parameters = [
            "username": usernameField.text!,
            "firstname": firstNameField.text!,
            "lastname": lastNameField.text!,
            "phone": phoneNumberField.text!,
            "address": addressField.text!,
            "email": emailField.text!,
            "password": passwordField.text!,
            "confirmPassword": confirmPasswordField.text!,
            "roles": roleField.text!
        ]
        
        //check for empty fields
        if username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty || roles.isEmpty || firstname.isEmpty || lastname.isEmpty || phone.isEmpty || address.isEmpty
        {
            //dipslay alert message
            displayAlertMessage(alert: "No fields can be left empty")
        }
        
        //check if password and confirmPassword match
        if password != confirmPassword
        {
            displayAlertMessage(alert: "Passwords do not match")
        }
        
        //store data to db
        Alamofire.AF.request(url, method: .post, parameters: parameters).validate().responseJSON{
            response in
            switch response.result{
            case .success:
                print("Registred Successfully")
            case .failure(let error):
                print(error)
            }
        }
        
        //display alert message with confirmation.
        let successfulRegistration = UIAlertController(title: "Success!", message: "User Successfully Registered", preferredStyle: .alert)
        let successAction = UIAlertAction(title: "Ok", style: .default){
            action in self.dismiss(animated: true, completion: nil)
        }
        successfulRegistration.addAction(successAction)
        self.present(successfulRegistration, animated: true, completion: nil)
    }
    
    //function for displaying alert message
    
    func displayAlertMessage(alert: String){
        let myAlert = UIAlertController(title: "Alert", message: alert, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }

        

        
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     }
    */

}
