//
//  HomeViewController.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 16/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
	
	@IBOutlet weak var WelcomeTitleLabel: UILabel!
	@IBOutlet weak var ProfilePictureImageView: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		WelcomeTitleLabel.text = String(format: "Welcome to Kobas\n%@!", (AppDelegate.kobasApiClient.getAuthenticatedStaff()?.name)!)
		
		let url = NSURL(string: String(format: "https://kobas.s3.amazonaws.com/%@", AppDelegate.kobasApiClient.getAuthenticatedStaff()!.profileImageUrl!))
		let data = NSData(contentsOfURL: url!)
		ProfilePictureImageView.image = UIImage(data: data!)
	}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
