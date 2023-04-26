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
    
//    static let shared: DataStore = DataStore(activeAppId: DemoAppIdAndSecret.byDemoChannel(DemoChannels.defaultDemoChannel).appID)
    static let shared: DataStore = DataStore()
    
    @Published var activeAppId: Int64?
    @Published var loadedChannelStore: ChannelStore?
    @Published var currentAuthToken: CurrentAuthToken?
    let apiCallService = APICallService()
    var cancellables = Set<AnyCancellable>()
    
    init(activeAppId: Int64? = nil) {
        self.activeAppId = activeAppId
        self.startUp()
    }
    
    func startUp() {
//        if let notNil = activeAppId {
//            loadChannelStore(appId: notNil)
//        }
        apiCallService.$currentLoginResponse.sink { completion in
            switch completion {
            case .finished:
                Logger.info("apiCallService.$currentLoginResponse.sink: .finished")
            case .failure(let error):
                Logger.error("apiCallService.$currentLoginResponse.sink: .error")
                Logger.error(error)
            }
        } receiveValue: { [weak self] returnedValue in
            guard let weakSelf = self else { return }
            if let foundLoginResponse = returnedValue {
                Logger.debug("Caching new LoginResponse")
                try? weakSelf.loadedChannelStore?.cachedLoginResponse.set(foundLoginResponse)
            }
            weakSelf.currentAuthToken = CurrentAuthToken.fromLoginResponse(returnedValue)
        }.store(in: &cancellables)

    }
    
    func changeAppId(_ newAppId: Int64?) {
        self.activeAppId = newAppId
        Logger.info("Changed AppId: \(String(reflecting: newAppId))")
        if let notNil = newAppId {
            loadChannelStore(appId: notNil)
        }
    }
    
    func loadChannelStore(appId: Int64) {
        Logger.debug("DataStore.loadChannelStore appId: \(String(appId))")
        let newChannelStore = ChannelStore(appId: appId)
        newChannelStore.reloadCacheEntities()
        
        Logger.debug("DataStore.loadChannelStore set newChannelStore")
        
        if let cached = newChannelStore.cachedLoginResponse.cachedEntity {
            Logger.debug("DataStore.loadChannelStore set currentAuthToken")
            self.currentAuthToken = CurrentAuthToken.fromLoginResponse(cached)
        } else {
            Logger.debug("DataStore.loadChannelStore MISSING currentAuthToken")
        }
        self.loadedChannelStore = newChannelStore
        
    }

}
