//
//  LoginVC.swift
//  Cache
//
//  Created by Jeffrey Santana on 2/18/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit
import PhoneNumberKit
import FirebaseAuth

class LoginVC: UIViewController {
	
	//MARK: - IBOutlets

	@IBOutlet weak var welcomeLbl: UILabel!
	@IBOutlet weak var introLbl: UILabel!
	@IBOutlet weak var phoneTextField: PhoneNumberTextField!
	
	private var phoneNumberKit = PhoneNumberKit()
	private var textFieldString = ""
	private var isVerifying = false
	private var verificationID = ""
	private var verificationCode = ""
	private let MAX_DIGITS = 10
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	//MARK: - IBActions

	@IBAction func numberBtnPresed(_ sender: UIButton) {
		if !isVerifying && textFieldString.count < MAX_DIGITS {
			textFieldString.append(String(sender.tag))
			phoneTextField.text = PartialFormatter().formatPartial(textFieldString)
		} else {
			verificationCode.append(String(sender.tag))
			phoneTextField.text = verificationCode
		}
	}
	
	@IBAction func emailBtnPressed(_ sender: Any) {
		//bring up next button along with keyboard, hiding the numberpad
	}
	
	@IBAction func backspaceBtnPressed(_ sender: Any) {
		if !textFieldString.isEmpty {
			textFieldString = String(textFieldString.dropLast())
			phoneTextField.text = PartialFormatter().formatPartial(textFieldString)
		}
	}
	
	@IBAction func nextBtnPressed(_ sender: Any) {
		if isVerifying {
			loginCredentials()
		} else if textFieldString.count == MAX_DIGITS {
			phoneTextField.text =  "+1 " + phoneTextField.text!
			sendConfimationCode(phoneNumber: phoneTextField.text!)
		}
	}
	
	//MARK: - Helper Methods
	
	func showVerification() {
		isVerifying = true
		welcomeLbl.isHidden = true
		introLbl.text = "Please enter the code sent to \(phoneTextField.text!)"
		phoneTextField.text?.removeAll()
		phoneTextField.placeholder = "Confirmation Code"
	}
	
	func sendConfimationCode(phoneNumber: String) {
		PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
			if let error = error {
				print("Didnt send confirmation: \(phoneNumber) " + error.localizedDescription)
				return
			}
			self.verificationID = verificationID!
			UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
			self.showVerification()
		}
	}
	
	func loginCredentials() {
		let credential = PhoneAuthProvider.provider().credential(
			withVerificationID: verificationID,
			verificationCode: verificationCode)
		
		Auth.auth().signIn(with: credential) { (user, error) in
			if let error = error {
				print("Login fail: " + error.localizedDescription)
				return
			}
			
			let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainVC
			self.navigationController?.pushViewController(mainVC, animated: true)
		}
	}
}
