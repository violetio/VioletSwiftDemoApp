//
//  GetCartByIDRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import Violet

class GetCartByIDRequest: ChannelHeadersAPICall<Order> {
    let orderId: Int64

    convenience init(appCreds: AppCreds, token: String, orderId: Int64) {
        self.init(channelHeaders: appCreds.channelHeaders(token: token), orderId: orderId)
    }

    init(channelHeaders: ChannelHeaders, orderId: Int64) {
        self.orderId = orderId
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        /*
        CheckoutCartAPI.checkoutCartCartIdGet(cartId: orderId, xVioletToken: channelHeaders.token,
                                              xVioletAppSecret: channelHeaders.apiSecret,
                                              xVioletAppId: channelHeaders.appID)
        { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
         */
    }
}
