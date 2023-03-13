//
//  Sandbox.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import VioletPublicClientAPI

/// AppCreds captures the common properties necessary to call
/// a Violet API Endpoint with an AppID
/// TODO: Split out subtype for AppId and AppSecret as these are used together
struct AppCreds {
    let appID: Int64
    let apiSecret: String
    var token: String
    let username: String
    let password: String
    
    init(appID: Int64, apiSecret: String, token: String, username: String, password: String) {
        self.appID = appID
        self.apiSecret = apiSecret
        self.token = token
        self.username = username
        self.password = password
    }
    
    init(_ envVars: EnvVars) {
        self.init(appID: envVars.sandbox_app_id,
                  apiSecret: envVars.sandbox_app_secret,
                  token: "",
                  username: envVars.sandbox_app_username,
                  password: envVars.sandbox_app_password)
    }
    
    func loginBody() -> LoginRequest {
        return LoginRequest(username: self.username, password: self.password)
    }
    
    public mutating func setToken(_ newToken: String) {
        self.token = newToken
    }
    
    static func SandBoxTestCreds() -> AppCreds {
        return AppCreds(EnvVars())
    }
    
    static func SandBoxTestCreds_Alan() -> AppCreds {
        return AppCreds(EnvVars.Alan())
    }
}
