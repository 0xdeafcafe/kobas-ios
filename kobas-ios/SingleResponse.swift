//
//  Response.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 17/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import JSONJoy

struct SingleResponse<T : JSONJoy> : JSONJoy {
	var sessionExpired : Bool?
	var success : Bool?
	var data : T?
	
	init() {
		
	}
	
	init(_ decoder: JSONDecoder) {
		sessionExpired = decoder["session_expired"].bool
		success = decoder["success"].bool
		data = T(decoder["data"])
	}
}
