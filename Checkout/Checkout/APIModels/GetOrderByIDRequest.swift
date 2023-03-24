//
//  GetOffer.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import VioletPublicClientAPI

class GetOrderByIDRequest: DataResponseAPICall<Order> {

    let appCreds: AppCreds
    let token: String
    let orderId: Int64

    init(appCreds: AppCreds, token: String, orderId: Int64) {
        self.appCreds = appCreds
        self.token = token
        self.orderId = orderId
    }

    func send() {
        OrdersAPI.ordersOrderIdGet(xVioletToken: token,
                                                 xVioletAppSecret: appCreds.apiSecret,
                                                 xVioletAppId: appCreds.appID,
                                                 orderId: orderId) { data, error in
            if let printData = data {
                Logger.info(printData.token ?? "")
            } else if let printError = error {
                Logger.error(printError.localizedDescription)
            }
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
