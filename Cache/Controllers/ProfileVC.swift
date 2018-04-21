//
//  ProfileVC.swift
//  Cache
//
//  Created by Jeffrey Santana on 4/20/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func signOutBtnPressed(_ sender: Any) {
		do {
			try Auth.auth().signOut()
		} catch let err as NSError {
			print("Error signing out: %@", err)
		}
	}

}
