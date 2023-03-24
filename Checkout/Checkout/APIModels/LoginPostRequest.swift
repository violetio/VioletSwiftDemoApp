//
//  LoginPostRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/14/23.
//

import SwiftUI
import VioletPublicClientAPI

class LoginPostRequest: DataResponseAPICall<LoginResponse> {

    let appCreds: AppCreds
    
    init(appCreds: AppCreds) {
        self.appCreds = appCreds
    }

    func send() {
        AccessAPI.loginPost(xVioletAppSecret: appCreds.apiSecret,
                            xVioletAppId: appCreds.appID,
                            body: appCreds.loginBody()) { [weak self] (response, error) in
            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: response)
        }
    }
}
