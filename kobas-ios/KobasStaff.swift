//
//  KobasStaff.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 17/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import JSONJoy

struct KobasStaff : JSONJoy {
	var id : Int?
	var userId : Int?
	var title : String?
	var firstName : String?
	var lastName : String?
	var name : String?
	var gender : String?
	var email : String?
	var telephone : String?
	var mobile : String?
	var address1 : String?
	var address2 : String?
	var town : String?
	var postcode : String?
	var dateOfBirth : String?
	var applicationFormUrl : String?
	var cvUrl : String?
	var profileImageUrl : String?
	var startDate : String?
	var endDate : String?
	var nextReview : String?
	var nextAppraisal : String?
	var bStage1 : Bool?
	var bStage2 : Bool?
	var bStage3 : Bool?
	var bStage4 : Bool?
	var bStage5 : Bool?
	var bOffered : Bool?
	var bRejected : Bool?
	var bNewStarter : Bool?
	var bLeft : Bool?
	var bExported : Bool?
	var bReinstated : Bool?
	var venueId : Int?
	var level : Int?
	var appliedJobId : Int?
	var oldTitle : String?
	var oldFirstName : String?
	var oldLastName : String?
	var oldEmail : String?
	var oldTelephone : String?
	var oldMobile : String?
	var oldAddress1 : String?
	var oldAddress2 : String?
	var oldTown : String?
	var oldPostcode : String?
	var acceptDate : String?
	var rejectDate : String?
	var newStarterDate : String?
	var formerStaffId : Int?
	var modifiedAt : String?
	var createdAt : String?
	var active : Bool?
	
	init(_ decoder: JSONDecoder) {
		id = decoder["id"].integer
		userId = decoder["userid"].integer
		title = decoder["title"].string
		firstName = decoder["firstname"].string
		lastName = decoder["surname"].string
		name = decoder["name"].string
		gender = decoder["gender"].string
		email = decoder["email"].string
		telephone = decoder["telephone"].string
		mobile = decoder["mobile"].string
		address1 = decoder["address1"].string
		address2 = decoder["address2"].string
		town = decoder["town"].string
		postcode = decoder["postcode"].string
		dateOfBirth = decoder["dob"].string
		applicationFormUrl = decoder["applicationformurl"].string
		cvUrl = decoder["cvurl"].string
		profileImageUrl = decoder["profileimageurl"].string
		startDate = decoder["startdate"].string
		endDate = decoder["enddate"].string
		nextReview = decoder["nextreview"].string
		nextAppraisal = decoder["nextappraisal"].string
		bStage1 = decoder["bstage1"].bool
		bStage2 = decoder["bstage2"].bool
		bStage3 = decoder["bstage3"].bool
		bStage4 = decoder["bstage4"].bool
		bStage5 = decoder["bstage5"].bool
		bOffered = decoder["boffered"].bool
		bRejected = decoder["brejected"].bool
		bNewStarter = decoder["bnewstarter"].bool
		bLeft = decoder["bleft"].bool
		bExported = decoder["bexported"].bool
		bReinstated = decoder["breinstated"].bool
		venueId = decoder["venueid"].integer
		level = decoder["level"].integer
		appliedJobId = decoder["appliedjobid"].integer
		oldTitle = decoder["oldtitle"].string
		oldFirstName = decoder["oldfirstname"].string
		oldLastName = decoder["oldsurname"].string
		oldEmail = decoder["oldemail"].string
		oldTelephone = decoder["oldtelephone"].string
		oldMobile = decoder["oldmobile"].string
		oldAddress1 = decoder["oldaddress1"].string
		oldAddress2 = decoder["oldaddress2"].string
		oldTown = decoder["oldtown"].string
		oldPostcode = decoder["oldpostcode"].string
		acceptDate = decoder["acceptdate"].string
		rejectDate = decoder["rejectdate"].string
		newStarterDate = decoder["newstarterdate"].string
		formerStaffId = decoder["formerstaffid"].integer
		modifiedAt = decoder["m_date"].string
		createdAt = decoder["c_date"].string
		active = decoder["active"].bool
	}
}
