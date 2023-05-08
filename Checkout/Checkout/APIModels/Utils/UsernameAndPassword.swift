//
//  UsernameAndPassword.swift
//  Checkout
//
//  Created by Alan Morford on 4/23/23.
//

import VioletPublicClientAPI

protocol UsernameAndPassword {
    var username: String { get }
    var password: String { get }
    func loginBody() -> LoginRequest
}

extension UsernameAndPassword {

    func loginBody() -> LoginRequest {
        return LoginRequest(username: self.username, password: self.password)
    }
}

 
