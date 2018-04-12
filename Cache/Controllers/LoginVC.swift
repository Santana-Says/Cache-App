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
	@IBOutlet weak var nextBtn: UIButton!
	@IBOutlet weak var numberStackView: UIStackView!
	
	private var phoneNumberKit = PhoneNumberKit()
	private var textFieldString = ""
	private var isVerifying = false
	private var verificationID = ""
	private var verificationCode = ""
	private let MAX_DIGITS = 10
	
	override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.bindToKeyboard()
		hideKeyboardWhenTappedAround()
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
		phoneTextField.isEnabled = true
		numberStackView.isHidden = true
		phoneTextField.becomeFirstResponder()
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
			
			guard let user = user else {return}
			
			let userData = ["name": user.displayName, "email": user.email, "phone": user.phoneNumber]
			DataService.instance.createDBUser(uid: user.uid, userData: userData)
			
			let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainVC
			self.navigationController?.pushViewController(mainVC, animated: true)
		}
	}
	
	func hideKeyboardWhenTappedAround() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
		numberStackView.isHidden = false
	}
}
