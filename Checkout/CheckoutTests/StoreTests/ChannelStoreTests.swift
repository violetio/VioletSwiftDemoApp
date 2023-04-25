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
    
    func test_delete_channel_directory() {
        ChannelStore.ChannelIDStoreDirectory(appId: 42).deleteDirectory()
    }
    func test_ChannelStore_PathExists() throws {
        let sut = ChannelStore(appId: sampleAppdId, createDir: true)
        XCTAssertTrue(sut.pathExists())
        Logger.debug(sut.channelIDStoreDirectory.directoryPath)
    }
    
    func test_Cache_LoginResponse() {
        guard let decodedLoginResponse: LoginResponse = load_test_loginresponse() else {
            XCTFail()
            return
        }
        Logger.debug("Response: \(decodedLoginResponse.firstName)")
        
        let sut = ChannelStore(appId: sampleAppdId)
//        let didWrite = sut.updateCache(loginResponse: decodedLoginResponse)
//        XCTAssertTrue(didWrite)
    }
    
    func test_createDirectory() {
        let sut = ChannelStore(appId: sampleAppdId)
        sut.createDirectory()
    }
    
    func test_deleteteDirectory() {
        let sut = ChannelStore(appId: sampleAppdId)
        sut.deleteDirectory()
    }
    
//    func test_compare_ChannelIDStoredEntityFilePath() {
//        let filePathOld = ChannelStore.ChannelIDStoredEntityFilePath(appId: sampleAppdId, cacheFileName: .loginResponse)
//        let filePathNew = ChannelStore.ChannelIDStoredEntityFilePath2(appId: sampleAppdId, cacheFileName: .loginResponse)
//        
//        XCTAssertEqual(filePathOld!.fileURL, filePathNew.fileURL)
//        
//    }
    
    func test_CachedEntity_SetLoginResponse() throws {
        let store = ChannelStore(appId: sampleAppdId)
        store.recreateDirectory()
        
        let channelStoreFileDir = ChannelStore.ChannelIDStoreDirectory(appId: sampleAppdId)
        
        guard let decodedLoginResponse: LoginResponse = load_test_loginresponse() else {
            XCTFail()
            return
        }
        let filePath = ChannelStore.ChannelIDStoredEntityFilePath(appId: sampleAppdId, cacheFileName: .loginResponse)
        
        let sut = CachedEntity<LoginResponse>(filePath: filePath)
        
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
