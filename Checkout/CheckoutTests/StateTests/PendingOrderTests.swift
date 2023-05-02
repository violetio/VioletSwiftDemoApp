//
//  PendingOrderTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 4/21/23.
//

import XCTest
import VioletPublicClientAPI
@testable import Checkout

final class PendingOrderTests: TestBundleFileTestCase {

    func test_log_order_61241() throws {
        let restoredOrder = self.decodeJson(Order.self, forResource: "Order_ID_61241")
        XCTAssertNotNil(restoredOrder)
        let sut = PendingOrder.fromOrder(restoredOrder)
        XCTAssertNotNil(sut)
        //XCTAssertTrue(sut.contains(12555))
    }


}
