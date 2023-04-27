//
//  CheckoutCartPaymentPostRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/24/23.
//

import VioletPublicClientAPI

class CheckoutCartCustomerPostRequest: DataResponseAPICall<Order> {

    let appCreds: AppCreds
    let token: String
    let body: GuestOrderCustomer
    let cartId: Int64
    let priceCart: Bool


    init(appCreds: AppCreds, token: String, cartId: Int64, priceCart: Bool, guestOrderCustomer: GuestOrderCustomer) {
        self.appCreds = appCreds
        self.token = token
        self.cartId = cartId
        self.body = guestOrderCustomer
        self.priceCart = priceCart
    }

    override func send() {
        CheckoutCustomerAPI.checkoutCartCartIdCustomerPost(xVioletToken: token,
                                         xVioletAppSecret: appCreds.apiSecret,
                                         xVioletAppId: appCreds.appID,
                                         cartId: cartId, priceCart: priceCart, body: body) { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)

        }
    }
}
