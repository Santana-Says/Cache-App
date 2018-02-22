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
	@IBOutlet weak var tableView: UITableView!
	
	let SECTION_HEADER_HEIGHT: CGFloat = 25
	var data = [TableSection: [[String: String]]]()
	
	var passAmount: String!
	//var confirmationType
	
	//MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        cashAmountLbl.text = "$\(passAmount!)"
    }
	
	//MARK: - IBActions
	
	@IBAction func cancelBtnPressed(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func processBtnPressed(_ sender: Any) {
	}
}

extension ConfirmationVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let tableSection = TableSection(rawValue: section), let contactData = data[tableSection] {
			return contactData.count
		}
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
	}
}
