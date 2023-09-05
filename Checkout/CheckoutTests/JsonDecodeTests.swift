//
//  JsonDecodeTests.swift
//  CheckoutTests
//
//  Created on 3/24/23.
//

import Violet
import XCTest
@testable import Checkout

final class JsonDecodeTests: TestBundleFileTestCase {
    var testFile_get_order_by_id_58111: URL!
    var testFile_bag_id_43113: URL!
    var testFile_shipping_methods_get_bag_id_43402: URL!
    var testFile_shipping_methods_get_bag_id_54314: URL!
    var testFile_shipping_method_1_bag_id_54314: URL!
    var testFile_shipping_method_2_bag_id_54314: URL!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        testFile_get_order_by_id_58111 = testBundle.url(forResource: "get_order_by_id_58111", withExtension: "json")
        testFile_bag_id_43113 = testBundle.url(forResource: "bag_id_43113", withExtension: "json")
        testFile_shipping_methods_get_bag_id_43402 = testBundle.url(forResource: "shipping_methods_get_bag_id_43402", withExtension: "json")
        testFile_shipping_methods_get_bag_id_54314 = testBundle.url(forResource: "shipping_methods_get_bag_id_54314", withExtension: "json")
        testFile_shipping_method_1_bag_id_54314 = testBundle.url(forResource: "shipping_method_1_bag_id_54314", withExtension: "json")
        testFile_shipping_method_2_bag_id_54314 = testBundle.url(forResource: "shipping_method_2_bag_id_54314", withExtension: "json")
    }
    
    func test_shipping_method_1_bag_id_54314() throws {
        let data: Data! = try! Data(contentsOf: testFile_shipping_method_1_bag_id_54314)
        //let decodedResult = CodableHelper.decode([OrderShippingMethodWrapper.self], from: data)
        let decodedResult = CodableHelper.decode(OrderShippingMethod.self, from: data)
        switch decodedResult {
        case .failure(let error):
            XCTFail("Did not Decode bag_54314 \(error)")
        case .success(let orderShippingMethod):
            Logger.info("orderShippingMethod: \(orderShippingMethod)")
            XCTAssertNotNil(orderShippingMethod)
        }
    }
    
//    func test_Offer_OrderSku() {
//        let anOffer = MockOffers.load_Offer_12555()
//        anOffer?.skus?.count
//    }

    /*
    func test_Bag_43113() throws {
        let data: Data! = try! Data(contentsOf: testFile_bag_id_43113)
        let decodedResult = CodableHelper.decode(ShoppingBag.self, from: data)
        switch decodedResult {
        case .failure(let error):
            XCTFail("Did not Decode bag_43113 \(error)")
        case .success(let bag):
            Logger.info("bag.id: \(String(bag.id ?? 0))")
            XCTAssertNotNil(bag)
        }
        
    }
    */
    /**
     /Users/alan/github2/VioletSwiftDemoApp/Checkout/CheckoutTests/JsonDecodeTests.swift:44: error:
     -[CheckoutTests.JsonDecodeTests test_Shipping_Methods_BagId_43402] : failed
     - Did not Decode bag_43113
     typeMismatch(Swift.Dictionary<Swift.String, Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Dictionary<String, Any> but found an array instead.", underlyingError: nil))
     */
    func test_Shipping_Methods_BagId_43402() throws {
        let data: Data! = try! Data(contentsOf: testFile_shipping_methods_get_bag_id_43402)
        let decodedResult = CodableHelper.decode(OrderShippingMethodWrapper.self, from: data)
        switch decodedResult {
        case .failure(let error):
            XCTFail("Did not Decode bag_43113 \(error)")
        case .success(let orderShippingMethodWrapper):
            Logger.info("orderShippingMethodWrapper.bagId: \(orderShippingMethodWrapper.bagId)")
            XCTAssertNotNil(orderShippingMethodWrapper)
        }
    }
    
    func test_Shipping_Methods_BagId_54314() throws {
        let data: Data! = try! Data(contentsOf: testFile_shipping_methods_get_bag_id_54314)
        //let decodedResult = CodableHelper.decode([OrderShippingMethodWrapper.self], from: data)
        let decodedResult = CodableHelper.decode(OrderShippingMethodWrapperArray.self, from: data)
        switch decodedResult {
        case .failure(let error):
            XCTFail("Did not Decode bag_54314 \(error)")
        case .success(let orderShippingMethodWrapperArray):
            //Logger.info("orderShippingMethodWrapper.bagId: \(orderShippingMethodWrapper.bagId)")
            XCTAssertNotNil(orderShippingMethodWrapperArray)
        }
    }
    
    //
    
    /*
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
        
    }*/
    
}
