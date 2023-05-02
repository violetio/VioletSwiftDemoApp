//
//  AuthTokenGet.swift
//  Checkout
//
//  Created by Alan Morford on 3/15/23.
//

import VioletPublicClientAPI

class AuthTokenGet: DataResponseAPICall<RefreshTokenResponse> {
    let appIDAndSecret: AppIDAndSecret
    let refreshToken: String

    init(appIDAndSecret: AppIDAndSecret, refreshToken: String) {
        self.appIDAndSecret = appIDAndSecret
        self.refreshToken = refreshToken
    }

    override func send() {
        AccessAPI.authTokenGet(xVioletToken: refreshToken,
                               xVioletAppSecret: appIDAndSecret.apiSecret,
                               xVioletAppId: appIDAndSecret.appID)
        { [weak self] data, error in
            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
