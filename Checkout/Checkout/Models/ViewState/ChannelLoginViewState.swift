//
//  ChannelLoginViewState.swift
//  Checkout
//
//  Created on 4/5/23
//

import Foundation

class ChannelLoginViewState: ObservableObject {

    @Published var channelHeaders: ChannelHeaders?
    @Published var appIDandSecret: AppIDAndSecret?
    @Published var merchantID: Int64 = 10003

    init(channelHeaders: ChannelHeaders? = nil,
         appIDandSecret: AppIDAndSecret? = nil) {
        self.channelHeaders = channelHeaders
        self.appIDandSecret = appIDandSecret
    }
}
