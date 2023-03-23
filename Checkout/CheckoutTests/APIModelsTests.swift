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
    
    func test_3_GetOffer() {
        let getOfferByIDRequest = GetOfferByIDRequest(appCreds: appCreds, token: self.loginToken, offerId: 12555)
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

    func test_2_AuthTokenGet() {
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
