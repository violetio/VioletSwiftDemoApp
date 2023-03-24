//
//  JsonDecodeTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/24/23.
//

import VioletPublicClientAPI
import XCTest
@testable import Checkout

final class JsonDecodeTests: XCTestCase {
    var testBundle: Bundle!
    var testFile_get_order_by_id_58111: URL!
    
    override func setUpWithError() throws {
        testBundle = Bundle(for: type(of: self))
        testFile_get_order_by_id_58111 = testBundle.url(forResource: "get_order_by_id_58111", withExtension: "json")
    }


    func test_Order_58111() throws {
        let data: Data! = try! Data(contentsOf: testFile_get_order_by_id_58111)
        let decodedResult = CodableHelper.decode(Order.self, from: data)
        switch decodedResult {
        case .failure(let error):
            XCTFail("Did not Decode Order 5811 \(error)")
        case .success(let order):
            Logger.info("order.id: \(order.id)")
            XCTAssertNotNil(order)
        }
        
    }
}
