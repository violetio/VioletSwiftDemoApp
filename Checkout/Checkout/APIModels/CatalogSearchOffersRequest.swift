//
//  SearchOffersRequest.swift
//

import Violet

class CatalogSearchOffersRequest {
    let page: Int
    let size: Int
    var pageOfferResponse: PageOffer? = nil

    init(page: Int = 1, size: Int = 20) {
        self.page = page
        self.size = size
    }

    func send() {
        CatalogOffersAPI.searchOffers(body: OfferSearchRequest(merchantId: 10000)) { [weak self] data, error in
            guard let self = self else { return }
            
            if let anError = error {
                print("\(anError.localizedDescription)")
            } else if let aPageOffer = data {
                self.pageOfferResponse = aPageOffer
            }
        }
    }
}
