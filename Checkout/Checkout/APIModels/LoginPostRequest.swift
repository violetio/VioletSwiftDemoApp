//
//  LoginPostRequest.swift
//  Checkout
//
//  Created on 3/14/23.
//

import SwiftUI
import Violet

class LoginPostRequest: DataResponseAPICall<LoginResponse> {

    let loginInputs: LoginInputsType
    
    init(loginInputs: LoginInputsType) {
        self.loginInputs = loginInputs
    }

    override func send() {
        /*
        AccessAPI.loginPost(xVioletAppSecret: loginInputs.apiSecret,
                            xVioletAppId: loginInputs.appID,
                            body: loginInputs.loginBody()) { [weak self] (response, error) in
            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: response)
        }
         */
    }
}
