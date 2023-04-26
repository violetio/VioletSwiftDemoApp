//
//  GetOffer.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import VioletPublicClientAPI

class GetPageOffersByMerchantIDRequest: DataResponseAPICall<PageOffer> {

    let merchantId: Int64
    let page: Int
    let size: Int
    let channelHeaders: ChannelHeaders
    
    init(channelHeaders: ChannelHeaders, merchantId: Int64, page: Int = 1, size: Int = 20) {
        self.merchantId = merchantId
        self.page = page
        self.size = size
        self.channelHeaders = channelHeaders
    }

    func send() {
        CatalogOffersAPI.catalogOffersMerchantsMerchantIdGet(xVioletToken: channelHeaders.token,
                                                             xVioletAppSecret: channelHeaders.apiSecret,
                                                             xVioletAppId: channelHeaders.appID,
                                                             merchantId: merchantId,
                                                             page: page,
                                                             size: size) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
