//
//  ComfirmationVC.swift
//  Cache
//
//  Created by Jeffrey Santana on 2/16/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class ConfirmationVC: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var cashAmountLbl: UILabel!
	@IBOutlet weak var toLbl: UITextField!
	@IBOutlet weak var forLabel: UITextField!
	
	let SECTION_HEADER_HEIGHT: CGFloat = 25
	var data = [TableSection: [[String: String]]]()
	
	var passAmount = "0.00"
	//var confirmationType
	
	//MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

		cashAmountLbl.text = "$\(passAmount)"
    }
	
	//MARK: - IBActions
	
	@IBAction func cancelBtnPressed(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func payBtnPressed(_ sender: Any) {
		guard let sendTo = toLbl.text else {return}
		let comment = forLabel.text ?? ""
		let fromUser = AuthService.instance.getCurrentUser().uid
		let timestamp = getTimestamp()
		
//		DataService.instance.uploadTransfer(amountToSend: passAmount, withComment: comment, fromUID: fromUser, toUID: <#T##String#>, timestamp: timestamp) { (complete) in
//			
//		}
	}
	
	//MARK: - Helper Methods
	
	func getTimestamp() -> String {
		let now = Date()
		let formatter = DateFormatter()
		
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "yyyy-MM-dd HH:mm"
		
		return formatter.string(from: now)
	}
	
}
