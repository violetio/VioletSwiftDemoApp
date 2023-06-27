//
//  CheckoutCartShippingAvailableGetRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/24/23.
//

import VioletPublicClientAPI

class CheckoutCartShippingAvailableGetRequest: ChannelHeadersAPICall<[OrderShippingMethodWrapper]> {
    let orderId: Int64

    convenience init(appCreds: AppCreds, token: String, cartId: Int64) {
        self.init(channelHeaders: appCreds.channelHeaders(token: token), orderId: cartId)
    }

    init(channelHeaders: ChannelHeaders, orderId: Int64) {
        self.orderId = orderId
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        CheckoutShippingAPI.checkoutCartCartIdShippingAvailableGet(cartId: orderId, xVioletToken: channelHeaders.token,
                                                                   xVioletAppSecret: channelHeaders.apiSecret,
                                                                   xVioletAppId: channelHeaders.appID)
        { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
