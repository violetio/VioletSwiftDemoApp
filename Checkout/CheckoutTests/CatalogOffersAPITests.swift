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

    
    var appCreds = AppCreds.SandBoxTestCreds_Alan()
    //appCreds.setToken()
    var token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbGFuK3NhbmRib3hAdmlvbGV0LmlvIiwic2NvcGVzIjpbIlJPTEVfREVWRUxPUEVSIl0sInVzZXJfaWQiOjEwMjY4LCJ1c2VyX3R5cGUiOiJERVZFTE9QRVIiLCJtZXJjaGFudF9pZHMiOltdLCJkZXZlbG9wZXJfaWQiOjEwMTc0LCJhcHBfaWQiOiIxMDE5OSIsImlzcyI6Imh0dHBzOi8vdmlvbGV0LmlvIiwiaWF0IjoxNjc5MzQ4NjQ2LCJleHAiOjE2Nzk0MzUwNDZ9.FDkyg4OoW0bNSIzDS3n83GP8r0NhXO-TrNa9PsrI4veyOMA7-CHQe_bTCv5o3WwAlWhRway3VTpkRPxB9NQU-Q"
    
    func test_catalogOffersMerchantsMerchantIdGet() {
        let merchant_id: Int64 = 10003
        let expectation = XCTestExpectation(description: "API Call")
        CatalogOffersAPI.catalogOffersMerchantsMerchantIdGet(xVioletToken: token,
                                                             xVioletAppSecret: appCreds.apiSecret,
                                                             xVioletAppId: appCreds.appID,
                                                             merchantId: merchant_id) { data, err in
            if let error = err {
                print(error)
                return
            }

            if let response = data {
                print(response)
            }
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: pageTimeout)
        
    }
    
    func test_generate_offer() {
        guard let resource: CSV<Named> = MockData.loadData() else {
            XCTFail("No CSV Data")
            return
        }
        
        print("Resource? Rows Count \(resource.rows.count)")
    }

    func test_catalogOffersOfferIdGet() throws {
        let offer_id: Int64 = 12555
        let expectation = XCTestExpectation(description: "API Call")
        CatalogOffersAPI.catalogOffersOfferIdGet(offerId: offer_id,
                                                 xVioletToken: token,
                                                 xVioletAppSecret: appCreds.apiSecret,
                                                 xVioletAppId: appCreds.appID) { data, err in
                if let error = err {
                    print(error)
                    return
                }

                if let response = data {
                    print(response)
                }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: pageTimeout)
    }
    
    func test_catalogProductsGet() throws {
        let expectation = XCTestExpectation(description: "API Call")
        CatalogProductsAPI.catalogProductsGet(xVioletToken: token,
                                              xVioletAppSecret: appCreds.apiSecret,
                                              xVioletAppId: appCreds.appID, page: 0, size: 5)
        { data, err in
                if let error = err {
                    print(error)
                    return
                }

                if let response = data {
                    print(response)
                }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }

}
