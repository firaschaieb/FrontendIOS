//
//  ProfileViewController.swift
//  MiniProjetFCWBN
//
//  Created by MASTERAPP on 06/12/21.
//

import UIKit
class ProfileViewController: UIViewController {
    var resultArray: Array<Dictionary<String, AnyObject>> = []
    @IBOutlet weak var usernameProfile: UILabel!
    @IBOutlet weak var firstnamelLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    
    
    var username: String = ""
    var firstname: String = ""
    var lastname: String = ""
    var phone: String = ""
    var address: String = ""
    var email: String = ""
    var userID: String = ""
    var roles: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUser()
        let QRCodeImage = generateQRCode(from:resultArray[0]["accessToken"] as! String)
        self.QrCode.image = QRCodeImage
        print(resultArray)
        
        usernameProfile.text! = username
        firstnamelLabel.text! = firstname
        lastnameLabel.text! = lastname
        phoneLabel.text! = phone
        addressLabel.text! = address
        emailLabel.text! = email
        // Do any additional setup after loading the view.
    }
    func setUser(){
        //userID = resultArray[0]["_id"] as! String
        username = resultArray[0]["username"] as! String
        firstname = resultArray[0]["firstname"] as! String
        lastname = resultArray[0]["lastname"] as! String
        phone = resultArray[0]["phone"] as! String
        address = resultArray[0]["address"] as! String
        email = resultArray[0]["email"] as! String
        //roles = resultArray[0]["roles"] as! String
    }
    @IBOutlet weak var QrCode: UIImageView!
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
      
        if let QRFilter = CIFilter(name: "CIQRCodeGenerator") {
            QRFilter.setValue(data, forKey: "inputMessage")
            guard let QRImage = QRFilter.outputImage else { return nil }
            
            let scaleUp = CGAffineTransform(scaleX: 10.0, y: 10.0)
            let scaledQR = QRImage.transformed(by: scaleUp)
            
            return UIImage(ciImage: scaledQR)
        }
      
        return nil
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
