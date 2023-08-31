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

    func test_Init_OrderShippingMethodSelectViewState() throws {
        let mockOrderShippingMethodWrapperArray: OrderShippingMethodWrapperArray = MockOffers.load_OrderID_73936_ShippingMethods()!
//        Logger.debug("mockOrderShippingMethodWrapperArray: \(mockOrderShippingMethodWrapperArray)")
        let sut = OrderShippingMethodSelectViewState(orderShippingMethods: mockOrderShippingMethodWrapperArray)
        //Logger.debug("sut: \(sut)")
    }

}
