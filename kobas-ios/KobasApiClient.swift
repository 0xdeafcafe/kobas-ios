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
import ObjectMapper
import AlamofireObjectMapper

class KobasApiClient {
	private let ApiBaseUrl : String = "https://login.kobas.co.uk"
	private let ApiLoginEndpoint : String = "data/me/log/in"
	private let ApiStaffEndpoint : String = "data/staff"
	
	private var kobasAuthenticationCookie : String? = nil
	private var kobasAuthenticationExpiry : NSDate? = nil
	private var kobasStaff : KobasStaff? = nil
	
	private var companyId : Int? = nil
	private var username : String? = nil
	private var password : String? = nil
	
	enum ClientSettingsKeys {
		static let companyIdKey = "ClientCompanyId"
		static let usernameKey = "ClientUsername"
		static let passwordKey = "ClientPassword"
		static let kobasAuthenticationCookieKey = "ClientKobasAuthenticationCookie"
		static let kobasAuthenticationExpiryKey = "ClientKobasAuthenticationExpiry"
		static let kobasStaff = "ClientKobasStaff"
	}
	
	init() {
		// Load possible stored data
		let defaults = NSUserDefaults.standardUserDefaults()
		
		if let companyId = defaults.stringForKey(ClientSettingsKeys.companyIdKey),
		   let username = defaults.stringForKey(ClientSettingsKeys.usernameKey),
		   let password = defaults.stringForKey(ClientSettingsKeys.passwordKey),
		   let kobasAuthenticationCookie = defaults.stringForKey(ClientSettingsKeys.kobasAuthenticationCookieKey),
		   let kobasAuthenticationExpiry = defaults.stringForKey(ClientSettingsKeys.kobasAuthenticationExpiryKey),
		   let kobasStaff = defaults.stringForKey(ClientSettingsKeys.kobasStaff){
				self.companyId = Int(companyId)
				self.username = username
				self.password = password
				self.kobasAuthenticationCookie = kobasAuthenticationCookie
				self.kobasAuthenticationExpiry = NSDate.dateFromString(kobasAuthenticationExpiry, dateFormatter: nil)
				self.kobasStaff = Mapper<KobasStaff>().map(kobasStaff)
		}
	}
	
	func getStaff(Completion: (result: Array<KobasStaff>?, error: ErrorStatus?) -> ()) -> Void {
		self.clearCookies()
		
		let headers = [
			"Cookie": self.kobasAuthenticationCookie!,
			"Accept": "application/json"
		]
		
		Alamofire.request(.GET, String(format: "%@/%@", ApiBaseUrl, ApiStaffEndpoint), headers: headers).responseObject { (response: Response<ArrayResponse<KobasStaff>, NSError>) in
			Completion(result: response.result.value!.data, error: nil)
		}
	}
	
	func getStaff(staffId : Int, Completion: (result: KobasStaff?, error: ErrorStatus?) -> ()) -> Void {
		self.clearCookies()
		
		let headers = [
			"Cookie": self.kobasAuthenticationCookie!,
			"Accept": "application/json"
		]
		
		Alamofire.request(.GET, String(format: "%@/%@/%d", ApiBaseUrl, ApiStaffEndpoint, staffId), headers: headers).responseObject { (response: Response<SingleResponse<KobasStaff>, NSError>) in
			Completion(result: response.result.value!.data, error: nil)
		}
	}
	
	func authenticate(loginModel: LoginModel, Completion: (result: KobasAuthenticationResponse?, error: ErrorStatus?) -> ()) -> Void {
		self.clearCookies()
		
		let params = [
			"company_id": String(loginModel.companyIdentifier),
			"username": loginModel.username,
			"password": loginModel.password
		]
		
		Alamofire.request(.POST, String(format: "%@/%@", ApiBaseUrl, ApiLoginEndpoint), parameters: params).responseObject { (response: Response<KobasAuthenticationResponse, NSError>) in
			if response.response?.statusCode != 200 {
				Completion(result: nil, error: ErrorStatus.LoginDetailsIncorrect)
				return
			}
			
			let kobasCookie = response.response?.allHeaderFields["Set-Cookie"] as? String
			print(String(response.data))
			
			self.username = loginModel.username
			self.password = loginModel.password
			self.companyId = loginModel.companyIdentifier
			self.kobasAuthenticationCookie = kobasCookie
			self.kobasAuthenticationExpiry =  NSDate().dateByAddingTimeInterval(NSTimeInterval(3500))
			self.getStaff(response.result.value!.staffId!, Completion: { (result : KobasStaff?, error : ErrorStatus?) -> () in
				if error != nil {
					Completion(result: nil, error: error)
				}
				
				self.kobasStaff = result!
				self.saveUserData()
				
				Completion(result: response.result.value!, error: nil)
			})
		}
	}
	
	func getAuthenticatedStaff() -> KobasStaff? {
		return self.kobasStaff
	}
	
	// Private Functions
	
	private func saveUserData() {
		let defaults = NSUserDefaults.standardUserDefaults()
		
		defaults.setValue(self.username, forKey: ClientSettingsKeys.usernameKey)
		defaults.setValue(self.password, forKey: ClientSettingsKeys.passwordKey)
		defaults.setValue(self.companyId, forKey: ClientSettingsKeys.companyIdKey)
		defaults.setValue(self.kobasAuthenticationCookie, forKey: ClientSettingsKeys.kobasAuthenticationCookieKey)
		defaults.setValue(self.kobasAuthenticationExpiry, forKey: ClientSettingsKeys.kobasAuthenticationExpiryKey)
		defaults.setValue(Mapper().toJSONString(self.kobasStaff!, prettyPrint: false), forKey: ClientSettingsKeys.kobasStaff)
	}
	
	private func clearCookies() {
		for cookie in (Alamofire.Manager.sharedInstance.session.configuration.HTTPCookieStorage?.cookies)! {
			Alamofire.Manager.sharedInstance.session.configuration.HTTPCookieStorage?.deleteCookie(cookie)
		}
	}
}