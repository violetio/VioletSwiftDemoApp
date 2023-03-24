//
//  APIModelsTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/14/23.
//

@testable import Checkout
import Combine
import SwiftUI
import VioletPublicClientAPI
import XCTest

final class APIModelsTests: APIXCTestCase {
    var refreshToken: String? = nil
    var token: String? = nil
    
    func test_7_CheckoutCartShippingAvailableGetRequest() {
        let checkoutCartShippingAvailableGetRequest = CheckoutCartShippingAvailableGetRequest(appCreds: appCreds,
                                                                                              token: self.loginToken,
                                                                                              cartId: 58111)
        let expectation = XCTestExpectation(description: "CallCompleted True")
        
        let streamHandle: AnyCancellable? = checkoutCartShippingAvailableGetRequest.$callCompleted
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, true)
                expectation.fulfill()

            })

        // When
        checkoutCartShippingAvailableGetRequest.send()

        // Then
        wait(for: [expectation], timeout: timeout_5s)
        XCTAssertNotNil(streamHandle)
        XCTAssertNotNil(checkoutCartShippingAvailableGetRequest.dataResponse)
    }
    
    func test_6_CheckoutCartPaymentPostRequest() {
        let body = PaymentMethodRequest(intentBasedCapture: true)
        let checkoutCartPaymentPostRequest = CheckoutCartPaymentPostRequest(appCreds: appCreds,
                                                                            token: self.loginToken,
                                                                            cartId: 58111, priceCart: true, paymentMethodRequest: body)
        let expectation = XCTestExpectation(description: "CallCompleted True")
        
        let streamHandle: AnyCancellable? = checkoutCartPaymentPostRequest.$callCompleted
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, true)
                expectation.fulfill()

            })

        // When
        checkoutCartPaymentPostRequest.send()

        // Then
        wait(for: [expectation], timeout: timeout_5s)
        XCTAssertNotNil(streamHandle)
        XCTAssertNotNil(checkoutCartPaymentPostRequest.dataResponse)
    }
    
    /// Order with Bag missing ShippingMethod will fail to Decode,
    ///  Change over to return `ShoppingCart` then will succeed w or w/o shipping_method
    func DISABLED_test_5_GetOrderByIDRequest() {
        let getOrderByIDRequest = GetCartByIDRequest(appCreds: appCreds, token: self.loginToken, orderId: 58111)
        let expectation = XCTestExpectation(description: "CallCompleted True")
        
        let streamHandle: AnyCancellable? = getOrderByIDRequest.$callCompleted
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, true)
                expectation.fulfill()

            })

        // When
        getOrderByIDRequest.send()

        // Then
        wait(for: [expectation], timeout: timeout_5s)
        XCTAssertNotNil(streamHandle)
        XCTAssertNotNil(getOrderByIDRequest.dataResponse)
        
    }
    
    func test_4_CheckoutCartCreate() {
        let orderSku_SkuId_33524 = OrderSku(skuId: 33524, quantity: 1)
        let body = CartInitializationRequest(baseCurrency: "USD",
                                             skus: [orderSku_SkuId_33524],
                                             referralId: nil,
                                             appOrderId: nil,
                                             customer: nil,
                                             walletBasedCheckout: false)
        let checkoutCartPostRequest = CheckoutCartPostRequest(appCreds: appCreds,
                                         token: self.loginToken,
                                         cartInitializationRequest: body)
        let expectation = XCTestExpectation(description: "CallCompleted True")
        let streamHandle: AnyCancellable? = checkoutCartPostRequest.$callCompleted
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, true)
                expectation.fulfill()

            })

        // When
        checkoutCartPostRequest.send()

        // Then
        wait(for: [expectation], timeout: timeout_5s)
        XCTAssertNotNil(streamHandle)
        XCTAssertNotNil(checkoutCartPostRequest.dataResponse)

    }
    
    func test_3_GetOffer() {
        let getOfferByIDRequest = GetOfferByIDRequest(appCreds: appCreds, token: self.loginToken, offerId: 12574)
        let expectation = XCTestExpectation(description: "CallCompleted True")

        let streamHandle: AnyCancellable? = getOfferByIDRequest.$callCompleted
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, true)
                expectation.fulfill()

            })

        // When
        getOfferByIDRequest.send()

        // Then
        wait(for: [expectation], timeout: timeout_5s)
        XCTAssertNotNil(streamHandle)
        XCTAssertNotNil(getOfferByIDRequest.dataResponse)

//        if let responseToPersist = loginPostRequest.dataResponse {
//            persist(responseToPersist)
//        }

    }
    func test_1_LoginPostRequest() {
        // Given

        let loginPostRequest = LoginPostRequest(appCreds: appCreds)
        let expectation = XCTestExpectation(description: "CallCompleted True")

        let streamHandle: AnyCancellable? = loginPostRequest.$callCompleted
            // Remove the first (initial) value - we don't need it
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, true)
                self.refreshToken = loginPostRequest.dataResponse?.refreshToken
                self.token = loginPostRequest.dataResponse?.token
                expectation.fulfill()

            })

        // When
        loginPostRequest.send()

        // Then
        wait(for: [expectation], timeout: timeout_5s)
        XCTAssertNotNil(streamHandle)
        XCTAssertNotNil(self.token)
        XCTAssertNotNil(self.refreshToken)

        if let responseToPersist = loginPostRequest.dataResponse {
            persistEncodable(responseToPersist, to: loginPostJsonResponse_fileName)
        }
    }

    func DISABLED_test_2_AuthTokenGet() {
        // Given
        guard let jsonData = reloadData(fileName: loginPostJsonResponse_fileName) else {
            XCTFail("No Json Data")
            return
        }

        let decodeResult = CodableHelper.decode(LoginResponse.self, from: jsonData)
        var refreshToken = ""
        switch decodeResult {
        case .failure:
            XCTFail("Not Decoded")
        case .success(let loginPostRequest):
            refreshToken = loginPostRequest.refreshToken!
        }

        let authTokenGet = AuthTokenGet(appCreds: appCreds, refreshToken: refreshToken)
        let expectation = XCTestExpectation(description: "CallCompleted True")
//
        let streamHandle: AnyCancellable? = authTokenGet.$callCompleted
            // Remove the first (initial) value - we don't need it
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0, true)
                self.token = authTokenGet.dataResponse?.token
                expectation.fulfill()

            })

        // When
        authTokenGet.send()

        // Then
        wait(for: [expectation], timeout: timeout_5s)
        XCTAssertNotNil(streamHandle)
        XCTAssertNotNil(self.token)
    }
}
