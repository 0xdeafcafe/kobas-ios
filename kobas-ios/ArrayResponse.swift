//
//  ArrayResponse.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 18/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import JSONJoy

struct ArrayResponse<T : JSONJoy> : JSONJoy {
	var sessionExpired : Bool?
	var success : Bool?
	var data : Array<T>?
	
	init() {
		
	}
	
	init(_ decoder: JSONDecoder) {
		sessionExpired = decoder["session_expired"].bool
		success = decoder["success"].bool
		if let data = decoder["data"].array {
			self.data = Array<T>()
			for dataDecoder in data {
				self.data!.append(T(dataDecoder))
			}
		}
	}
}
