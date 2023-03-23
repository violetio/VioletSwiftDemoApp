//
//  GetOffer.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import VioletPublicClientAPI


import SwiftUI
import VioletPublicClientAPI

class GetOfferByIDRequest: DataResponseAPICall<Offer> {

    let appCreds: AppCreds
    let token: String
    let offerId: Int64

//    @Published var dataResponse: Offer? = nil

    init(appCreds: AppCreds, token: String, offerId: Int64) {
        self.appCreds = appCreds
        self.token = token
        self.offerId = offerId
    }

    func send() {
        CatalogOffersAPI.catalogOffersOfferIdGet(xVioletToken: token,
                                                 xVioletAppSecret: appCreds.apiSecret,
                                                 xVioletAppId: appCreds.appID,
                                                 offerId: offerId) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
