//
//  UserModel.swift
//  MiniProjetFCWBN
//
//  Created by MASTERAPP on 25/11/21.
//

import Foundation

class User: Decodable {
    var _id : String?
    var username : String?
    var firstname : String?
    var lastname : String?
    var phone : String?
    var address : String?
    var email : String?
    var password : String?
    var role = Role() as! String?
    enum CodingKeys: String, CodingKey {
        case _id
        case username
        case firstname
        case lastname
        case phone
        case address
        case email
        case password
        case role
    }
/*override init(){}

init(_ dic : [String : Any]){
    if let _id = dic["_id"] as! String?{
        self._id = _id
    }
    if let _username = dic["username"] as! String?{
        self.username = _username
    }
    if let _firstname = dic["firstname"] as! String?{
        self.firstname = _firstname
    }
    if let _lastname = dic["lastname"] as! String?{
        self.lastname = _lastname
    }
    if let _phone = dic["phone"] as! String?{
        self.phone = _phone
    }
    if let _address = dic["address"] as! String?{
        self.address = _address
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
    
}*/
    public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.username = try container.decode(String.self, forKey: .username)
            self.email = try container.decode(String.self, forKey: .email)
            self.firstname = try container.decode(String.self, forKey: .firstname)
            self.lastname = try container.decode(String.self, forKey: .lastname)
            self.phone = try container.decode(String.self, forKey: .phone)
            self.password = try container.decode(String.self, forKey: .password)
            self.address = try container.decode(String.self, forKey: .address)
            self.role = try container.decode(String.self, forKey: .role)

        
        }
    }

