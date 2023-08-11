//
//  GetOffer.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import Violet

class GetPageOffersByMerchantIDRequest: ProxyAPICall<PageOffer> {
    let merchantId: Int64
    let page: Int
    let size: Int

    init(merchantId: Int64, page: Int = 1, size: Int = 50) {
        self.merchantId = merchantId
        self.page = page
        self.size = size
        super.init()
    }

    override func send() {
        CatalogOffersAPI.searchOffers(page: page, size: size, body: OfferSearchRequest(merchantId: Int(merchantId))) { [weak self] data, error in
            guard let self = self else { return }
            self.logError(error)
            if let anError = error {
                print("\(anError.localizedDescription)")
            }
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
