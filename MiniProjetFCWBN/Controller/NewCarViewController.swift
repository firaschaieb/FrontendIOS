//
//  NewCarViewController.swift
//  MiniProjetFCWBN
//
//  Created by MASTERAPP on 06/12/21.
//

import UIKit
import Alamofire
class NewCarViewController: UIViewController {

    @IBOutlet weak var marqueField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var matriculeType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCarButton(_ sender: Any) {
        let url = "http://localhost:3001/vehicule"
        let Marque = marqueField.text!
        let Type = typeField.text!
        let Numematricule = matriculeType.text!
        
        let parameters = [
            "Marque": marqueField.text!,
            "Type": typeField.text!,
            "Numematricule":matriculeType.text!
        ]
        if Marque.isEmpty || Type.isEmpty || Numematricule.isEmpty
        {
            //dipslay alert message
            displayAlertMessage(alert: "No fields can be left empty")
        }
        
        Alamofire.AF.request(url, method: .post, parameters: parameters).validate().responseJSON{
            response in
            switch response.result{
            case .success:
                print("Added Successfully")
            case .failure(let error):
                print(error)
            }
            let successfulRegistration = UIAlertController(title: "Success!", message: "car Successfully Added", preferredStyle: .alert)
            let successAction = UIAlertAction(title: "Ok", style: .default){
                action in self.dismiss(animated: true, completion: nil)
            }
            successfulRegistration.addAction(successAction)
            self.present(successfulRegistration, animated: true, completion: nil)
        }
        
        
    }
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
