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
    private var internalLoginPost: LoginPostRequest? = nil
    private var cancellables = Set<AnyCancellable>()
    
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
    
}
