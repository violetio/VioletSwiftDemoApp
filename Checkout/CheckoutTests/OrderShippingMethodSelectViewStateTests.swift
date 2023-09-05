//
//  OrderShippingMethodSelectViewStateTests.swift
//  CheckoutTests
//
//  Created on 8/31/23
//

import XCTest
@testable import Checkout

final class OrderShippingMethodSelectViewStateTests: XCTestCase {

    func testExample() throws {
        let mockOrder = MockOffers.load_OrderID_73936()!
        let mockOrderShippingMethodWrapperArray = MockOffers.load_OrderID_73936_ShippingMethods()!
        let sut = OrderShippingMethodSelectViewState(orderShippingMethods: mockOrderShippingMethodWrapperArray, order: mockOrder)
        XCTAssertEqual(sut.bagIDToMerchantNameMap.count, 2)
        
        sut.bagIDToBagShippingMethodStateMap.keys.forEach { aBagId in
            XCTAssertEqual(sut.bagIDToMerchantNameMap[aBagId], sut.bagIDToBagShippingMethodStateMap[aBagId]?.merchantName)
        }
        
        
    }

}
