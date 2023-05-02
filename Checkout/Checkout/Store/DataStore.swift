//
//  DataStore.swift
//  Checkout
//
//  Created by Alan Morford on 4/23/23.
//

import Combine
import SwiftUI
import VioletPublicClientAPI

class DataStore: ObservableObject {
    static let shared: DataStore = .init()
    
    @Published var activeAppId: Int64?
    @Published var activeAppIDAndSecret: AppIDAndSecret?
    @Published var loadedChannelStore: ChannelStore?
    @Published var currentAuthToken: CurrentAuthToken?
    @Published var channelHeaders: ChannelHeaders?
    @Published var loadedOfferItems: [OfferItem] = []
    @Published var currentOrder: Order?
    @Published var currentPendingOrder: PendingOrder?
    
    let apiCallService = APICallService()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        self.startUp()
    }
    
    func startUp() {
        self.apiCallService.$currentLoginResponse.sink { completion in
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
        }.store(in: &self.cancellables)
        
        self.apiCallService.$lastPageOffer.sink { [weak self] returnedValue in
            guard let weakSelf = self else { return }
            if let offersContent = returnedValue?.content {
                weakSelf.loadedOfferItems = OfferItem.fromEntities(entities: offersContent)
                Logger.info("DataStore - Receive OfferItems = Count: \(weakSelf.loadedOfferItems.count)")
            } else {
                /*
                 if weakSelf.apiCallService.expiredToken == true {
                     Logger.info("DataStore - Expired Token")
                     if let refreshToken = weakSelf.currentAuthToken?.refreshToken {
                         Logger.info("DataStore - Auto Refresh Token")
                         weakSelf.apiCallService.sendRefreshToken(appIDAndSecret: weakSelf.activeAppIDAndSecret!, refreshToken: refreshToken)
                     }
                
                 }
                  */
            }
        }.store(in: &self.cancellables)
        
        self.apiCallService.$lastRefreshTokenResponse.sink { [weak self] returnedValue in
            guard let self = self else { return }
            if let newAuthToken = returnedValue?.token,
               let current = self.currentAuthToken
            {
                Logger.debug("Replacing currentAuthToken")
                self.currentAuthToken = current.replaceAuthToken(authToken: newAuthToken)
            }

        }.store(in: &self.cancellables)
        
        self.apiCallService.$currentOrder.sink { [weak self] returnedValue in
            guard let self = self else { return }
            self.currentOrder = returnedValue
            if let foundOrderResponse = returnedValue,
               let orderId = foundOrderResponse.id {
                let newPendingOrder = PendingOrder.fromOrder(foundOrderResponse)
                self.currentPendingOrder = newPendingOrder
                Logger.debug("Caching new Order ID: \(foundOrderResponse.id!)")
                try? self.loadedChannelStore?.cachedOrder.set(foundOrderResponse)
            }
            Logger.debug("Replacing currentOrder: \(returnedValue?.id)")
        }.store(in: &self.cancellables)
    }
    
    func doLogOut() {
        self.loadedChannelStore?.cachedLoginResponse.clearCachedEntity()
        self.clearChannelStore()
    }
    
    func changeAppId(activeAppIDAndSecret: AppIDAndSecret?) {
        if let newAppId = activeAppIDAndSecret?.appID,
           newAppId == self.activeAppId
        {
            self.clearChannelStore()
        } else {
            self.clearChannelStore()
        }
        self.activeAppId = activeAppIDAndSecret?.appID
        self.activeAppIDAndSecret = activeAppIDAndSecret
        // self.channelHeaders = activeAppIDAndSecret.
        Logger.info("Changed AppId: \(String(reflecting: activeAppIDAndSecret?.appID))")
        if let appIDAndSecret = activeAppIDAndSecret {
            self.loadChannelStore(activeAppIDAndSecret: appIDAndSecret)
        }
    }
    
    func clearChannelStore() {
        self.activeAppId = nil
        self.activeAppIDAndSecret = nil
        self.loadedChannelStore = nil
        self.currentAuthToken = nil
        self.channelHeaders = nil
        self.loadedOfferItems = []
    }
    
    func loadChannelStore(activeAppIDAndSecret: AppIDAndSecret) {
        Logger.debug("DataStore.loadChannelStore appId: \(String(activeAppIDAndSecret.appID))")
        let newChannelStore = ChannelStore(appId: activeAppIDAndSecret.appID)
        newChannelStore.reloadCacheEntities()
        
        Logger.debug("DataStore.loadChannelStore set newChannelStore")
        
        if let cached = newChannelStore.cachedLoginResponse.cachedEntity {
            Logger.debug("DataStore.loadChannelStore restored currentAuthToken")
            self.currentAuthToken = CurrentAuthToken.fromLoginResponse(cached)
            if let cachedAuthToken = cached.token {
                self.channelHeaders = ChannelHeaders(token: cachedAuthToken, appIdAndSecret: activeAppIDAndSecret)
                Logger.debug("DataStore.loadChannelStore restored channelHeaders")
            }
        } else {
            Logger.debug("DataStore.loadChannelStore MISSING currentAuthToken")
        }
        if let cachedOrder = newChannelStore.cachedOrder.cachedEntity {
            Logger.debug("DataStore.loadChannelStore restored Order ID: \(cachedOrder.id!)")
            self.currentOrder = cachedOrder
            if let orderId = cachedOrder.id {
                let newPendingOrder = PendingOrder.fromOrder(cachedOrder)
                self.currentPendingOrder = newPendingOrder
            }
        }
        self.loadedChannelStore = newChannelStore
    }
}
