//
//  AuthTokenGet.swift
//  Checkout
//
//  Created by Alan Morford on 3/15/23.
//

import SwiftUI
import VioletPublicClientAPI

class AuthTokenGet: DataResponseAPICall<RefreshTokenResponse> {

    let appCreds: AppCreds
    let refreshToken: String

    init(appCreds: AppCreds, refreshToken: String) {
        self.appCreds = appCreds
        self.refreshToken = refreshToken
    }

    func send() {
        AccessAPI.authTokenGet(xVioletToken: refreshToken,
                               xVioletAppSecret: appCreds.apiSecret,
                               xVioletAppId: appCreds.appID) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}

