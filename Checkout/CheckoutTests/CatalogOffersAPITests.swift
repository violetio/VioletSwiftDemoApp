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
        guard let loginToken = lastLoginPost_Token() else {
            XCTFail("No Login Token")
            return
        }
        var responseOffer: Offer? = nil
        let offer_id: Int64 = 12555
        let expectation = XCTestExpectation(description: "API Call")
        CatalogOffersAPI.catalogOffersOfferIdGet(xVioletToken: loginToken,
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
        let jsonData = CodableHelper.encode(responseOffer)
        switch jsonData {
        case .success(let dataToWrite):
            try! self.persistData(fileName: offer_12555_filename, data: dataToWrite)
        case .failure:
            XCTFail()
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
