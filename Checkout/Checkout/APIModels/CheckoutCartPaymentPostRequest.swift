//
//  CheckoutCartPaymentPostRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/24/23.
//

import VioletPublicClientAPI

class CheckoutCartPaymentPostRequest: ChannelHeadersAPICall<Order> {
    let body: PaymentMethodRequest
    let cartId: Int64
    let priceCart: Bool

    convenience init(appCreds: AppCreds, token: String, cartId: Int64, priceCart: Bool, paymentMethodRequest: PaymentMethodRequest) {
        self.init(channelHeaders: appCreds.channelHeaders(token: token), cartId: cartId, priceCart: priceCart, paymentMethodRequest: paymentMethodRequest)
    }

    init(channelHeaders: ChannelHeaders, cartId: Int64, priceCart: Bool, paymentMethodRequest: PaymentMethodRequest) {
        self.cartId = cartId
        self.body = paymentMethodRequest
        self.priceCart = priceCart
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        CheckoutPaymentAPI.checkoutCartCartIdPaymentPost(cartId: cartId, xVioletToken: channelHeaders.token,
                                                         xVioletAppSecret: channelHeaders.apiSecret,
                                                         xVioletAppId: channelHeaders.appID, priceCart: priceCart, body: body)
        { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
