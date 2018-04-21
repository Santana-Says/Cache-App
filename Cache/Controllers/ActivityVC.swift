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
	
	var myTransfers = [TransferDetails]()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		load()
		
		tableView.delegate = self
		tableView.dataSource = self
		collectionView.delegate = self
		collectionView.dataSource = self
    }
	
	//TODO: - add data to proper models
	func load() {
//		DataService.instance.getAllUserTransfers(for: AuthService.instance.getCurrentUser().uid) { (transfers) in
//			self.myTransfers = transfers
//		}
//
//		DataService.instance.getAllUserTransfers(for: nil) { (contacts) in
//			self.myRecentContacts = contacts
//		}
		DataCloudService.instance.getTransfers { (transfers) in
			if transfers.count > 0 {
				self.myTransfers = transfers
				self.tableView.reloadData()
				self.collectionView.reloadData()
			} else {
				print("STILL NO TRANSFERS")
			}
		}
	}
}

extension ActivityVC: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return myTransfers.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableCell") as? ActivityTableCell else { return UITableViewCell() }
		cell.configCell(
			image: UIImage.init(named: "logo")!,
			name: myTransfers[indexPath.row].senderId,
			description: myTransfers[indexPath.row].description,
			amount: myTransfers[indexPath.row].amount)
		
		return cell
	}
}

extension ActivityVC: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return myTransfers.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCollectionCell", for: indexPath) as? ActivityCollectionCell else { return UICollectionViewCell() }
		cell.configCell(image: UIImage.init(named: "logo")!, name: myTransfers[indexPath.row].senderId)
		
		return cell
	}
}
