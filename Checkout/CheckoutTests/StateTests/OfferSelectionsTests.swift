//
//  OfferSelectionsTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 4/21/23.
//

import XCTest
@testable import Checkout

final class OfferSelectionsTests: XCTestCase {

    func test_init() throws {
        let sut = OfferSelections(offer_id: 12555)
        
        XCTAssertTrue(sut.contains(12555))
    }


}
