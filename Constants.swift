//
//  Constants.swift
//  MiniProjetFCWBN
//
//  Created by MASTERAPP on 25/11/21.
//

import Foundation
import UIKit
class Constants {
    static let baseURL = "http://localhost:8080/"
    
    static let RegisterUser = baseURL + "api/auth/signup"
    static let AccessPublicResources = baseURL + "api/test/all"
    static let AccessProtectedResources = baseURL + "api/test/user"
    static let LoginAnAccount = baseURL + "api/auth/signin"
    static let TestAdmin = baseURL + "api/test/admin"
    
    
}
