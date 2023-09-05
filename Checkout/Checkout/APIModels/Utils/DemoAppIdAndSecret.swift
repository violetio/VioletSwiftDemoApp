//
//  DemoAppIdAndSecret.swift
//  Checkout
//
//  Created on 4/23/23.
//

import Foundation

struct DemoAppIdAndSecret: AppIDAndSecret {
    let appID: Int64
    let apiSecret: String
    
    init(appID: Int64, apiSecret: String) {
        self.appID = appID
        self.apiSecret = apiSecret
    }
    
    static func byDemoChannel(_ demoChannel: DemoChannels) -> DemoAppIdAndSecret {
        switch demoChannel {
        case .Alan:
            return DemoAppIdAndSecret(appID: Int64(ProcessInfo.processInfo.environment["sandbox_app_id_alan"]!)!,
                                      apiSecret: ProcessInfo.processInfo.environment["sandbox_app_secret_alan"]!)
        case .Ishan:
            return DemoAppIdAndSecret(appID: Int64(ProcessInfo.processInfo.environment["sandbox_app_id"]!)!,
                                      apiSecret: ProcessInfo.processInfo.environment["sandbox_app_secret"]!)
        }
    }
    
}

