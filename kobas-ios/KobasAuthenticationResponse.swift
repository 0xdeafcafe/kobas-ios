//
//  KobasAuthenticationResponse.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 21/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import ObjectMapper

class KobasAuthenticationResponse : Mappable {
	var id : Int?
	var name : String?
	var staffId : Int?
	var username : String?
	var level : Int?
	var loginFailed : Int?
	var lastLogin : NSDate?
	var lockedOut : Bool?
	var lockedUntil : NSDate?
	
	required init?(_ map: Map) {
		
	}
	
	func mapping(map: Map) {
		id				<- map["id"]
		name			<- map["name"]
		staffId			<- map["staffid"]
		username		<- map["username"]
		level			<- map["level"]
		loginFailed		<- map["loginfailed"]
		lastLogin		<- (map["lastlogin"], KobasDateTransform())
		lockedOut		<- map["lockedout"]
		lockedUntil     <- (map["lockeduntil"], KobasDateTransform())
	}
}
