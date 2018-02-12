//
//  ActivityTableCell.swift
//  Cache
//
//  Created by Jeffrey Santana on 2/11/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class ActivityTableCell: UITableViewCell {

	@IBOutlet weak var contactImg: DesignableIamgeView!
	@IBOutlet weak var nameLbl: UILabel!
	@IBOutlet weak var descriptionLbl: UILabel!
	@IBOutlet weak var amountLbl: UILabel!
	
	func configCell(image: UIImage, name: String, description: String, amount: Int) {
		contactImg.image = image
		nameLbl.text = name
		descriptionLbl.text = description
		if amount >= 0 {
			amountLbl.text = "$\(amount)"
		} else {
			amountLbl.text = "- $\(abs(amount))"
		}
	}

}
