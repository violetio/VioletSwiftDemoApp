//
//  GetCartByIDRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import VioletPublicClientAPI

class GetCartByIDRequest: DataResponseAPICall<Order> {

    let appCreds: AppCreds
    let token: String
    let orderId: Int64

    init(appCreds: AppCreds, token: String, orderId: Int64) {
        self.appCreds = appCreds
        self.token = token
        self.orderId = orderId
    }

    func send() {
        CheckoutCartAPI.checkoutCartCartIdGet(xVioletToken: token,
                                                 xVioletAppSecret: appCreds.apiSecret,
                                                 xVioletAppId: appCreds.appID,
                                                 cartId: orderId) { data, error in
            if let printData = data {
//                Logger.info(printData.description ?? "")
            } else if let printError = error {
                Logger.error(printError.localizedDescription)
            }
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
