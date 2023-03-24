//
//  GetOffer.swift
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
        //CheckoutCartAPI.checkoutCartCartIdGet(xVioletToken: <#T##String#>, xVioletAppSecret: <#T##String#>, xVioletAppId: <#T##Int64#>, cartId: <#T##Int64#>, completion: <#T##((Order?, Error?) -> Void)##((Order?, Error?) -> Void)##(_ data: Order?, _ error: Error?) -> Void#>)
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
