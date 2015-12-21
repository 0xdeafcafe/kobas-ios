//
//  NSDateExtensions.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 17/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation

public func <(a: NSDate, b: NSDate) -> Bool {
	return a.compare(b) == NSComparisonResult.OrderedAscending
}

public func ==(a: NSDate, b: NSDate) -> Bool {
	return a.compare(b) == NSComparisonResult.OrderedSame
}

extension NSDate: Comparable {
	static func dateFromString(dateAsString : String, var dateFormatter : NSDateFormatter?) -> NSDate {
		if dateFormatter == nil {
			dateFormatter = NSDateFormatter()
		}
		
		dateFormatter!.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return dateFormatter!.dateFromString(dateAsString)!
	}
}