//
//  APICallRunner.swift
//  Checkout
//
//  Created by Alan Morford on 4/26/23.
//

import SwiftUI
import Combine
import Foundation
import VioletPublicClientAPI

class APICallService {
    
    @Published var currentLoginResponse: LoginResponse? = nil
    @Published var lastPageOffer: PageOffer? = nil
    private var cancellables = Set<AnyCancellable>()
    private var pendingPageOffersRequest2: Any? = nil
    private var pendingAPICalls = Set<AnyHashable>()
    private var pendingNoOverlap = Set<PendingNoOverlap>()
    
    init() {
    }
    
//    func sendLoginPost(appCreds: AppCreds) {
//        guard self.internalLoginPost == nil else {
//            Logger.debug("sendLoginPost Already Running!! Returning not overlapping call!")
//            return
//        }
//        let loginPost = LoginPostRequest(appCreds: appCreds)
//        var newLoginResponse: LoginResponse? = nil
//        self.internalLoginPost = loginPost
//        loginPost.$callCompleted.sink { [weak self] completed in
//            guard let weakSelf = self else {
//                return
//            }
//            if completed {
//                if let loginResponse = weakSelf.internalLoginPost?.dataResponse {
//                    newLoginResponse = loginResponse
//                    Logger.info("Received loginResponse with token: \(loginResponse.token!)")
//                }
//                weakSelf.internalLoginPost = nil
//                weakSelf.currentLoginResponse = newLoginResponse
//            }
//        }.store(in: &cancellables)
//        loginPost.send()
//    }
    
    func sendLoginPost(appCreds: AppCreds) {
        let pending = PendingNoOverlap.login
        guard !pendingNoOverlap.contains(pending) else {
            Logger.debug("sendLoginPost Overlap Prevented")
            return
        }

        pendingNoOverlap.insert(pending)
        let apiCall = APICall(apiCall: LoginPostRequest(appCreds: appCreds))
        var newLoginResponse: LoginResponse? = nil
        _=pendingAPICalls.insert(apiCall)
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
        //
    }
    
    func sendGetPageOffers(channelHeaders: ChannelHeaders, merchantId: Int64) {
        let pending = PendingNoOverlap.pageOffers
        guard !pendingNoOverlap.contains(pending) else {
            Logger.debug("sendGetPageOffers Overlap Prevented")
            return
        }
        
        pendingNoOverlap.insert(pending)
        let apiCall = APICall(apiCall: GetPageOffersByMerchantIDRequest(channelHeaders: channelHeaders, merchantId: merchantId))
        var newPageOffers: PageOffer? = nil
        _=pendingAPICalls.insert(apiCall)
        Logger.debug("Start - pendingAPICalls.count: \(pendingAPICalls.count)")
        apiCall.send { [weak self]  data, error in
            guard let self = self else { return }
            if let returnedPageOffer = data {
                newPageOffers = returnedPageOffer
            } else if let gotError = error {
                Logger.error(gotError)
            }
            self.lastPageOffer = newPageOffers
            self.pendingAPICalls.remove(apiCall)
            self.pendingNoOverlap.remove(pending)
            Logger.debug("End - pendingAPICalls.count: \(self.pendingAPICalls.count)")
        }
    }
    
    static var CallCounter: Int = 0
    static func NextCallCount() -> Int {
        CallCounter+=1
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
        case pageOffers
    }
    
}
