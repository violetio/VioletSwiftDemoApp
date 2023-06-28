//
//  ChannelTokenAndSecret.swift
//  Checkout
//
//  Created by Alan Morford on 4/26/23.
//

struct ChannelHeaders: AppIDAndSecret {
    let apiSecret: String
    let appID: Int64
    let token: String
    let refreshToken: String
    var authToken: String { self.token }

    static var unknownRefreshToken: String { "" }

    init(token: String, refreshToken: String, apiSecret: String, appID: Int64) {
        self.token = token
        self.refreshToken = refreshToken
        self.apiSecret = apiSecret
        self.appID = appID
    }

    init(token: String, refreshToken: String, appIdAndSecret: AppIDAndSecret) {
        self.init(token: token, refreshToken: refreshToken, apiSecret: appIdAndSecret.apiSecret, appID: appIdAndSecret.appID)
    }

    init(authAndRefreshToken: AuthAndRefreshToken, appIdAndSecret: AppIDAndSecret) {
        self.init(token: authAndRefreshToken.token, refreshToken: authAndRefreshToken.refreshToken, apiSecret: appIdAndSecret.apiSecret, appID: appIdAndSecret.appID)
    }

    func replaceToken(token: String) -> ChannelHeaders {
        return ChannelHeaders(token: token, refreshToken: self.refreshToken, apiSecret: self.apiSecret, appID: self.appID)
    }
}
