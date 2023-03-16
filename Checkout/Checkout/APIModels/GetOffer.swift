//
//  GetOffer.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import VioletPublicClientAPI


import SwiftUI
import VioletPublicClientAPI

class GetOffers: BaseAPICall {

    let appCreds: AppCreds
    let refreshToken: String

    @Published var dataResponse: RefreshTokenResponse? = nil
    @Published var errorResponse: ErrorResponse? = nil

    init(appCreds: AppCreds, refreshToken: String) {
        self.appCreds = appCreds
        self.refreshToken = refreshToken
    }

    func send() {
        AccessAPI.authTokenGet(xVioletToken: refreshToken,
                               xVioletAppSecret: appCreds.apiSecret,
                               xVioletAppId: appCreds.appID) { data, error in
            self.dataResponse = data
            self.errorResponse = error
            self.callIsCompleted()
        }
    }
}
