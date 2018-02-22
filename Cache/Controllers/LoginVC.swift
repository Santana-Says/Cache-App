//
//  LoginVC.swift
//  Cache
//
//  Created by Jeffrey Santana on 2/18/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit
import PhoneNumberKit

class LoginVC: UIViewController {
	
	//MARK: - IBOutlets

	@IBOutlet weak var phoneTextField: PhoneNumberTextField!
	
	private let MAX_DIGITS = 10
	private var phoneString = ""
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func numberBtnPresed(_ sender: UIButton) {
		if phoneString.count <= MAX_DIGITS {
			phoneString.append(String(sender.tag))
			phoneTextField.text = PartialFormatter().formatPartial(phoneString)
		}
	}
	
	@IBAction func emailBtnPressed(_ sender: Any) {
		//bring up next button along with keyboard, hiding the numberpad
	}
	
	@IBAction func backspaceBtnPressed(_ sender: Any) {
		if !phoneString.isEmpty {
			phoneString = String(phoneString.dropLast())
			phoneTextField.text = PartialFormatter().formatPartial(phoneString)
		}
	}
	
	@IBAction func nextBtnPressed(_ sender: Any) {
		if phoneString.count == MAX_DIGITS {
			let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainVC
			navigationController?.pushViewController(mainVC, animated: true)
		}
	}
}
