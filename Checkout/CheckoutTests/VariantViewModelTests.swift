//
//  VariantViewModelTests.swift
//  CheckoutTests
//
//  Created on 8/9/23
//

import XCTest
@testable import Checkout

final class VariantViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_1() throws {
        let sut = VariantViewModel(offer: MockOffers.load_Offer_12574()!)
        
        XCTAssertEqual(sut.offer.variants!.count, 0)
    }

}
