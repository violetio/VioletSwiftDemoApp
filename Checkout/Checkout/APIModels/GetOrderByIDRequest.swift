//
//  GetOrderByIDRequest.swift
//  Checkout
//
//  Created on 3/9/23.
//

import Foundation
import Violet

class GetOrderByIDRequest: ProxyAPICall<Order> {
    let orderId: Int64


    init(orderId: Int64) {
        self.orderId = orderId
        super.init()
    }

    override func send() {
        /*
        OrdersAPI.ordersOrderIdGet(orderId: orderId, xVioletToken: channelHeaders.token,
                                   xVioletAppSecret: channelHeaders.apiSecret,
                                   xVioletAppId: channelHeaders.appID)
        { data, error in
            if let printData = data {
                Logger.info(printData.token ?? "")
            } else if let printError = error {
                Logger.error(printError.localizedDescription)
            }
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
         */
    }
}
