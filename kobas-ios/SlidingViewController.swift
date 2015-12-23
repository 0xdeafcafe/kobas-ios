//
//  SlidingViewController.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 22/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import ECSlidingViewController
import Foundation

class SlidingViewController: ECSlidingViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		//self.topViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MenuViewController")
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func shouldAutorotate() -> Bool {
		return false
	}
	
	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
		return UIInterfaceOrientationMask.Portrait
	}
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
