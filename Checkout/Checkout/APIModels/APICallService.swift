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
    private var internalLoginPost: LoginPostRequest? = nil
    private var cancellables = Set<AnyCancellable>()
    private var pendingPageOffersRequest: GetPageOffersByMerchantIDRequest? = nil
    private var pendingPageOffersRequest2: Any? = nil
    
    init() {
    }
    
    func sendLoginPost(appCreds: AppCreds) {
        guard self.internalLoginPost == nil else {
            Logger.debug("sendLoginPost Already Running!! Returning not overlapping call!")
            return
        }
        let loginPost = LoginPostRequest(appCreds: appCreds)
        var newLoginResponse: LoginResponse? = nil
        self.internalLoginPost = loginPost
        loginPost.$callCompleted.sink { [weak self] completed in
            guard let weakSelf = self else {
                return
            }
            if completed {
                if let loginResponse = weakSelf.internalLoginPost?.dataResponse {
                    newLoginResponse = loginResponse
                    Logger.info("Received loginResponse with token: \(loginResponse.token!)")
                }
                weakSelf.internalLoginPost = nil
                weakSelf.currentLoginResponse = newLoginResponse
            }
        }.store(in: &cancellables)
        loginPost.send()
    }
    
    func sendCreateCart(channelHeaders: ChannelHeaders, skus: [OrderSku]? = nil) {
        //
    }
    
    func sendGetPageOffers(channelHeaders: ChannelHeaders, merchantId: Int64) {
        guard self.pendingPageOffersRequest == nil else {
            Logger.debug("sendLoginPost Already Running!! Returning not overlapping call!")
            return
        }
        let apiCall = APICall(apiCall: GetPageOffersByMerchantIDRequest(channelHeaders: channelHeaders, merchantId: merchantId))
        var newPageOffers: PageOffer? = nil
        self.pendingPageOffersRequest2 = apiCall
        apiCall.send { [weak self]  data, error in
            guard let self = self else { return }
            if let returnedPageOffer = data {
                newPageOffers = returnedPageOffer
            } else if let gotError = error {
                Logger.error(gotError)
            }
            self.pendingPageOffersRequest2 = nil
            self.lastPageOffer = newPageOffers
        }
    }
    
    class APICall<T, DataResponseType: Codable> where T: DataResponseAPICall<DataResponseType> {
        let dataResponseAPICall: T
        init(apiCall: T) {
            self.dataResponseAPICall = apiCall
        }
        
        func send(receiveResponse: @escaping T.SinkResponse) {
            dataResponseAPICall.sinkResponse(receiveResponse: receiveResponse)
            dataResponseAPICall.send()
        }
    }
    
}
