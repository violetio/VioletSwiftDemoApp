//
//  LoginPostRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/14/23.
//

import SwiftUI
import VioletPublicClientAPI

class LoginPostRequest: ObservableObject {
        
    let appCreds: AppCreds
    
    var dataResponse: LoginResponse? = nil
    var errorResponse: ErrorResponse? = nil
    @Published var callCompleted = false
    
    init(appCreds: AppCreds) {
        self.appCreds = appCreds
    }
    
    func send() {
        AccessAPI.loginPost(xVioletAppSecret: appCreds.apiSecret,
                            xVioletAppId: appCreds.appID,
                            body: appCreds.loginBody()) { [weak self] (response, error) in
            guard let weakSelf = self else {
                return
            }
            Logger.info("response?.token: \(response?.token)")
            Logger.info("response?.refreshToken: \(response?.refreshToken)")
            Logger.error("\(error.debugDescription)")
            weakSelf.dataResponse = response
            weakSelf.errorResponse = error
            weakSelf.callCompleted = true
            
        }
    }
}
