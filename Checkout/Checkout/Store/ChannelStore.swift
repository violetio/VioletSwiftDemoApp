//
//  ChannelStore.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import Combine
import Foundation
import VioletPublicClientAPI

class ChannelStore {
    
    static let ChannelStoreDirectory: FileDirectory = {
        let channelStoreDirectory = FileDirectory.CachesFileDirectory().childDirectory(name: "ChannelStore")
        channelStoreDirectory.createDirectory()
        return channelStoreDirectory
    }()
    
    static func ChannelIDStoreDirectory(appId: Int64) -> FileDirectory {
        Self.ChannelStoreDirectory.childDirectory(name: String(appId))
    }
    
    static func ChannelIDStoredEntityFilePath(appId: Int64, cacheFileName: CacheFileNames) -> FilePath {
        return FilePath(fileName: cacheFileName.rawValue, in: self.ChannelIDStoreDirectory(appId: appId))
    }
    
    enum CacheFileNames: String {
        case loginResponse = "loginResponse.json"
        case lastOrder = "lastOrder.json"
        case shippingMethodWrappersArray = "shippingMethodWrappersArray.json"
    }
    
    let appId: Int64
    let channelIDStoreDirectory: FileDirectory
    var cachedLoginResponse: CachedEntity<LoginResponse>
    var cachedOrder: CachedEntity<Order>
    var cachedShippingMethodWrapper: CachedEntity<OrderShippingMethodWrapperArray>

    init(appId: Int64, createDir: Bool = false) {
        self.appId = appId
        let channelIDStoreDirectory = Self.ChannelStoreDirectory.childDirectory(name: String(appId))
        self.channelIDStoreDirectory = channelIDStoreDirectory
        self.cachedLoginResponse = .init(appId: appId, cacheFileName: .loginResponse)
        self.cachedOrder = .init(appId: appId, cacheFileName: .lastOrder)
        self.cachedShippingMethodWrapper = .init(appId: appId, cacheFileName: .shippingMethodWrappersArray)
        if createDir {
            self.createDirectory()
        }
        Logger.debug("ChannelStore Directory: \(channelIDStoreDirectory.directoryPath)")
    }
    
    func reloadCacheEntities() {
        self.cachedLoginResponse.reloadCachedEntity()
        self.cachedOrder.reloadCachedEntity()
        self.cachedShippingMethodWrapper.reloadCachedEntity()
    }
    
    func pathExists() -> Bool {
        return self.channelIDStoreDirectory.pathExists()
    }
    
    func recreateDirectory() {
        if channelIDStoreDirectory.pathExists() {
            try? FileManager.default.removeItem(at: channelIDStoreDirectory.directoryURL)
            channelIDStoreDirectory.createDirectory(withIntermediateDirectories: true)
        } else {
            channelIDStoreDirectory.createDirectory(withIntermediateDirectories: true)
        }
    }
    
    func createDirectory() {
        if !channelIDStoreDirectory.pathExists() {
            channelIDStoreDirectory.createDirectory(withIntermediateDirectories: true)
        }
    }
    
    func deleteDirectory() {
        if channelIDStoreDirectory.pathExists() {
            try? FileManager.default.removeItem(at: channelIDStoreDirectory.directoryURL)
        }
    }

}
