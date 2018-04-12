//
//  AuthService.swift
//  Cache
//
//  Created by Jeffrey Santana on 3/14/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
	static let instance = AuthService()
	
	func registerUser(withEmail email: String?, withPhone phone: String?, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
		
	}
	
	func getCurrentUser() -> User {
		return Auth.auth().currentUser!
	}
}
