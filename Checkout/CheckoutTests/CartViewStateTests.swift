//
//  CartViewStateTests.swift
//  CheckoutTests
//
//  Created on 8/30/23
//

import XCTest
@testable import Checkout
import Violet

final class CartViewStateTests: XCTestCase {

    func testExample() throws {
        let mockOrderShippingMethodWrapperArray: OrderShippingMethodWrapperArray = MockOffers.load_OrderID_72500_ShippingMethods()!
        Logger.debug("mockOrderShippingMethodWrapperArray: \(mockOrderShippingMethodWrapperArray)")
    }

}
