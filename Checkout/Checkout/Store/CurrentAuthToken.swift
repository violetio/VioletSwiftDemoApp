//
//  CurrentAuthToken.swift
//  Checkout
//
//  Created by Alan Morford on 4/26/23.
//

import Foundation
import Violet

struct CurrentAuthToken {
    let authToken: String
    let refreshToken: String
    
    var shortAuthToken: String {
        return authToken.prefix(9).description
    }
    
    var shortRefreshToken: String {
        return refreshToken.prefix(9).description
    }
    
    init(authToken: String, refreshToken: String) {
        self.authToken = authToken
        self.refreshToken = refreshToken
    }
    
    static func fromLoginResponse(_ input: LoginResponse?) -> CurrentAuthToken? {
        guard let loginResponse = input, let authToken = loginResponse.token, let refreshToken = loginResponse.refreshToken else {
            return nil
        }
        return CurrentAuthToken(authToken: authToken, refreshToken: refreshToken)
    }
    
    func replaceAuthToken(authToken: String) -> CurrentAuthToken{
        return CurrentAuthToken(authToken: authToken, refreshToken: self.refreshToken)
    }
}
