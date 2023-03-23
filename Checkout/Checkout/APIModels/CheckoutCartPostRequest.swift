//
//  CheckoutCartPostRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/23/23.
//

import VioletPublicClientAPI

class CheckoutCartPostRequest: DataResponseAPICall<Order> {

    let appCreds: AppCreds
    let token: String
    let cartInitializationRequest: CartInitializationRequest


    init(appCreds: AppCreds, token: String, cartInitializationRequest: CartInitializationRequest) {
        self.appCreds = appCreds
        self.token = token
        self.cartInitializationRequest = cartInitializationRequest
    }

    func send() {
        CheckoutCartAPI.checkoutCartPost(xVioletToken: token,
                                         xVioletAppSecret: appCreds.apiSecret,
                                         xVioletAppId: appCreds.appID,
                                         cartInitializationRequest: cartInitializationRequest) { [weak self] data, error in
            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
            
        }
    }
}

