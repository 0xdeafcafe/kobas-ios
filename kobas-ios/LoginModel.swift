//
//  LoginModel.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 15/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation

class LoginModel {
    var companyIdentifier: Int;
    var username: String;
    var password: String;
    
    init(companyIdentifier: Int, username: String, password: String) {
        self.companyIdentifier = companyIdentifier;
        self.username = username;
        self.password = password;
    }
}