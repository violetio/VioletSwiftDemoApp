//
//  ExtensionsTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 4/18/23.
//

import XCTest
@testable import Checkout
import Violet

final class ExtensionsTests: XCTestCase {


    func test_firstAlbumMediaImageURL() throws {
        guard let offer = MockOffers.load_Offer_12555() else {
            XCTFail("Missing offer to test")
            return
        }
        
        XCTAssertNotNil(offer.firstAlbum())
        XCTAssertNotNil(offer.firstAlbumMedia())
        XCTAssertNotNil(offer.firstAlbumMediaImageSourceUrl())
        XCTAssertNotNil(offer.firstAlbumMediaImageURL())
    }

}
