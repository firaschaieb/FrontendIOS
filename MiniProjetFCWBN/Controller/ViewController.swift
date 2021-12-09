//
//  ViewController.swift
//  MiniProjetFCWBN
//
//  Created by Apple Esprit on 8/11/2021.
//

import UIKit
import Alamofire
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    var googleId = ""
    var googleIdToken = ""
    var googleFirstName = ""
    var googleLastName = ""
    var googleEmail = ""
    var googleProfileURL = ""
    
    var resultArray: Array<Dictionary<String, AnyObject>> = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func LoginOnPressed(_ sender: UIButton) {
        let username = usernameField.text!
        let password = passwordField.text!

        let url = "http://localhost:8080/api/auth/signin"
        let parameters = [
            "username": username,
            "password": password
        ]
        if username.isEmpty || password.isEmpty
        {
            displayErrorMessage(errorMessage: "fields cannot be blank")
        }
        else //send params to server, search by email address. alamofire responds with json
        {
            Alamofire.AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
               // print("Request: \(String(describing: response.request))")
               // print("Response: \(String(describing: response.response))")
               // print("Error: \(String(describing: response.error))")
                print("result: \(String(describing: response.result))")
                switch response.result {
                       case .success(let value):
                    if let JSON = (value as? Dictionary<String, AnyObject>){
                            print("JSON: \(JSON)")
                        self.resultArray.append(JSON)
                        print(self.resultArray[0]["username"]!)
                        print(self.resultArray.count)
                        self.performSegue(withIdentifier: "SegueToDashboard", sender: self)
                           }
                case .failure(_): break
                           // error handling
                       }
              }

            
            print("nothing")
           }
    }

    var googleSignIn = GIDSignIn.sharedInstance

      @IBAction func googleLoginBtnAction(_ sender: UIButton) {

          self.googleAuthLogin()

      }
      
      func googleAuthLogin() {
          let googleConfig = GIDConfiguration(clientID: "191533741569-kolaktv3dm4qgbpvmul8gsj95fk2r8uc.apps.googleusercontent.com")
          self.googleSignIn.signIn(with: googleConfig, presenting: self) { user, error in
              if error == nil {
                  guard let user = user else {
                      print("Uh oh. The user cancelled the Google login.")
                      return
                  }
                  let userId = user.userID ?? ""
                  print("Google User ID: \(userId)")
                  self.googleId = userId
                  
                  let userIdToken = user.authentication.idToken ?? ""
                  print("Google ID Token: \(userIdToken)")
                  self.googleIdToken = userIdToken
                  
                  let userFirstName = user.profile?.givenName ?? ""
                  print("Google User First Name: \(userFirstName)")
                  self.googleFirstName = userFirstName
                  
                  let userLastName = user.profile?.familyName ?? ""
                  print("Google User Last Name: \(userLastName)")
                  self.googleLastName = userLastName
                  
                  let userEmail = user.profile?.email ?? ""
                  print("Google User Email: \(userEmail)")
                  self.googleEmail = userEmail
                  
                  let googleProfilePicURL = user.profile?.imageURL(withDimension: 150)?.absoluteString ?? ""
                  print("Google Profile Avatar URL: \(googleProfilePicURL)")
                  self.googleProfileURL = googleProfilePicURL
                  
                  self.performSegue(withIdentifier: "SegueToDashboard", sender: self)
              }
          }
      }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let des = segue.destination as? DashboardViewController {
            des.currentUser = resultArray
            if resultArray.count < 0
            {
                des.googleId = self.googleId
                des.googleIDToken = self.googleIdToken
                des.googleFirstName = self.googleFirstName
                des.googleLastName = self.googleLastName
                des.googleEmail = self.googleEmail
                des.googleProfilePicURL = self.googleProfileURL
            }
        }
    }


    func displayErrorMessage(errorMessage: String){
        let ac = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: .alert)
        let alert = UIAlertAction(title: "ok", style: .default, handler: nil)
        ac.addAction(alert)
        self.present(ac, animated: true, completion: nil)
    }
  

}


