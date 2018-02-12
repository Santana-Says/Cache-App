//
//  ActivityVC.swift
//  Cache
//
//  Created by Jeffrey Santana on 2/11/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class ActivityVC: UIViewController {

	//MARK: - IBOutlets
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		collectionView.delegate = self
		collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ActivityVC: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableCell") as? ActivityTableCell else { return UITableViewCell() }
		cell.configCell(image: UIImage.init(named: "logo")!, name: "Dev", description: "NippleandToes23 came to dinner", amount: 47)
		
		return cell
	}
}

extension ActivityVC: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 7
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCollectionCell", for: indexPath) as? ActivityCollectionCell else { return UICollectionViewCell() }
		cell.configCell(image: UIImage.init(named: "logo")!, name: "Dev")
		
		return cell
	}
}
