//
//  OfferSkusVariantsTests.swift
//  CheckoutTests
//
//  Created on 8/20/23
//

import XCTest
@testable import Checkout

final class OfferSkusVariantsTests: XCTestCase {


    func test_Init() throws {
        let offer_id_12555 = MockOffers.load_Offer_12555()!
        let skuSet = offer_id_12555.skus!
        let firstSku = skuSet.first!
        let sut = OfferSkusVariants(offer: offer_id_12555)
        let setNamesToIntersect: [String] = ["Color.Semi Solar Yellow/ Scarlet" , "Size.6 Women\'s / 5 Men\'s", "Width.M"]
        
        let result = sut.skuID(setNamesToIntersect: setNamesToIntersect)
        Logger.info("sut.skuID? : \(result)")
        
    }

    func test_load_PageOffer_ID_12569() {
        let offer_id_12569 = MockOffers.load_PageOffers(offerId: 12569)!
//        XCTAssertNotNil(offer_id_12569)
        
        let sut = OfferSkusVariants(offer: offer_id_12569)
        
        let intersectingSkuIdSetMap = sut.intersectingSkuIdSetMap(key: "Color.Team Red/ Thunder Blue/ Blue")
        Logger.debug("intersectingSkuIdSetMap: \(intersectingSkuIdSetMap)")
    }
}
