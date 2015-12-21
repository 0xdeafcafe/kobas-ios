//
//  StringExtensions.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 17/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation

extension String {
	func contains(value : String) -> Bool {
		return value.rangeOfString(value) != nil
	}
	
	static func stringFromDate(date: NSDate, var dateFormatter : NSDateFormatter?) -> String {
		if dateFormatter == nil {
			dateFormatter = NSDateFormatter()
		}
		
		dateFormatter!.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return dateFormatter!.stringFromDate(date)
	}
}