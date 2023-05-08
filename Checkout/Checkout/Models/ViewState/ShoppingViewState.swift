//
//  ShoppingViewState.swift
//  Checkout
//
//  Created on 5/6/23
//

import Foundation
import VioletPublicClientAPI

class ShoppingViewState: ObservableObject {

    @Published var offerPath: [Offer]


    init(offerPath: [Offer]) {
        self.offerPath = offerPath
    }

    convenience init() {
        self.init(offerPath: [])
    }

    func mergePageOffer(_ pageOffer: PageOffer) {

        guard let content = pageOffer.content else {
            return
        }
        Logger.info("PageOffer with count: \(content.count)")
//        content.map { offer in
//            //offer.
//
//        }
    }

}
