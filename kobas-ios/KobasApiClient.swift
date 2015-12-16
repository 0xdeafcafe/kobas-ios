//
//  KobasApiClient.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 16/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import SwiftHTTP

class KobasApiClient {
	func Authenticate(loginModel: LoginModel) {
		let params = [
			"companyid": String(loginModel.companyIdentifier),
			"username": loginModel.username,
			"password": loginModel.password,
			"bLoginSubmit": "Login",
			"submitted": "1"
		]
		
		do {
			let opt = try HTTP.POST("https://login.kobas.co.uk/index.php", parameters: params)
			opt.start { response in
				print(response.description)
			}
		} catch let error {
			print("got an error creating the request: \(error)")
		}
	}
}