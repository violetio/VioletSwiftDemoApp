//
//  GetOffer.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import VioletPublicClientAPI

class GetOrderByIDRequest: ChannelHeadersAPICall<Order> {
    let orderId: Int64

    convenience init(appCreds: AppCreds, token: String, orderId: Int64) {
        self.init(channelHeaders: appCreds.channelHeaders(token: token), orderId: orderId)
    }

    init(channelHeaders: ChannelHeaders, orderId: Int64) {
        self.orderId = orderId
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        OrdersAPI.ordersOrderIdGet(orderId: orderId, xVioletToken: channelHeaders.token,
                                   xVioletAppSecret: channelHeaders.apiSecret,
                                   xVioletAppId: channelHeaders.appID)
        { data, error in
            if let printData = data {
                Logger.info(printData.token ?? "")
            } else if let printError = error {
                Logger.error(printError.localizedDescription)
            }
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
