//
//  DemoUsernameAndPassword.swift
//  Checkout
//
//  Created by Alan Morford on 4/23/23.
//

import Foundation

struct DemoUsernameAndPassword: UsernameAndPassword {
    let username: String
    let password: String

    init(username: String, password: String) {
        self.username = username
        self.password = password
    }

    static func byDemoChannel(_ demoChannel: DemoChannels) -> DemoUsernameAndPassword {
        switch demoChannel {
        case .Alan:
            return DemoUsernameAndPassword(username: ProcessInfo.processInfo.environment["sandbox_app_username_alan"]!,
                                           password: ProcessInfo.processInfo.environment["sandbox_app_password_alan"]!)
        case .Ishan:
            return DemoUsernameAndPassword(username: ProcessInfo.processInfo.environment["sandbox_app_username_ishan"]!,
                                           password: ProcessInfo.processInfo.environment["sandbox_app_password_ishan"]!)
        }
    }
}
