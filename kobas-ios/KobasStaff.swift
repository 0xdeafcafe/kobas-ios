//
//  KobasStaff.swift
//  kobas-ios
//
//  Created by Alex Forbes-Reed on 17/12/2015.
//  Copyright © 2015 Alex Forbes-Reed. All rights reserved.
//

import Foundation
import ObjectMapper

class KobasStaff : Mappable {
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
	
	required init?(_ map: Map) {
		
	}
	
	func mapping(map: Map) {
		id 					<- map["id"]
		userId 				<- map["userid"]
		title 				<- map["title"]
		firstName 			<- map["firstname"]
		lastName 			<- map["surname"]
		name 				<- map["name"]
		gender 				<- map["gender"]
		email 				<- map["email"]
		telephone 			<- map["telephone"]
		mobile 				<- map["mobile"]
		address1 			<- map["address1"]
		address2 			<- map["address2"]
		town 				<- map["town"]
		postcode 			<- map["postcode"]
		dateOfBirth 		<- map["dob"]
		applicationFormUrl 	<- map["applicationformurl"]
		cvUrl 				<- map["cvurl"]
		profileImageUrl		<- map["profileimageurl"]
		startDate 			<- map["startdate"]
		endDate 			<- map["enddate"]
		nextReview 			<- map["nextreview"]
		nextAppraisal 		<- map["nextappraisal"]
		bStage1 			<- map["bstage1"]
		bStage2 			<- map["bstage2"]
		bStage3 			<- map["bstage3"]
		bStage4 			<- map["bstage4"]
		bStage5 			<- map["bstage5"]
		bOffered 			<- map["boffered"]
		bRejected 			<- map["brejected"]
		bNewStarter 		<- map["bnewstarter"]
		bLeft 				<- map["bleft"]
		bExported 			<- map["bexported"]
		bReinstated 		<- map["breinstated"]
		venueId 			<- map["venueid"]
		level 				<- map["level"]
		appliedJobId 		<- map["appliedjobid"]
		oldTitle 			<- map["oldtitle"]
		oldFirstName 		<- map["oldfirstname"]
		oldLastName 		<- map["oldsurname"]
		oldEmail 			<- map["oldemail"]
		oldTelephone 		<- map["oldtelephone"]
		oldMobile 			<- map["oldmobile"]
		oldAddress1 		<- map["oldaddress1"]
		oldAddress2 		<- map["oldaddress2"]
		oldTown 			<- map["oldtown"]
		oldPostcode 		<- map["oldpostcode"]
		acceptDate 			<- map["acceptdate"]
		rejectDate 			<- map["rejectdate"]
		newStarterDate 		<- map["newstarterdate"]
		formerStaffId 		<- map["formerstaffid"]
		modifiedAt 			<- map["m_date"]
		createdAt 			<- map["c_date"]
		active 				<- map["active"]
	}
}
