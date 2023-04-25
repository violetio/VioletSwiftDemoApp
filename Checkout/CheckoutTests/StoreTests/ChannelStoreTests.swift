//
//  ChannelStoreTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 4/24/23.
//

import XCTest
@testable import Checkout

final class ChannelStoreTests: XCTestCase {
    let sampleAppdId: Int64 = 42
    
    func test_ChannelStore_PathExists() throws {
        let sut = ChannelStore(appId: sampleAppdId)
        XCTAssertTrue(sut.pathExists())
        Logger.debug(sut.channelIDStoreDirectory.directoryPath)
    }

}
