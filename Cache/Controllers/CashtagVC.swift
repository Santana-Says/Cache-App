//
//  CashtagVC.swift
//  Cache
//
//  Created by Jeffrey Santana on 3/14/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class CashtagVC: UIViewController {

	@IBOutlet weak var cashtagTextField: UITextField!
	@IBOutlet weak var bottomView: UIView!
	@IBOutlet weak var setBtn: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		cashtagTextField.delegate = self

        bottomView.bindToKeyboard()
    }

	@IBAction func cancelBtn(_ sender: Any) {
	}
	
	@IBAction func setBtn(_ sender: Any) {
	}
	
	func SearchCacheTags(cachetag tag: String) -> Bool {
		return true
	}
}

extension CashtagVC: UITextFieldDelegate {
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		return true
	}
	
}
