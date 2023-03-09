//
//  CatalogOffersAPI.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/9/23.
//

import XCTest
@testable import Checkout
import VioletPublicClientAPI

final class CatalogOffersAPITests: XCTestCase {

    var appCreds = AppCreds.SandBoxTestCreds()
    //appCreds.setToken()
    var token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJpc2hhbi5ndXJ1QHZpb2xldC5pbyIsInNjb3BlcyI6WyJST0xFX0RFVkVMT1BFUiJdLCJ1c2VyX2lkIjoxMDM5NywidXNlcl90eXBlIjoiREVWRUxPUEVSIiwibWVyY2hhbnRfaWRzIjpbXSwiZGV2ZWxvcGVyX2lkIjoxMDI5MiwiYXBwX2lkIjoiMTAzODIiLCJpc3MiOiJodHRwczovL3Zpb2xldC5pbyIsImlhdCI6MTY3ODQwNTU5NiwiZXhwIjoxNjc4NDkxOTk2fQ.bIJrsE8yXna7jO_u4KvIKZEBwxIYz0H7e02N4W97F-78OklQMKI86GAmwNwiIdSrZ7JkDZXPydcZ3cK9cZTqjQ"

    func testExample() throws {
        let offer_id: Int64 = 10114
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
        wait(for: [expectation], timeout: 3.0)
    }

}
