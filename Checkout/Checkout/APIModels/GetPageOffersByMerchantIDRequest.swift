//
//  GetOffer.swift
//  Checkout
//
//  Created on 3/9/23.
//

import Foundation
import Violet

class GetPageOffersByMerchantIDRequest: ProxyAPICall<PageOffer> {
    let merchantId: Int?
    let page: Int
    let size: Int

    init(merchantId: Int64? = nil, page: Int = 1, size: Int = 20) {
        if let aMerchantId = merchantId {
            self.merchantId = Int(aMerchantId)
        } else {
            self.merchantId = nil
        }
        self.page = page
        self.size = size
        super.init()
    }

    override func send() {
        CatalogOffersAPI.searchOffers(page: page, size: size, body: OfferSearchRequest(merchantId: self.merchantId)) { [weak self] data, error in
            guard let self = self else { return }
            self.logError(error)
            if let anError = error {
                print("\(anError.localizedDescription)")
            }
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
