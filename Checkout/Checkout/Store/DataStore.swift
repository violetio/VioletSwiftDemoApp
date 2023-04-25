//
//  DataStore.swift
//  Checkout
//
//  Created by Alan Morford on 4/23/23.
//

import VioletPublicClientAPI
import SwiftUI
import Combine

class DataStore: ObservableObject {
    
    static let shared: DataStore = DataStore(activeAppId: DemoAppIdAndSecret.byDemoChannel(DemoChannels.defaultDemoChannel).appID)
    
    @Published var activeAppId: Int64?
    @Published var loadedChannelStore: ChannelStore?
    
    init(activeAppId: Int64? = nil) {
        self.activeAppId = activeAppId
        if let notNil = activeAppId {
            loadChannelStore(appId: notNil)
        }
    }
    
    func changeAppId(_ newAppId: Int64?) {
        self.activeAppId = newAppId
        Logger.info("Changed AppId: \(String(reflecting: newAppId))")
        if let notNil = newAppId {
            loadChannelStore(appId: notNil)
        }
    }
    
    func loadChannelStore(appId: Int64) {
        self.loadedChannelStore = ChannelStore(appId: appId)
    }

}
