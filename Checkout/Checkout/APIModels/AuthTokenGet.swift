//
//  AuthTokenGet.swift
//  Checkout
//
//  Created by Alan Morford on 3/15/23.
//

import VioletPublicClientAPI

class AuthTokenGet: DataResponseAPICall<RefreshTokenResponse> {

    let appCreds: AppCreds
    let refreshToken: String

    init(appCreds: AppCreds, refreshToken: String) {
        self.appCreds = appCreds
        self.refreshToken = refreshToken
    }

    override func send() {
        AccessAPI.authTokenGet(xVioletToken: refreshToken,
                               xVioletAppSecret: appCreds.apiSecret,
                               xVioletAppId: appCreds.appID) { [weak self] data, error in
            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}

