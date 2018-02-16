//
//  ViewController.swift
//  Cache
//
//  Created by Jeffrey Santana on 2/10/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
	
	//MARK: - IBOutlets
	@IBOutlet weak var dollarLbl: UILabel!
	@IBOutlet weak var cashLbl: UILabel!
	
	//MARK: - Properties
	let DECIMAL_TAG = 10
	let DELETE_TAG = 11
	let MAX_INPUT = 5
	let MAX_AMOUNT = 20000
	let MAX_COUNT = 8
	
	var amountString: String!
	var amount: NSNumber = 0

	//MARK: - View Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		amountString = ""
	}
	
	//MARK: - Helper Methods
	func showAmount(tag: String) -> String {
		amount = NSNumber(value: Float(amountString)!)
		
		let currencyFormatter = NumberFormatter()
		currencyFormatter.groupingSeparator = ","
		currencyFormatter.numberStyle = .decimal
		
		if Int(amount) < MAX_AMOUNT && amountString.count <= MAX_COUNT {
			return currencyFormatter.string(from: amount)!
		} else {
			amountString.removeLast(1)
			amount = NSNumber(value: Float(amountString)!)
			return currencyFormatter.string(from: amount)!
		}
	}
	
	//MARK: - IBActions
	@IBAction func profileBtnPressed(_ sender: Any) {
	}
	
	@IBAction func historyBtnPressed(_ sender: Any) {
	}
	
	@IBAction func cashInputBtnPressed(_ sender: UIButton) {
		if sender.tag < DECIMAL_TAG {
			amountString.append("\(sender.tag)")
		} else if sender.tag == DECIMAL_TAG {
			amountString.append(".")
		} else {
			amountString.removeLast(1)
			guard !amountString.isEmpty else {
				cashLbl.text = "0"
				return
			}
		}
		cashLbl.text = showAmount(tag: amountString)
	}
	
	@IBAction func processBtnPressed(_ sender: Any) {
		//link to 
	}
	
}

