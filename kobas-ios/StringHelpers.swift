//
//  StringHelpers.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 16/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation

class StringHelpers {
	static func matchesForRegexInText(regex: String!, text: String!) -> [String] {
		do {
			let regex = try NSRegularExpression(pattern: regex, options: [])
			let nsString = text as NSString
			let results = regex.matchesInString(text,
				options: [], range: NSMakeRange(0, nsString.length))
			return results.map { nsString.substringWithRange($0.range)}
		} catch let error as NSError {
			print("invalid regex: \(error.localizedDescription)")
			return []
		}
	}
}