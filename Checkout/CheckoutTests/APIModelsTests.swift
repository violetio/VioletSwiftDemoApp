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
    var refreshToken: String? = nil
    var token: String? = nil
    var testCheckoutSequence = TestCheckoutSequence(orderId: 74445)

//    func test_11_CatalogSearchOffersRequest() {
//        let request = CatalogSearchOffersRequest()
//        
//        let expectation = XCTestExpectation(description: "CallCompleted True")
//
//        var streamHandle: AnyCancellable?
////        let expectationRunner = ExpectationRunner(request)
//        expectationRunner.sink {
//            XCTAssertEqual($0, true)
//        }
//
//        // When
//        request.send()
//
//        // Then
//        wait(for: expectationRunner.expectations, timeout: timeout_5s)
//        XCTAssertNotNil(expectationRunner.streamHandle)
//        XCTAssertNotNil(request.pageOfferResponse)
//        
//    }
    //** PROXY TESTED
    func test_10_SubmitCheckout() {
        let request = SubmitCartRequest(orderId: testCheckoutSequence.orderId)
        
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
            persistEncodable(aDataResponse, to: self.testCheckoutSequence.submitCart_Response_jsonResponseFileName())
        }
    }
    
    //** PROXY TESTED
    func test_9_ApplyShippingMethods() {
        
        let body = [BagShippingMethod(bagId: 54314,shippingMethodId: "shopify-Economy-4.90")]
        let request = ApplyShippingMethodsRequest(orderId: testCheckoutSequence.orderId, body: body)
        
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
            persistEncodable(aDataResponse, to: self.testCheckoutSequence.applyShipping_Response_jsonResponseFileName())
        }
    }
    
    //** PROXY TESTED
    func test_8_CheckoutCartShippingAvailableGetRequest() {
        // Given
        let checkoutCartShippingAvailableGetRequest = CheckoutCartShippingAvailableGetRequest(orderId: self.testCheckoutSequence.orderId)
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
//            Logger.info("\(checkoutCartShippingAvailableGetRequest.d)")
            persistEncodable(aDataResponse, to: self.testCheckoutSequence.shippingAvailable_Response_jsonResponseFileName())
        }
    }

    //** PROXY TESTED
    func test_7_CheckoutCartCustomerPostRequest() throws {
        // Given
        var guestOrderCustomer: OrderCustomer! = TestJsonResources.guestOrderCustomer_Demo
        guestOrderCustomer.sameAddress = true

        let checkoutCartCustomerPostRequest = CheckoutCartCustomerPostRequest(cartId: self.testCheckoutSequence.orderId,
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
            persistEncodable(aDataResponse, to: self.testCheckoutSequence.cartCustomerPostAvailable_Response_jsonResponseFileName())
        }
    }
     
    //** PROXY TESTED
    func test_6_CheckoutCartPaymentPostRequest() {
        // Given
        let body = PaymentMethodRequest(appOrderId: nil,
                                        cardCvc: 987,
                                        cardExpMonth: 12, cardExpYear: 24,
                                        cardNumber: "4242424242424242", cardPostalCode: "11237",
                                        completeCheckout: nil,
                                        intentBasedCapture: false, token: nil)
        let checkoutCartPaymentPostRequest = RequestIntentBasedCapturePayment(cartId: self.testCheckoutSequence.orderId)
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
            persistEncodable(aDataResponse, to: self.testCheckoutSequence.paymentIntentBased_Response_jsonResponseFileName())
        }
    }

    /// Order with Bag missing ShippingMethod will fail to Decode,
    ///  Change over to return `ShoppingCart` then will succeed w or w/o shipping_method
    //** PROXY TESTED
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
    
    //** PROXY TESTED
    func test_4b_RemoveSkuFromCart() {
        // Given
        
        let removeSkuFromCartRequest = RemoveSkuFromCartRequest(orderId: testCheckoutSequence.orderId,
                                                                orderSkuId: 71645)
        let expectationRunner = ExpectationRunner(removeSkuFromCartRequest)

        expectationRunner.sink {
            XCTAssertEqual($0, true)
        }

        // When
        removeSkuFromCartRequest.send()

        // Then
        wait(for: expectationRunner.expectations, timeout: timeout_5s)
        XCTAssertNotNil(expectationRunner.streamHandle)
        XCTAssertNotNil(removeSkuFromCartRequest.dataResponse)

        if let aCart = removeSkuFromCartRequest.dataResponse
        {
            persistEncodable(aCart, to: self.testCheckoutSequence.addSkuToCart_Response_jsonResponseFileName())
        }
    }

    //** PROXY TESTED
    func test_4c_UpdateSkuInCartCreate() {
        // Given
        let orderSkuId: Int64 = 76756
        let orderSku_SkuId_33524 = OrderSku(quantity: 2, skuId: 33524)

        let addSkuToCartRequest = UpdateSkuInCartRequest(orderId: testCheckoutSequence.orderId,
                                                         orderSkuId: orderSkuId,
                                                         orderSku: orderSku_SkuId_33524)
        let expectationRunner = ExpectationRunner(addSkuToCartRequest)

        expectationRunner.sink {
            XCTAssertEqual($0, true)
        }

        // When
        addSkuToCartRequest.send()

        // Then
        wait(for: expectationRunner.expectations, timeout: timeout_5s)
        XCTAssertNotNil(expectationRunner.streamHandle)
        XCTAssertNotNil(addSkuToCartRequest.dataResponse)

        if let aCart = addSkuToCartRequest.dataResponse
        {
            persistEncodable(aCart, to: self.testCheckoutSequence.updateSkuInCart_Response_jsonResponseFileName())
            
        }
    }
    //** PROXY TESTED
    func test_4a_AddSkuToCartCreate() {
        // Given
        let orderSku_SkuId_33524 = OrderSku(quantity: 1, skuId: 33524)

        let addSkuToCartRequest = AddSkuToCartRequest(orderId: testCheckoutSequence.orderId,
                                                      orderSku: orderSku_SkuId_33524)
        let expectationRunner = ExpectationRunner(addSkuToCartRequest)

        expectationRunner.sink {
            XCTAssertEqual($0, true)
        }

        // When
        addSkuToCartRequest.send()

        // Then
        wait(for: expectationRunner.expectations, timeout: timeout_5s)
        XCTAssertNotNil(expectationRunner.streamHandle)
        XCTAssertNotNil(addSkuToCartRequest.dataResponse)

        if let aCart = addSkuToCartRequest.dataResponse
        {
            persistEncodable(aCart, to: self.testCheckoutSequence.addSkuToCart_Response_jsonResponseFileName())
            
        }
    }
    
    //** PROXY TESTED
    func test_4_CheckoutCartCreate() {
        // Given
        let orderSku_SkuId_33524 = OrderSku(quantity: 1, skuId: 33524)
        let body = CartInitializationRequest(baseCurrency: "USD",
                                             referralId: nil,
                                             skus: [orderSku_SkuId_33524],
                                             walletBasedCheckout: false)

        let checkoutCartPostRequest = CreateCartRequest(cartInitializationRequest: body)
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
           let orderId = aCart.id
        {
            Logger.info("New CartID: \(orderId)")
            self.testCheckoutSequence = TestCheckoutSequence(orderId: orderId)
            persistEncodable(aCart, to: self.testCheckoutSequence.createCart_Response_jsonResponseFileName())
        }
    }

    //** PROXY TESTED
    func test_3b_GetPageOffers() {
        let merchantId: Int64 = 10003
        let request = GetPageOffersByMerchantIDRequest(merchantId: merchantId)

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
//        else if let anError: ErrorResponse = request.errorResponse as ErrorResponse {
//            print("Error: ---")
//            print("\(anError)")
//            //persistEncodable(anError, to: "PageOffer_Error.json")
//        }
    }

    //** PROXY TESTED
    func test_3_GetOffer() {
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

        if let aDataResponse = getOfferByIDRequest.dataResponse {
            persistEncodable(aDataResponse, to: "Offer_ID_12574_Response.json")
        }
    }

}
