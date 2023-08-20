//
//  OfferVariantsTests.swift
//  CheckoutTests
//
//  Created on 8/20/23
//

import XCTest
@testable import Checkout

final class OfferVariantsTests: XCTestCase {


    func test_Intersect() throws {
        let offer_id_12555 = MockOffers.load_Offer_12555()!
        let sut = OfferVariants(offer: offer_id_12555)
        //Logger.info("\(sut.skuIdSetMap)")
        
        let setNamesToIntersect: [String] = ["Color.Semi Solar Yellow/ Scarlet" , "Size.6 Women\'s / 5 Men\'s", "Width.M"]
        
        let result = sut.skuID(setNamesToIntersect: setNamesToIntersect)
//        Logger.info("sut.skuID? : \(result)")
        XCTAssertEqual(32102, result)
        
    }

}
