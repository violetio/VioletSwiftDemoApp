//
//  APIModelsTests.swift
//  CheckoutTests
//
//  Created on 3/14/23.
//

@testable import Checkout
import Combine
import SwiftUI
import Violet
import XCTest

final class APIModelsTests: APIXCTestCase {
    var testCheckoutSequence = TestCheckoutSequence(orderId: 74445)

    func test_5_GetOrderByIDRequest() {
        // Given
        let request = GetCartByIDRequest(orderId: testCheckoutSequence.orderId)

        let expectationRunner = ExpectationRunner(request)
        expectationRunner.sink {
            XCTAssertEqual($0, true)
        }

        // When
        request.send()

        // Then
        wait(for: expectationRunner.expectations, timeout: timeout_5s)
        XCTAssertNotNil(expectationRunner.streamHandle)
        XCTAssertNotNil(request.dataResponse)
        
        
        if let aDataResponse = request.dataResponse {
            persistEncodable(aDataResponse, to: self.testCheckoutSequence.getCartByID_Response_jsonResponseFileName())
        }
    }

    func test_GetOffer() {
        // Given
        let getOfferByIDRequest = GetOfferByIDRequest(offerId: 12574)

        let expectationRunner = ExpectationRunner(getOfferByIDRequest)

        expectationRunner.sink {
            XCTAssertEqual($0, true)
        }

        // When
        getOfferByIDRequest.send()

        // Then
        wait(for: expectationRunner.expectations, timeout: timeout_5s)
        XCTAssertNotNil(expectationRunner.streamHandle)
        XCTAssertNotNil(getOfferByIDRequest.dataResponse)
    }

}
