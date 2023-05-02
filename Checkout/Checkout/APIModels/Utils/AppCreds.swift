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
struct AppCreds: AppIDAndSecret {
    var appID: Int64 { appIDAndSecret.appID }
    var apiSecret: String { appIDAndSecret.apiSecret }
    let appIDAndSecret: AppIDAndSecret
    let username: String
    let password: String
    
    init(appID: Int64, apiSecret: String, username: String, password: String) {
        self.appIDAndSecret = DemoAppIdAndSecret(appID: appID, apiSecret: apiSecret)
        self.username = username
        self.password = password
        self.log()
    }
    
    init(_ envVars: EnvVars = EnvVars.Alan()) {
        self.init(appID: envVars.sandbox_app_id,
                  apiSecret: envVars.sandbox_app_secret,
                  username: envVars.sandbox_app_username,
                  password: envVars.sandbox_app_password)
    }
    
    func log() {
        Logger.info("AppCreds: \(self)")
    }
    
    func loginBody() -> LoginRequest {
        return LoginRequest(username: self.username, password: self.password)
    }
    
    static func SandBoxTestCreds() -> AppCreds {
        return AppCreds(EnvVars())
    }
    
    static func SandBoxTestCreds_Alan() -> AppCreds {
        return AppCreds(EnvVars.Alan())
    }
    
    static func SandBoxTestCreds(_ demoChannel: DemoChannels) -> AppCreds {
        switch demoChannel {
        case .Alan:
            return AppCreds(EnvVars.Alan())
        case .Ishan:
            return AppCreds(EnvVars())
        }
        
    }
    
    func channelHeaders(token: String) -> ChannelHeaders {
        return ChannelHeaders(token: token, apiSecret: self.apiSecret, appID: self.appID)
    }
}
