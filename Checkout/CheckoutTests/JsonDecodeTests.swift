//
//  JsonDecodeTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/24/23.
//

import VioletPublicClientAPI
import XCTest
@testable import Checkout

final class JsonDecodeTests: TestBundleFileTestCase {
    var testFile_get_order_by_id_58111: URL!
    var testFile_bag_id_43113: URL!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        testFile_get_order_by_id_58111 = testBundle.url(forResource: "get_order_by_id_58111", withExtension: "json")
        testFile_bag_id_43113 = testBundle.url(forResource: "bag_id_43113", withExtension: "json")
    }

    func test_Bag_43113() throws {
        let data: Data! = try! Data(contentsOf: testFile_bag_id_43113)
        let decodedResult = CodableHelper.decode(ShoppingBag.self, from: data)
        switch decodedResult {
        case .failure(let error):
            XCTFail("Did not Decode bag_43113 \(error)")
        case .success(let bag):
            Logger.info("bag.id: \(bag.id)")
            XCTAssertNotNil(bag)
        }
        
    }
    
    func test_Order_58111() throws {
        let data: Data! = try! Data(contentsOf: testFile_get_order_by_id_58111)
        let decodedResult = CodableHelper.decode(ShoppingCart.self, from: data)
        switch decodedResult {
        case .failure(let error):
            XCTFail("Did not Decode Order 5811 \(error)")
        case .success(let order):
            Logger.info("order.id: \(order.id)")
            XCTAssertNotNil(order)
        }
        
    }
}
