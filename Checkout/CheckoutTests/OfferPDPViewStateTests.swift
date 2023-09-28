//
//  OfferPDPViewStateTests.swift
//  CheckoutTests
//
//  Created on 8/30/23
//

import XCTest
@testable import Checkout
import Violet

final class OfferPDPViewStateTests: XCTestCase {

    func test_offer_Id_15475() throws {
        let offer_Id_15475 = MockOffers.load_PageOffers_NoMerchantID(offerId: 15475)!
        let sut = OfferPDPViewState(offer: offer_Id_15475)
        sut.selected(variantName: "Title", valueName: "Default Title")
        XCTAssertEqual(sut.selectedSkuID, 39275)
        
    }

}
