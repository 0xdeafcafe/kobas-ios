//
//  Response.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 17/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import ObjectMapper

class SingleResponse<T : Mappable> : Mappable {
	var sessionExpired : Bool?
	var success : Bool?
	var data : T?
	
	required init?(_ map: Map) {
		
	}
	
	func mapping(map: Map) {
		sessionExpired	<- map["sessionexpired"]
		success			<- map["success"]
		data			<- map["data"]
	}
}
