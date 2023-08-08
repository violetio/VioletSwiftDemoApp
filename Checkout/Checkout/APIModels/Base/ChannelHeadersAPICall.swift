//
//  ChannelHeadersAPICall.swift
//  Checkout
//
//  Created by Alan Morford on 4/27/23.
//

import Violet
/**
    Extract a common generic type `DataResponseAPICall`
        to capture the 'dataResponse' from an API Call typed to the call being made.
    
    Added Type Contraint <DataResponseType: Codable> to better constraint this to ONLY types returning from an APICall. Now atleast cannot simply be anything,
 
 */
class ChannelHeadersAPICall<DataResponseType: Codable>: DataResponseAPICall<DataResponseType> {
    let channelHeaders: ChannelHeaders
    
    init(channelHeaders: ChannelHeaders) {
        self.channelHeaders = channelHeaders
    }
}


class ProxyAPICall<DataResponseType: Codable>: DataResponseAPICall<DataResponseType> {
    
    override init() {
    }
}
