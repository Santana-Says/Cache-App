//
//  TransferDetails.swift
//  Cache
//
//  Created by Jeffrey Santana on 3/14/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import Foundation

struct TransferDetails: Codable {
	private(set) var amount: 		Double
	private(set) var description: 	String
	private(set) var senderId: 		String
	private(set) var receiverId:	String
	private(set) var timestamp:		String
}
