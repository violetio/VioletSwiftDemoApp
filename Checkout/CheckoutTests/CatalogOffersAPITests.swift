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

final class CatalogOffersAPITests: XCTestCase {

    
    func test_generate_offer() {
        guard let resource: CSV<Named> = MockData.loadData() else {
            XCTFail("No CSV Data")
            return
        }
        
        print("Resource? Rows Count \(resource.rows.count)")
    }
    
    var appCreds = AppCreds.SandBoxTestCreds()
    //appCreds.setToken()
    var token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJpc2hhbi5ndXJ1QHZpb2xldC5pbyIsInNjb3BlcyI6WyJST0xFX0RFVkVMT1BFUiJdLCJ1c2VyX2lkIjoxMDM5NywidXNlcl90eXBlIjoiREVWRUxPUEVSIiwibWVyY2hhbnRfaWRzIjpbXSwiZGV2ZWxvcGVyX2lkIjoxMDI5MiwiYXBwX2lkIjoiMTAzODIiLCJpc3MiOiJodHRwczovL3Zpb2xldC5pbyIsImlhdCI6MTY3ODQ3MjEyNSwiZXhwIjoxNjc4NTU4NTI1fQ.et0A8z_JwJy8_KQj-d6fLhy11UBP50KrlZTgpmWxaV09CKr6S2StzpvUA_9nMyBVMWfDHuiZnolJcfSDkScsww"

    func test_catalogOffersOfferIdGet() throws {
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
