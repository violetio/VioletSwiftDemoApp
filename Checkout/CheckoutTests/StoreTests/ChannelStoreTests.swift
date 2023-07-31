//
//  ChannelStoreTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 4/24/23.
//

import XCTest
import Violet
@testable import Checkout

final class ChannelStoreTests: TestBundleFileTestCase {
    let sampleAppId: Int64 = 42
    
    func test_delete_channel_directory() {
        ChannelStore.ChannelIDStoreDirectory(appId: 42).deleteDirectory()
    }
    func test_ChannelStore_PathExists() throws {
        let sut = ChannelStore(appId: sampleAppId, createDir: true)
        XCTAssertTrue(sut.pathExists())
        Logger.debug(sut.channelIDStoreDirectory.directoryPath)
    }
    
    func test_Cache_LoginResponse() {
        guard let decodedLoginResponse: LoginResponse = load_test_loginresponse() else {
            XCTFail()
            return
        }
        Logger.debug("Response: \(decodedLoginResponse.firstName)")
        
        let sut = ChannelStore(appId: sampleAppId)
//        let didWrite = sut.updateCache(loginResponse: decodedLoginResponse)
//        XCTAssertTrue(didWrite)
    }
    
    func test_createDirectory() {
        let sut = ChannelStore(appId: sampleAppId)
        sut.createDirectory()
    }
    
    func test_deleteteDirectory() {
        let sut = ChannelStore(appId: sampleAppId)
        sut.deleteDirectory()
    }
    
    func test_CachedEntity_SetLoginResponse() throws {
        let store = ChannelStore(appId: sampleAppId)
        store.recreateDirectory()
        
        guard let decodedLoginResponse: LoginResponse = load_test_loginresponse() else {
            XCTFail()
            return
        }
        
        let sut = CachedEntity<LoginResponse>(appId: sampleAppId)
        
        try sut.set(decodedLoginResponse)
        
        XCTAssertTrue(sut.fileExists(), "set call failed")
        
        let reloadedEntity = sut.reloadCachedEntity()
        XCTAssertNotNil(reloadedEntity)
        
        XCTAssertTrue(sut.clearCachedEntity())
        XCTAssertFalse(sut.fileExists())
    }
    
    func load_test_loginresponse() -> LoginResponse? {
        return decodeJson(LoginResponse.self, forResource: "loginPostJsonResponse")
    }

}
