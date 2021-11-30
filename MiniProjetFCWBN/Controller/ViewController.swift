//
//  ViewController.swift
//  MiniProjetFCWBN
//
//  Created by Apple Esprit on 8/11/2021.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    var resultArray: Array<Dictionary<String, AnyObject>> = []

    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        let username = usernameField.text!
        let password = passwordField.text!
        let url = "http://localhost:8080/api/auth/signin"
        let parameters = [
            "username": usernameField.text!,
            "password": passwordField.text!
        ]
        if username.isEmpty || password.isEmpty
        {
            displayErrorMessage(errorMessage: "fields cannot be blank")
        }
        else //send params to server, search by email address. alamofire responds with json
        {
            Alamofire.AF.request(url, method: .post, parameters: parameters).responseJSON{ response in switch response.result{
            case .success:
                print("Registred Successfully")
            case .failure(let error):
                print(error)
            }
               
                
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToDashboard" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! DashboardViewController
            controller.currentUser = resultArray
            resultArray = []
            usernameField.text! = ""
            passwordField.text! = ""
        }
    }

    func displayErrorMessage(errorMessage: String){
        let ac = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: .alert)
        let alert = UIAlertAction(title: "ok", style: .default, handler: nil)
        ac.addAction(alert)
        self.present(ac, animated: true, completion: nil)
    }
}

