//
//  CatalogOffersAPI.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/9/23.
//

import XCTest
@testable import Checkout
import VioletPublicClientAPI
import SwiftCSV

final class CatalogOffersAPITests: APIXCTestCase {

    func test_catalogOffersOfferIdGet() throws {

        var responseOffer: Offer? = nil
        let offer_id: Int64 = 12555
        let expectation = XCTestExpectation(description: "API Call")
        CatalogOffersAPI.catalogOffersOfferIdGet(xVioletToken: self.loginToken,
                                                 xVioletAppSecret: appCreds.apiSecret,
                                                 xVioletAppId: appCreds.appID,
                                                 offerId: offer_id) { data, err in
                if let error = err {
                    print(error)
                    return
                }

                if let response = data {
                    responseOffer = response
                }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout_5s)
        XCTAssertNotNil(responseOffer)

        let offer_12555_filename = "offer_12555_response.json"
        persistEncodable(responseOffer, to: offer_12555_filename)
    }
    
    func test_catalogOffersOfferIdGet_12573() throws {

        var responseOffer: Offer? = nil
        let offer_id: Int64 = 12573
        let expectation = XCTestExpectation(description: "API Call")
        CatalogOffersAPI.catalogOffersOfferIdGet(xVioletToken: self.loginToken,
                                                 xVioletAppSecret: appCreds.apiSecret,
                                                 xVioletAppId: appCreds.appID,
                                                 offerId: offer_id) { data, err in
                if let error = err {
                    print(error)
                    return
                }

                if let response = data {
                    responseOffer = response
                }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout_5s)
        XCTAssertNotNil(responseOffer)

        let offer_12555_filename = "offer_12573_response.json"
        persistEncodable(responseOffer, to: offer_12555_filename)
    }
    
    func test_catalogOffersOfferIdGet_12569() throws {

        var responseOffer: Offer? = nil
        let offer_id: Int64 = 12569
        let expectation = XCTestExpectation(description: "API Call")
        CatalogOffersAPI.catalogOffersOfferIdGet(xVioletToken: self.loginToken,
                                                 xVioletAppSecret: appCreds.apiSecret,
                                                 xVioletAppId: appCreds.appID,
                                                 offerId: offer_id) { data, err in
                if let error = err {
                    print(error)
                    return
                }

                if let response = data {
                    responseOffer = response
                }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout_5s)
        XCTAssertNotNil(responseOffer)

        let offer_12555_filename = "offer_12569_response.json"
        persistEncodable(responseOffer, to: offer_12555_filename)
    }
  
    func test_catalogOffersMerchantsMerchantIdGet() throws {
        var responsePageOffer: PageOffer? = nil
        let merchant_id: Int64 = 10003
        let expectation = XCTestExpectation(description: "API Call")
        CatalogOffersAPI.catalogOffersMerchantsMerchantIdGet(xVioletToken: loginToken,
                                                             xVioletAppSecret: appCreds.apiSecret,
                                                             xVioletAppId: appCreds.appID,
                                                             merchantId: merchant_id, page: 1, size: 10) { data, err in
            if let error = err {
                print(error)
                return
            }

            if let response = data {
                responsePageOffer = response
            }
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout_5s)
        if let nonNullPageOffer = responsePageOffer {
            let page_offer_10003_Page1_filename = "page_offer_10003_Page1.json"
            persistEncodable(nonNullPageOffer, to: page_offer_10003_Page1_filename)
        }
    }
//
//    func test_catalogProductsGet() throws {
//        let expectation = XCTestExpectation(description: "API Call")
//        CatalogProductsAPI.catalogProductsGet(xVioletToken: token,
//                                              xVioletAppSecret: appCreds.apiSecret,
//                                              xVioletAppId: appCreds.appID, page: 0, size: 5)
//        { data, err in
//                if let error = err {
//                    print(error)
//                    return
//                }
//
//                if let response = data {
//                    print(response)
//                }
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 3.0)
//    }

}
