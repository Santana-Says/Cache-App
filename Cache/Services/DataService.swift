//
//  ActivityDataSource.swift
//  Cache
//
//  Created by Jeffrey Santana on 2/24/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit
import FirebaseDatabase

let DB_BASE = Database.database().reference()

class DataService {
	static let instance = DataService()
	
	private let REF_BASE = DB_BASE
	private let REF_USERS = DB_BASE.child("users")
	private let REF_TRANSFERS = DB_BASE.child("transfers")
	
	func createDBUser(uid: String, userData: Dictionary<String, Any>) {
		REF_USERS.child(uid).updateChildValues(userData)
	}
	
	func getTagName(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
		REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
			guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
			for user in userSnapshot {
				if user.key == uid {
					handler(user.childSnapshot(forPath: "tagName").value as! String)
				}
			}
		}
	}
	
	func uploadTransfer(amountToSend amount: Int, withComment comment: String, fromUID sender: String, toUID receiver: String, timestamp: String, sendComplete: @escaping (_ status: Bool) -> ()) {
		REF_TRANSFERS.childByAutoId().updateChildValues(["senderId": sender, "receiverId": receiver, "amount": amount, "comment": comment])
		sendComplete(true)
	}
	
	func getAllUserTransfers(handler: @escaping (_ transfers: [TransferDetails]) -> ()) {
		var transferArray = [TransferDetails]()
		REF_TRANSFERS.observeSingleEvent(of: .value) { (feedTransferSnapshot) in
			guard let feedTransferSnapshot = feedTransferSnapshot.children.allObjects as? [DataSnapshot] else { return }
			for transfer in feedTransferSnapshot {
				let tagName = transfer.childSnapshot(forPath: "tagName").value as! String
				let amount = transfer.childSnapshot(forPath: "amount").value as! String
				let description = transfer.childSnapshot(forPath: "description").value as! String
				//let timestamp = transfer.childSnapshot(forPath: "amount").value as! String
				
				let transfer = TransferDetails(tagName: tagName, amount: amount, description: description)
				transferArray.append(transfer)
			}
			handler(transferArray)
		}
	}
	
	
}
