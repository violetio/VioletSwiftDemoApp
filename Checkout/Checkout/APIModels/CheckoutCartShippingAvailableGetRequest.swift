//
//  CheckoutCartShippingAvailableGetRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/24/23.
//

import VioletPublicClientAPI

class CheckoutCartShippingAvailableGetRequest: DataResponseAPICall<[OrderShippingMethodWrapper]> {

    let appCreds: AppCreds
    let token: String
    let cartId: Int64


    init(appCreds: AppCreds, token: String, cartId: Int64) {
        self.appCreds = appCreds
        self.token = token
        self.cartId = cartId
    }

    func send() {
        CheckoutShippingAPI.checkoutCartCartIdShippingAvailableGet(xVioletToken: token,
                                         xVioletAppSecret: appCreds.apiSecret,
                                         xVioletAppId: appCreds.appID,
                                         cartId: cartId) { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)

        }
    }
}
