//
//  ChannelStoreTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 4/24/23.
//

import XCTest
import VioletPublicClientAPI
@testable import Checkout

final class ChannelStoreTests: TestBundleFileTestCase {
    let sampleAppdId: Int64 = 42
    
    func test_ChannelStore_PathExists() throws {
        let sut = ChannelStore(appId: sampleAppdId)
        XCTAssertTrue(sut.pathExists())
        Logger.debug(sut.channelIDStoreDirectory.directoryPath)
    }
    
    func test_Cache_LoginResponse() {
        guard let decodedLoginResponse: LoginResponse = load_test_loginresponse() else {
            XCTFail()
            return
        }
        Logger.debug("Response: \(decodedLoginResponse.firstName)")
    }
    
    func load_test_loginresponse() -> LoginResponse? {
        return decodeJson(LoginResponse.self, forResource: "loginPostJsonResponse")
    }

}
