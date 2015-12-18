//
//  KobasApiClient.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 16/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import Alamofire
import JSONJoy

class KobasApiClient {
	private let ApiBaseUrl : String = "https://login.kobas.co.uk/"
	private let ApiLoginEndpoint : String = "index.php"
	private let ApiStaffEndpoint : String = "data/staff"
	
	private var kobasAuthenticationCookie : String? = nil
	private var kobasAuthenticationCookieExpiry : NSDate? = nil
	
	private var companyId : Int? = nil
	private var username : String? = nil
	private var password : String? = nil
	
	init() {
		// TODO: above variables from storage
	}
	
	func getStaff() {
		self.clearCookies()
		
		let headers = [
			"Cookie": "KOBAS=" + self.kobasAuthenticationCookie!,
			"Accept": "application/json"
		]
		
		Alamofire.request(.GET, ApiBaseUrl + ApiStaffEndpoint, headers: headers).responseJSON { response in
			let x = ArrayResponse<KobasStaff>(JSONDecoder(response.data!))
			print(x)
		}
	}
	
	func getStaff(staffId : Int) {
		self.clearCookies()
		
		let headers = [
			"Cookie": "KOBAS=" + self.kobasAuthenticationCookie!,
			"Accept": "application/json"
		]
		
		Alamofire.request(.GET, ApiBaseUrl + ApiStaffEndpoint + "/" + String(staffId), headers: headers).responseString { response in
			print(response.result.value)
		}
	}
	
	func authenticate(loginModel: LoginModel, Completion: (result: Bool, error: Int?)->()) -> Void {
		let params = [
			"companyid": String(loginModel.companyIdentifier),
			"username": loginModel.username,
			"password": loginModel.password,
			"bLoginSubmit": "Login",
			"submitted": "1"
		]
		
		self.clearCookies()
		
		Alamofire.request(.POST, ApiBaseUrl + ApiLoginEndpoint, parameters: params).responseString { response in
			
			if (response.response?.statusCode != 200 || response.result.value?.contains("id=\"CORELoginErrors\"") == true) {
				Completion(result: false, error: 0)
			}
			
			if let kobasCookie = response.response?.allHeaderFields["Set-Cookie"] as? String {
				let sections = kobasCookie.componentsSeparatedByString(";")
				for section in sections {
					let range = NSString(string: section).rangeOfString("KOBAS", options:.CaseInsensitiveSearch)
					if (range.location == 0) {
						self.kobasAuthenticationCookie = section.substringWithRange(Range<String.Index>(start: section.startIndex.advancedBy(6), end: section.endIndex))
					}
				}
				self.kobasAuthenticationCookieExpiry = NSDate().dateByAddingTimeInterval(3 * 60 * 60)
				self.companyId = loginModel.companyIdentifier
				self.username = loginModel.username
				self.password = loginModel.password
				
				Completion(result: true, error: nil)
			}
			
			Completion(result: false, error: 1)
		}
	}
	
	private func clearCookies() {
		for cookie in (Alamofire.Manager.sharedInstance.session.configuration.HTTPCookieStorage?.cookies)! {
			Alamofire.Manager.sharedInstance.session.configuration.HTTPCookieStorage?.deleteCookie(cookie)
		}
	}
}