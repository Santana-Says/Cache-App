//
//  ComfirmationVC.swift
//  Cache
//
//  Created by Jeffrey Santana on 2/16/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class ComfirmationVC: UIViewController {
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var cashAmountLbl: UILabel!
	@IBOutlet weak var toLbl: UITextField!
	@IBOutlet weak var forLabel: UITextField!
	
	//MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	//MARK: - IBActions
	
	@IBAction func cancelBtnPressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func processBtnPressed(_ sender: Any) {
	}
}
