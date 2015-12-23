//
//  HomeViewController.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 16/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
//	
//	@IBOutlet weak var ProfilePictureImageView: UIImageView!
//	@IBOutlet weak var StaffNameLabel: UILabel!
//	@IBOutlet weak var StaffLevelLabel: UILabel!
//	
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//		ProfilePictureImageView.layer.cornerRadius = 55
//		
//		StaffNameLabel.text = AppDelegate.kobasApiClient.getAuthenticatedStaff()?.name!
//		
//		let url = NSURL(string: String(format: "https://kobas.s3.amazonaws.com/%@", AppDelegate.kobasApiClient.getAuthenticatedStaff()!.profileImageUrl!))
//		let data = NSData(contentsOfURL: url!)
//		ProfilePictureImageView.image = UIImage(data: data!)
//		
//		// get user level
//		AppDelegate.kobasApiClient.getUserLevels { (result : [KobasUserLevel]?, error) -> () in
//			let userLevelId = AppDelegate.kobasApiClient.getAuthenticatedStaff()!.level
//			let userLevel = result?.filter({$0.id == userLevelId}).first
//			self.StaffLevelLabel.text = userLevel?.name
//		}
//		
//		// get venue
	}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
