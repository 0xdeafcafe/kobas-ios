//
//  KobasDateTransform.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 21/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import ObjectMapper

public class KobasDateTransform: TransformType {
	public typealias Object = NSDate
	public typealias JSON = String
	
	public init() {}
	
	public func transformFromJSON(value: AnyObject?) -> NSDate? {
		if let timeString = value as? String {
			return NSDate.dateFromString(timeString, dateFormatter: nil)
		}
		return nil
	}
	
	public func transformToJSON(value: NSDate?) -> String? {
		if let date = value {
			return String.stringFromDate(date, dateFormatter: nil)
		}
		return nil
	}
}