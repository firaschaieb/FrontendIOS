//
//  DashboardViewController.swift
//  MiniProjetFCWBN
//
//  Created by MASTERAPP on 29/11/21.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var WelcUserField: UILabel!
    var currentUser: Array<Dictionary<String, AnyObject>> = []
    var username: String = ""
    var firstname: String = ""
    var lastname: String = ""
    var phone: String = ""
    var address: String = ""
    var email: String = ""
    var userID: String = ""
    var roles: String = ""
    
    
    
    //for google
    var googleId = ""
    var googleFirstName = ""
    var googleLastName = ""
    var googleEmail = ""
    var googleProfilePicURL = ""
    var googleIDToken = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(googleId)
        print(currentUser.count)
        if (currentUser.count >= 0)
        {
        setUser()
        WelcUserField.text! = firstname+" "+lastname
        }
        WelcUserField.text! = googleId
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUser(){
       // userID = currentUser[0]["_id"] as! String
        username = currentUser[0]["username"] as! String
        firstname = currentUser[0]["firstname"] as! String
        lastname = currentUser[0]["lastname"] as! String
        phone = currentUser[0]["phone"] as! String
        address = currentUser[0]["address"] as! String
        email = currentUser[0]["email"] as! String
       // roles = currentUser[0]["roles"] as! String
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
            currentUser.remove(at: 0)
        username = ""
        email = ""
        userID = ""
        roles = ""
        firstname = ""
        lastname = ""
        phone = ""
        address = ""
    }
    
    @IBAction func profileButton(_ sender: Any) {
        self.performSegue(withIdentifier: "profileSegue", sender: self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let des = segue.destination as? ProfileViewController {
            des.resultArray =  currentUser
        }
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
