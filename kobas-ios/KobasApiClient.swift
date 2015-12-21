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
	private let ApiLoginEndpoint : String = "data/me/log/in"
	private let ApiStaffEndpoint : String = "data/staff"
	
	private var kobasAuthenticationCookie : String? = nil
	private var kobasAuthenticationExpiry : NSDate? = nil
	private var kobasStaffId : Int? = nil
	private var kobasStaffHomeVenueId : Int? = nil
	
	private var companyId : Int? = nil
	private var username : String? = nil
	private var password : String? = nil
	
	enum ClientSettingsKeys {
		static let companyIdKey = "ClientCompanyId"
		static let usernameKey = "ClientUsername"
		static let passwordKey = "ClientPassword"
		static let kobasAuthenticationCookieKey = "ClientKobasAuthenticationCookie"
		static let kobasAuthenticationExpiryKey = "ClientKobasAuthenticationExpiry"
		static let kobasStaffId = "ClientKobasStaffId"
		static let kobasStaffHomeVenueId = "ClientKobasStaffHomeVenueId"
	}
	
	init() {
		// Load possible stored data
		let defaults = NSUserDefaults.standardUserDefaults()
		
		if let companyId = defaults.stringForKey(ClientSettingsKeys.companyIdKey),
		   let username = defaults.stringForKey(ClientSettingsKeys.usernameKey),
		   let password = defaults.stringForKey(ClientSettingsKeys.passwordKey),
		   let kobasAuthenticationCookie = defaults.stringForKey(ClientSettingsKeys.kobasAuthenticationCookieKey),
		   let kobasAuthenticationExpiry = defaults.stringForKey(ClientSettingsKeys.kobasAuthenticationExpiryKey),
		   let kobasStaffId = defaults.stringForKey(ClientSettingsKeys.kobasStaffId),
		   let kobasStaffHomeVenueId = defaults.stringForKey(ClientSettingsKeys.kobasStaffHomeVenueId) {
				self.companyId = Int(companyId)
				self.username = username
				self.password = password
				self.kobasAuthenticationCookie = kobasAuthenticationCookie
				self.kobasAuthenticationExpiry = NSDate.dateFromString(kobasAuthenticationExpiry, dateFormatter: nil)
				self.kobasStaffId = Int(kobasStaffId)
				self.kobasStaffHomeVenueId = Int(kobasStaffHomeVenueId)
		}
	}
	
	func getStaff(Completion: (result: ArrayResponse<KobasStaff>, error: Int?) -> ()) -> Void {
		self.clearCookies()
		
		let headers = [
			"Cookie": "KOBAS=" + self.kobasAuthenticationCookie!,
			"Accept": "application/json"
		]
		
		Alamofire.request(.GET, ApiBaseUrl + ApiStaffEndpoint, headers: headers).responseJSON { response in
			let x = ArrayResponse<KobasStaff>(JSONDecoder(response.data!))
			Completion(result: x, error: nil)
		}
	}
	
	func getStaff(staffId : Int, Completion: (result: SingleResponse<KobasStaff>, error: Int?) -> ()) -> Void {
		self.clearCookies()
		
		let headers = [
			"Cookie": "KOBAS=" + self.kobasAuthenticationCookie!,
			"Accept": "application/json"
		]
		
		Alamofire.request(.GET, ApiBaseUrl + ApiStaffEndpoint + "/" + String(staffId), headers: headers).responseJSON { response in
			let x = SingleResponse<KobasStaff>(JSONDecoder(response.data!))
			Completion(result: x, error: nil)
		}
	}
	
	func authenticate(loginModel: LoginModel, Completion: (result: KobasAuthenticationResponse?, error: Int?) -> ()) -> Void {
		self.clearCookies()
		
		let params = [
			"company_id": String(loginModel.companyIdentifier),
			"username": loginModel.username,
			"password": loginModel.password
		]
		
		Alamofire.request(.POST, ApiBaseUrl + ApiLoginEndpoint, parameters: params).responseJSON { response in
			if response.response?.statusCode != 200 {
				Completion(result: nil, error: 0)
			}
			
			let kobasCookie = response.response?.allHeaderFields["Set-Cookie"] as? String
			let authenticationResponseParsed = KobasAuthenticationResponse(JSONDecoder(response.data!))
			
			self.username = loginModel.username
			self.password = loginModel.password
			self.companyId = loginModel.companyIdentifier
			self.kobasStaffId = authenticationResponseParsed.staffId
			self.kobasAuthenticationCookie = kobasCookie
			self.kobasAuthenticationExpiry =  NSDate().dateByAddingTimeInterval(NSTimeInterval(3500))
			self.getStaff(self.kobasStaffId!, Completion: { (result : SingleResponse<KobasStaff>, error) -> () in
				if error != nil {
					// TODO: handle this
				}
				
				self.kobasStaffHomeVenueId = result.data!.venueId
				self.saveUserData()
				
				Completion(result: authenticationResponseParsed, error: nil)
			})
		}
	}
	
	// Private Functions
	
	private func saveUserData() {
		let defaults = NSUserDefaults.standardUserDefaults()
		
		defaults.setValue(self.username, forKey: ClientSettingsKeys.usernameKey)
		defaults.setValue(self.password, forKey: ClientSettingsKeys.passwordKey)
		defaults.setValue(self.companyId, forKey: ClientSettingsKeys.companyIdKey)
		defaults.setValue(self.kobasAuthenticationCookie, forKey: ClientSettingsKeys.kobasAuthenticationCookieKey)
		defaults.setValue(self.kobasAuthenticationExpiry, forKey: ClientSettingsKeys.kobasAuthenticationExpiryKey)
		defaults.setValue(self.kobasStaffId, forKey: ClientSettingsKeys.kobasStaffId)
		defaults.setValue(self.kobasStaffHomeVenueId, forKey: ClientSettingsKeys.kobasStaffHomeVenueId)
	}
	
	private func clearCookies() {
		for cookie in (Alamofire.Manager.sharedInstance.session.configuration.HTTPCookieStorage?.cookies)! {
			Alamofire.Manager.sharedInstance.session.configuration.HTTPCookieStorage?.deleteCookie(cookie)
		}
	}
}