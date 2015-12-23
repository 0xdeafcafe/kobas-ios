//
//  LoginViewController.swift
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
		AppDelegate.kobasApiClient.authenticate(loginDetails, Completion: {(result: KobasAuthenticationResponse?, error: ErrorStatus?) in
			if error != nil {
				// look into error code
				let alert = UIAlertController(title: "Unable to Login", message: "The login credentials are incorrect",
					preferredStyle: UIAlertControllerStyle.Alert)
				
				switch error! {
					case .LoginDetailsIncorrect:
						alert.message = "The specified login details are incorrect"
						break;
					
					default:
						alert.message = "Unknown issue causing login to fail. Internal error code: " + String(error?.rawValue)
						break;
				}
				
				alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
				
			} else {
				let appDelegate : AppDelegate! = UIApplication.sharedApplication().delegate as! AppDelegate
				appDelegate.loginSuccessful()
			}
		})
	}
}
