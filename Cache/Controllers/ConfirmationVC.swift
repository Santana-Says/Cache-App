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
	
	var passAmount: String!
	
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
