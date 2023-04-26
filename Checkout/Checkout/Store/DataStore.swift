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

    static let shared: DataStore = DataStore()
    
    @Published var activeAppId: Int64?
    @Published var activeAppIDAndSecret: AppIDAndSecret?
    @Published var loadedChannelStore: ChannelStore?
    @Published var currentAuthToken: CurrentAuthToken?
    @Published var channelHeaders: ChannelHeaders?
    @Published var loadedOfferItems: [OfferItem]?
    
    let apiCallService = APICallService()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        self.startUp()
    }
    
    func startUp() {
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
    
    func changeAppId(activeAppIDAndSecret: AppIDAndSecret?) {
        if let newAppId = activeAppIDAndSecret?.appID,
           newAppId == self.activeAppId {
            clearChannelStore()
        } else {
            clearChannelStore()
        }
        self.activeAppId = activeAppIDAndSecret?.appID
        self.activeAppIDAndSecret = activeAppIDAndSecret
        Logger.info("Changed AppId: \(String(reflecting: activeAppIDAndSecret?.appID))")
        if let notNil = activeAppIDAndSecret?.appID {
            loadChannelStore(appId: notNil)
        }
    }
    
    func clearChannelStore() {
        self.activeAppId = nil
        self.activeAppIDAndSecret = nil
        self.loadedChannelStore = nil
        self.currentAuthToken = nil
        self.channelHeaders = nil
        self.loadedOfferItems = nil
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
