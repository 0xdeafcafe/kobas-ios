//
//  ViewController.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 14/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var CompanyIdentifierTextField: UITextField!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButtonPressed(sender: AnyObject) {
		let username = UsernameTextField.text ?? ""
		let password = PasswordTextField.text ?? ""
        var companyIdent = CompanyIdentifierTextField.text
		if (companyIdent == "")
		{
			companyIdent = "0"
		}
		
        let loginDetails = LoginModel.init(companyIdentifier: Int(companyIdent!)!, username: username, password: password);
		AppDelegate.kobasApiClient.authenticate(loginDetails, Completion: {(result: Bool, error: Int?) in
			if (!result) {
				// look into error code
			} else {
				// party!
				AppDelegate.kobasApiClient.getStaff()
			}
		})
	}
}
