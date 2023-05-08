//
//  LoginInputs.swift
//  Checkout
//
//  Created on 5/5/23
//

import Foundation
import VioletPublicClientAPI

typealias LoginInputsType = AppIDAndSecret & UsernameAndPassword

struct LoginInputs: AppIDAndSecret, UsernameAndPassword {
    let apiSecret: String
    let appID: Int64
    let username: String
    let password: String

    init(apiSecret: String, appID: Int64, username: String, password: String) {
        self.apiSecret = apiSecret
        self.appID = appID
        self.username = username
        self.password = password
    }

}
