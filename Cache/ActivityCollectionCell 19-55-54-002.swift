//
//  ActivityCollectionCell.swift
//  Cache
//
//  Created by Jeffrey Santana on 2/11/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class ActivityCollectionCell: UICollectionViewCell {
    
	@IBOutlet weak var contactImg: DesignableIamgeView!
	@IBOutlet weak var nameLbl: UILabel!
	
	func configCell(image: UIImage, name: String) {
		contactImg.image = image
		nameLbl.text = name
	}
}
