//
//  GetOffer.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import VioletPublicClientAPI

class GetPageOffersByMerchantIDRequest: DataResponseAPICall<PageOffer> {

    let appCreds: AppCreds
    let token: String
    let merchantId: Int64
    let page: Int
    let size: Int

    init(appCreds: AppCreds, token: String, merchantId: Int64, page: Int = 1, size: Int = 20) {
        self.appCreds = appCreds
        self.token = token
        self.merchantId = merchantId
        self.page = page
        self.size = size
    }

    func send() {
        CatalogOffersAPI.catalogOffersMerchantsMerchantIdGet(xVioletToken: token,
                                                             xVioletAppSecret: appCreds.apiSecret,
                                                             xVioletAppId: appCreds.appID,
                                                             merchantId: merchantId,
                                                             page: page,
                                                             size: size) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
