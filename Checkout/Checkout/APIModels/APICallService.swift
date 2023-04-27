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
    
    func sendGetPageOffers(channelHeaders: ChannelHeaders, merchantId: Int64) {
        guard self.pendingPageOffersRequest == nil else {
            Logger.debug("sendLoginPost Already Running!! Returning not overlapping call!")
            return
        }
        let apiCall = GetPageOffersByMerchantIDRequest(channelHeaders: channelHeaders, merchantId: merchantId)
        var newPageOffers: PageOffer? = nil
        self.pendingPageOffersRequest = apiCall
        apiCall.$callCompleted.sink { [weak self] completed in
            Logger.info("sendGetPageOffers -  2 - sink \(completed)")
            guard let weakSelf = self else {
                return
            }
            if completed {
                if let returnedPageOffer = weakSelf.pendingPageOffersRequest?.dataResponse {
                    newPageOffers = returnedPageOffer
                    Logger.info("Received PageOffers with Offers Count: \(returnedPageOffer.content?.count)")
                }
                weakSelf.pendingPageOffersRequest = nil
                weakSelf.lastPageOffer = newPageOffers
            }
        }.store(in: &cancellables)
        Logger.info("sendGetPageOffers -  1 - Sending Get Page Offers")
        apiCall.send()
    }
    
}
