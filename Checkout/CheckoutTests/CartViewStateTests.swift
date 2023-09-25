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
    
    func test_orderSkuViewState_for_offerSkuId() throws {
        let mockOrder = MockOffers.load_OrderID_71169()!
        let cartViewState = CartViewState(order:  mockOrder)
        let found = cartViewState.orderSkuViewState(offerSkuId: 33524)
        XCTAssertNotNil(found)
    }

}
