//
//  RoleModel.swift
//  MiniProjetFCWBN
//
//  Created by MASTERAPP on 25/11/21.
//

import Foundation

class Role : NSObject{
    var _id : String?
    var name : String?
    override init(){}

    init(_ dic : [String : Any]){
if let _id = dic["_id"] as! String?{
    self._id = _id
}
if let _name = dic["name"] as! String?{
    self.name = _name
}
    }
}
