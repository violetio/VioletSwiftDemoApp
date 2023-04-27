//
//  GetOffer.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import VioletPublicClientAPI

class GetPageOffersByMerchantIDRequest: ChannelHeadersAPICall<PageOffer> {

    let merchantId: Int64
    let page: Int
    let size: Int
    
    init(channelHeaders: ChannelHeaders, merchantId: Int64, page: Int = 1, size: Int = 20) {
        self.merchantId = merchantId
        self.page = page
        self.size = size
        super.init(channelHeaders: channelHeaders)
    }

    func send() {
        CatalogOffersAPI.catalogOffersMerchantsMerchantIdGet(xVioletToken: channelHeaders.token,
                                                             xVioletAppSecret: channelHeaders.apiSecret,
                                                             xVioletAppId: channelHeaders.appID,
                                                             merchantId: merchantId,
                                                             page: page,
                                                             size: size) { [weak self] data, error in
            guard let self = self else {return}
            self.logError(error)
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
    
}
