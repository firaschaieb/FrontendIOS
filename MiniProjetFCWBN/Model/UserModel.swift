//
//  UserModel.swift
//  MiniProjetFCWBN
//
//  Created by MASTERAPP on 25/11/21.
//

import Foundation

class User: NSObject {
    var _id : String?
    var username : String?
    var email : String?
    var password : String?
    var role = Role()

override init(){}

init(_ dic : [String : Any]){
    if let _id = dic["_id"] as! String?{
        self._id = _id
    }
    if let _username = dic["username"] as! String?{
        self.username = _username
    }
    if let _email = dic["email"] as! String?{
        self.email = _email
    }
    if let _password = dic["password"] as! String?{
        self.password = _password
    }
    if let _role = dic["roles"] {
        self.role = Role(_role as! [String:Any])
    }
    
}
}
