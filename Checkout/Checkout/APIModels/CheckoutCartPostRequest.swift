//
//  CheckoutCartPostRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/23/23.
//

import Violet

class CheckoutCartPostRequest: ChannelHeadersAPICall<Order> {
    let cartInitializationRequest: CartInitializationRequest
    let baseCurrency: String

    convenience init(appCreds: AppCreds, token: String, cartInitializationRequest: CartInitializationRequest) {
        self.init(channelHeaders: appCreds.channelHeaders(token: token), cartInitializationRequest: cartInitializationRequest)
    }

    init(channelHeaders: ChannelHeaders, cartInitializationRequest: CartInitializationRequest, baseCurrency: String = "USD") {
        self.cartInitializationRequest = cartInitializationRequest
        self.baseCurrency = baseCurrency
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        /*
        CheckoutCartAPI.checkoutCartPost(xVioletToken: channelHeaders.token,
                                         xVioletAppSecret: channelHeaders.apiSecret,
                                         xVioletAppId: channelHeaders.appID,
                                         baseCurrency: baseCurrency,

                                         cartInitializationRequest: cartInitializationRequest)
        { [weak self] data, error in
            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
         */
    }
}
