//
//  APICallRunner.swift
//  Checkout
//
//  Created by Alan Morford on 4/26/23.
//

import Combine
import Foundation
import SwiftUI
import VioletPublicClientAPI

class APICallService {
    @Published var currentLoginResponse: LoginResponse? = nil
    @Published var lastPageOffer: PageOffer? = nil
    @Published var lastRefreshTokenResponse: RefreshTokenResponse? = nil
    private var cancellables = Set<AnyCancellable>()
    private var pendingPageOffersRequest2: Any?
    private var pendingAPICalls = Set<AnyHashable>()
    private var pendingNoOverlap = Set<PendingNoOverlap>()
    
    init() {}
    
    func sendLoginPost(appCreds: AppCreds) {
        let pending = PendingNoOverlap.login
        guard !pendingNoOverlap.contains(pending) else {
            Logger.debug("sendLoginPost Overlap Prevented")
            return
        }

        pendingNoOverlap.insert(pending)
        let apiCall = APICall(apiCall: LoginPostRequest(appCreds: appCreds))
        var newLoginResponse: LoginResponse?
        _ = pendingAPICalls.insert(apiCall)
        apiCall.send { [weak self] data, error in
            guard let self = self else { return }
            if let loginResponse = data {
                newLoginResponse = loginResponse
            } else if let gotError = error {
                Logger.error(gotError)
            }
            self.currentLoginResponse = newLoginResponse
            self.pendingAPICalls.remove(apiCall)
            self.pendingNoOverlap.remove(pending)
        }
    }
    
    func sendCreateCart(channelHeaders: ChannelHeaders, skus: [OrderSku]? = nil) {
        let pending = PendingNoOverlap.createCart
        guard !pendingNoOverlap.contains(pending) else {
            Logger.debug("sendGetPageOffers Overlap Prevented")
            return
        }
        
        pendingNoOverlap.insert(pending)
    }
    
    func sendGetPageOffers(channelHeaders: ChannelHeaders, merchantId: Int64) {
        let pending = PendingNoOverlap.pageOffers
        guard !pendingNoOverlap.contains(pending) else {
            Logger.debug("sendGetPageOffers Overlap Prevented")
            return
        }
        
        pendingNoOverlap.insert(pending)
        let apiCall = APICall(apiCall: GetPageOffersByMerchantIDRequest(channelHeaders: channelHeaders, merchantId: merchantId))
        var newPageOffers: PageOffer?
        _ = pendingAPICalls.insert(apiCall)
        apiCall.send { [weak self] data, error in
            guard let self = self else { return }
            if let returnedPageOffer = data {
                newPageOffers = returnedPageOffer
            } else if let gotError = error {
                Logger.error(gotError)
            }
            self.lastPageOffer = newPageOffers
            self.pendingAPICalls.remove(apiCall)
            self.pendingNoOverlap.remove(pending)
        }
    }
    
    func sendRefreshToken(appIDAndSecret: AppIDAndSecret, refreshToken: String) {
        Logger.debug("sendRefreshToken")
        let pending = PendingNoOverlap.refreshToken
        guard !pendingNoOverlap.contains(pending) else {
            Logger.debug("sendGetPageOffers Overlap Prevented")
            return
        }
        
        pendingNoOverlap.insert(pending)
        let apiCall = APICall(apiCall: AuthTokenGet(appIDAndSecret: appIDAndSecret, refreshToken: refreshToken))
        var newRefreshTokenResponse: RefreshTokenResponse?
        _ = pendingAPICalls.insert(apiCall)
        apiCall.send { [weak self] data, error in
            guard let self = self else { return }
            if let returnedRefreshTokenResponse = data {
                newRefreshTokenResponse = returnedRefreshTokenResponse
            } else if let gotError = error {
                Logger.error(gotError)
            }
            self.lastRefreshTokenResponse = newRefreshTokenResponse
            self.pendingAPICalls.remove(apiCall)
            self.pendingNoOverlap.remove(pending)
        }
        
        
    }
    
    static var CallCounter: Int = 0
    static func NextCallCount() -> Int {
        CallCounter += 1
        return CallCounter
    }
    
    class APICall<T, DataResponseType: Codable>: Hashable where T: DataResponseAPICall<DataResponseType> {
        static func == (lhs: APICallService.APICall<T, DataResponseType>, rhs: APICallService.APICall<T, DataResponseType>) -> Bool {
            return lhs.callCount == rhs.callCount
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(callCount)
        }
        
        let dataResponseAPICall: T
        let callCount: Int = NextCallCount()
        init(apiCall: T) {
            self.dataResponseAPICall = apiCall
        }
        
        func send(receiveResponse: @escaping T.SinkResponse) {
            dataResponseAPICall.sinkResponse(receiveResponse: receiveResponse)
            dataResponseAPICall.send()
        }
    }
    
    enum PendingNoOverlap: CaseIterable {
        case login
        case refreshToken
        case pageOffers
        case createCart
    }
}
