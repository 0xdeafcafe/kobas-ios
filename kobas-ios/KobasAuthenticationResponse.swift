//
//  KobasAuthenticationResponse.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 21/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import JSONJoy

struct KobasAuthenticationResponse : JSONJoy {
	var id : Int
	var name : String
	var staffId : Int
	var username : String
	var level : Int
	var loginFailed : Int
	var lastLogin : NSDate
	var lockedOut : Bool
	var lockedUntil : NSDate
	
	init(_ decoder: JSONDecoder) {
		self.id = decoder["id"].integer!
		self.name = decoder["name"].string!
		self.staffId = decoder["staffid"].integer!
		self.username = decoder["username"].string!
		self.level = decoder["level"].integer!
		self.loginFailed = decoder["loginfailed"].integer!
		self.lastLogin = NSDate.dateFromString(decoder["lastlogin"].string!, dateFormatter: nil)
		self.lockedOut = decoder["lockedout"].bool
		self.lockedUntil = NSDate.dateFromString(decoder["lockeduntil"].string!, dateFormatter: nil)
	}
}
