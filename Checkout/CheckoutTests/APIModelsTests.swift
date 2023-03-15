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

final class APIModelsTests: XCTestCase {
    var refreshToken: String? = nil
    var token: String? = nil
    let fileName = "loginPostJsonResponse.json"
    
    func test_1_LoginPostRequest() {
        // Given

        let loginPostRequest = LoginPostRequest(appCreds: AppCreds())
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
        wait(for: [expectation], timeout: 3)
        XCTAssertNotNil(streamHandle)
        XCTAssertNotNil(self.token)
        XCTAssertNotNil(self.refreshToken)

        if let responseToPersist = loginPostRequest.dataResponse {
            let jsonData = CodableHelper.encode(responseToPersist)
            switch jsonData {
            case .success(let dataToWrite):
                try! self.persistData(fileName: self.fileName, data: dataToWrite)
            case .failure:
                XCTFail()
            }
        }
    }

    func test_2_AuthTokenGet() {
        // Given
        guard let jsonData = reloadData(fileName: self.fileName) else {
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

        let authTokenGet = AuthTokenGet(appCreds: AppCreds(), refreshToken: refreshToken)
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
        wait(for: [expectation], timeout: 3)
        XCTAssertNotNil(streamHandle)
        XCTAssertNotNil(self.token)
    }
    
    // Helpers
    func persistData(fileName: String, data: Data) throws {
        let cachesDir = FileDirectory.CachesFileDirectory()
        let targetWritePath = FilePath(fileName: fileName, fileDirectory: cachesDir)!

        try data.write(to: targetWritePath.fileURL, options: .noFileProtection)
        Logger.debug("Wrote Caches file: \(targetWritePath.fileURL)")
    }

    func reloadData(fileName: String) -> Data? {
        let cachesDir = FileDirectory.CachesFileDirectory()
        let filePath = FilePath(fileName: fileName, fileDirectory: cachesDir)!
        return try? Data(contentsOf: filePath.fileURL)
    }
}
