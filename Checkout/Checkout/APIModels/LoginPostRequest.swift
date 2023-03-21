//
//  LoginPostRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/14/23.
//

import SwiftUI
import VioletPublicClientAPI

class LoginPostRequest: BaseAPICall {

    let appCreds: AppCreds

    var dataResponse: LoginResponse? = nil
    var errorResponse: Error? = nil
    
    init(appCreds: AppCreds) {
        self.appCreds = appCreds
    }

    func send() {
        AccessAPI.loginPost(xVioletAppSecret: appCreds.apiSecret,
                            xVioletAppId: appCreds.appID,
                            body: appCreds.loginBody()) { [weak self] (response, error) in
            guard let weakSelf = self else { return }
            weakSelf.dataResponse = response
            weakSelf.errorResponse = error
            weakSelf.callIsCompleted()
        }
    }
}
