//
//  ChannelHeader+Extensions.swift
//  Checkout
//
//  Created on 5/5/23
//

import Violet

extension ChannelHeaders {

    static func from(loginResponse: LoginResponse?, appIdAndSecret: AppIDAndSecret) -> ChannelHeaders? {
        guard let validLogin = loginResponse, let token = validLogin.token, let refreshToken = validLogin.refreshToken else { return nil }

        return ChannelHeaders(token: token,
                              refreshToken: refreshToken, appIdAndSecret: appIdAndSecret)
    }
}
