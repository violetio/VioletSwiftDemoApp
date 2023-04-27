//
//  GetOffer.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import VioletPublicClientAPI

class GetOfferByIDRequest: ChannelHeadersAPICall<Offer> {
    let offerId: Int64

    convenience init(appCreds: AppCreds, token: String, offerId: Int64) {
        self.init(channelHeaders: appCreds.channelHeaders(token: token), offerId: offerId)
    }

    init(channelHeaders: ChannelHeaders, offerId: Int64) {
        self.offerId = offerId
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        CatalogOffersAPI.catalogOffersOfferIdGet(xVioletToken: channelHeaders.token,
                                                 xVioletAppSecret: channelHeaders.apiSecret,
                                                 xVioletAppId: channelHeaders.appID,
                                                 offerId: offerId)
        { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
