//
//  EnvVars.swift
//  Checkout
//
//  Created by Alan Morford on 3/10/23.
//

import Foundation

struct EnvVars {
    let sandbox_app_secret: String
    let sandbox_app_id: Int64
    let sandbox_app_username: String
    let sandbox_app_password: String

    init(sandbox_app_secret: String, sandbox_app_id: Int64, sandbox_app_username: String, sandbox_app_password: String) {
        self.sandbox_app_secret = sandbox_app_secret
        self.sandbox_app_id = sandbox_app_id
        self.sandbox_app_username = sandbox_app_username
        self.sandbox_app_password = sandbox_app_password
    }
    
    init() {
        self.init(sandbox_app_secret: ProcessInfo.processInfo.environment["sandbox_app_secret"]!,
                  sandbox_app_id: Int64(ProcessInfo.processInfo.environment["sandbox_app_id"]!)!,
                  sandbox_app_username: ProcessInfo.processInfo.environment["sandbox_app_username"]!,
                  sandbox_app_password: ProcessInfo.processInfo.environment["sandbox_app_password"]!)
    }

    
    static func Alan() -> EnvVars {
        return EnvVars(sandbox_app_secret: ProcessInfo.processInfo.environment["sandbox_app_secret_alan"]!,
                       sandbox_app_id: Int64(ProcessInfo.processInfo.environment["sandbox_app_id_alan"]!)!,
                       sandbox_app_username: ProcessInfo.processInfo.environment["sandbox_app_username_alan"]!,
                       sandbox_app_password: ProcessInfo.processInfo.environment["sandbox_app_password_alan"]!)
    }
    
    static func Ishan() -> EnvVars {
        return EnvVars(sandbox_app_secret: ProcessInfo.processInfo.environment["sandbox_app_secret_ishan"]!,
                       sandbox_app_id: Int64(ProcessInfo.processInfo.environment["sandbox_app_id_ishan"]!)!,
                       sandbox_app_username: ProcessInfo.processInfo.environment["sandbox_app_username_ishan"]!,
                       sandbox_app_password: ProcessInfo.processInfo.environment["sandbox_app_password_ishan"]!)
    }

}
