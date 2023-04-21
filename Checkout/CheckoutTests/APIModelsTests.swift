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
    var testCheckoutSequence = TestCheckoutSequence.Order_ID_59087()

    func test_8_CheckoutCartShippingAvailableGetRequest() {
        // Given
        let checkoutCartShippingAvailableGetRequest = CheckoutCartShippingAvailableGetRequest(appCreds: appCreds,
                                                                                              token: self.loginToken,
                                                                                              cartId: testCheckoutSequence.orderId)
        let expectationRunner = ExpectationRunner(checkoutCartShippingAvailableGetRequest)
        expectationRunner.sink {
            XCTAssertEqual($0, true)
        }

        // When
        checkoutCartShippingAvailableGetRequest.send()

        // Then
        wait(for: expectationRunner.expectations, timeout: timeout_5s)
        XCTAssertNotNil(expectationRunner.streamHandle)
        XCTAssertNotNil(checkoutCartShippingAvailableGetRequest.dataResponse)

        if let aDataResponse = checkoutCartShippingAvailableGetRequest.dataResponse {
            persistEncodable(aDataResponse, to: testCheckoutSequence.shippingAvailable_Response_jsonResponseFileName())
        }
    }

    func test_7_CheckoutCartCustomerPostRequest() throws {
        // Given
        let guestOrderCustomer: GuestOrderCustomer! = TestJsonResources.guestOrderCustomer_Demo

        let checkoutCartCustomerPostRequest = CheckoutCartCustomerPostRequest(appCreds: appCreds,
                                                                              token: self.loginToken,
                                                                              cartId: testCheckoutSequence.orderId, priceCart: false,
                                                                              guestOrderCustomer: guestOrderCustomer)
        let expectationRunner = ExpectationRunner(checkoutCartCustomerPostRequest)
        expectationRunner.sink {
            XCTAssertEqual($0, true)
        }

        // When
        checkoutCartCustomerPostRequest.send()

        // Then
        wait(for: expectationRunner.expectations, timeout: timeout_5s)
        XCTAssertNotNil(expectationRunner.streamHandle)
        XCTAssertNotNil(checkoutCartCustomerPostRequest.dataResponse)

        if let aDataResponse = checkoutCartCustomerPostRequest.dataResponse {
            persistEncodable(aDataResponse, to: testCheckoutSequence.cartCustomerPostAvailable_Response_jsonResponseFileName())
        }
    }

    func test_6_CheckoutCartPaymentPostRequest() {
        // Given
        let body = PaymentMethodRequest(intentBasedCapture: true)
        let checkoutCartPaymentPostRequest = CheckoutCartPaymentPostRequest(appCreds: appCreds,
                                                                            token: self.loginToken,
                                                                            cartId: testCheckoutSequence.orderId, priceCart: true, paymentMethodRequest: body)
        let expectationRunner = ExpectationRunner(checkoutCartPaymentPostRequest)
        expectationRunner.sink {
            XCTAssertEqual($0, true)
        }

        // When
        checkoutCartPaymentPostRequest.send()

        // Then
        wait(for: expectationRunner.expectations, timeout: timeout_5s)
        XCTAssertNotNil(expectationRunner.streamHandle)
        XCTAssertNotNil(checkoutCartPaymentPostRequest.dataResponse)

        if let aDataResponse = checkoutCartPaymentPostRequest.dataResponse {
            persistEncodable(aDataResponse, to: testCheckoutSequence.paymentIntentBased_Response_jsonResponseFileName())
        }
    }

    /// Order with Bag missing ShippingMethod will fail to Decode,
    ///  Change over to return `ShoppingCart` then will succeed w or w/o shipping_method
    func test_5_GetOrderByIDRequest() {
        // Given
        let getOrderByIDRequest = GetCartByIDRequest(appCreds: appCreds, token: self.loginToken, orderId: testCheckoutSequence.orderId)

        let expectationRunner = ExpectationRunner(getOrderByIDRequest)
        expectationRunner.sink {
            XCTAssertEqual($0, true)
        }

        // When
        getOrderByIDRequest.send()

        // Then
        wait(for: expectationRunner.expectations, timeout: timeout_5s)
        XCTAssertNotNil(expectationRunner.streamHandle)
        XCTAssertNotNil(getOrderByIDRequest.dataResponse)
    }

    func test_4_CheckoutCartCreate() {
        // Given
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
        let expectationRunner = ExpectationRunner(checkoutCartPostRequest)

        expectationRunner.sink {
            XCTAssertEqual($0, true)
        }

        // When
        checkoutCartPostRequest.send()

        // Then
        wait(for: expectationRunner.expectations, timeout: timeout_5s)
        XCTAssertNotNil(expectationRunner.streamHandle)
        XCTAssertNotNil(checkoutCartPostRequest.dataResponse)

        if let aCart = checkoutCartPostRequest.dataResponse,
           let orderId = aCart.id {
                Logger.info("New CartID: \(orderId)")
                testCheckoutSequence = TestCheckoutSequence(orderId: orderId)
                persistEncodable(aCart, to: testCheckoutSequence.createCart_Response_jsonResponseFileName())
        }
    }

    func test_3b_GetPageOffers() {
        let merchantId : Int64 = 10003
        let request = GetPageOffersByMerchantIDRequest(appCreds: appCreds, token: self.loginToken, merchantId: merchantId)
        
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
            persistEncodable(aDataResponse, to: "PageOffer_Page_1_MerchantID_10003_Response.json")
        }
        
    }
    func test_3_GetOffer() {
        // Given
        let getOfferByIDRequest = GetOfferByIDRequest(appCreds: appCreds, token: self.loginToken, offerId: 12574)

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

        if let aDataResponse = getOfferByIDRequest.dataResponse {
            persistEncodable(aDataResponse, to: "Offer_ID_12574_Response.json")
        }
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
