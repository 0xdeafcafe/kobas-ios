//
//  KobasUserLevel.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 21/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import ObjectMapper

class KobasUserLevel : Mappable {
	var id : Int?
	var name : String?
	var ordering : Int?
	var modifiedDate : NSDate?
	var createdDate : NSDate?
	var active : Bool?
	var permissions : [Int]?
	
	
	required init?(_ map: Map) {
		
	}
	
	func mapping(map: Map) {
		id				<- map["id"]
		name			<- map["name"]
		ordering		<- map["ordering"]
		modifiedDate	<- (map["m_date"], KobasDateTransform())
		createdDate		<- (map["c_date"], KobasDateTransform())
		active			<- map["active"]
		permissions		<- map["permissions"]
	}
}