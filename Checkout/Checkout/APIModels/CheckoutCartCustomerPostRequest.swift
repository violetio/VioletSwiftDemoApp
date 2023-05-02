//
//  CheckoutCartPaymentPostRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/24/23.
//

import VioletPublicClientAPI

class CheckoutCartCustomerPostRequest: ChannelHeadersAPICall<Order> {

    let body: GuestOrderCustomer
    let cartId: Int64
    let priceCart: Bool

    convenience init(appCreds: AppCreds, token: String, cartId: Int64, priceCart: Bool, guestOrderCustomer: GuestOrderCustomer) {
        self.init(channelHeaders: appCreds.channelHeaders(token: token),
                  cartId: cartId,
                  priceCart: priceCart,
                  guestOrderCustomer: guestOrderCustomer)

    }
    
    init(channelHeaders: ChannelHeaders, cartId: Int64, priceCart: Bool, guestOrderCustomer: GuestOrderCustomer) {
        self.cartId = cartId
        self.body = guestOrderCustomer
        self.priceCart = priceCart
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        CheckoutCustomerAPI.checkoutCartCartIdCustomerPost(xVioletToken: channelHeaders.token,
                                                           xVioletAppSecret: channelHeaders.apiSecret,
                                                           xVioletAppId: channelHeaders.appID,
                                                           cartId: cartId,
                                                           priceCart: priceCart,
                                                           body: body) { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)

        }
    }
}
