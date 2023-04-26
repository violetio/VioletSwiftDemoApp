//
//  ChannelTokenAndSecret.swift
//  Checkout
//
//  Created by Alan Morford on 4/26/23.
//

struct ChannelHeaders: AppIDAndSecret {
    let token: String
    let apiSecret: String
    let appID: Int64
    
    init(token: String, apiSecret: String, appID: Int64) {
        self.token = token
        self.apiSecret = apiSecret
        self.appID = appID
    }
    
    init(token: String, appIdAndSecret: AppIDAndSecret) {
        self.init(token: token, apiSecret: appIdAndSecret.apiSecret, appID: appIdAndSecret.appID)
    }
}
