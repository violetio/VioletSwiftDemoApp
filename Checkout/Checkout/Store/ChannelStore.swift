//
//  ChannelStore.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import Foundation
import VioletPublicClientAPI

class ChannelStore {
    
    static let ChannelStoreDirectory: FileDirectory = {
        let channelStoreDirectory = FileDirectory.CachesFileDirectory().childDirectory(name: "ChannelStore")
        channelStoreDirectory.createDirectory()
        return channelStoreDirectory
    }()
    
    let appId: Int64
    let channelIDStoreDirectory: FileDirectory
    init(appId: Int64) {
        self.appId = appId
        let channelIDStoreDirectory = Self.ChannelStoreDirectory.childDirectory(name: String(appId))
        channelIDStoreDirectory.createDirectory()
        self.channelIDStoreDirectory = channelIDStoreDirectory
    }
    
    func pathExists() -> Bool {
        return self.channelIDStoreDirectory.pathExists()
    }

}
