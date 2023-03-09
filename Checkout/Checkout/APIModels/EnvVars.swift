//
//  EnvVars.swift
//  Checkout
//
//  Created by Alan Morford on 3/10/23.
//

import Foundation

struct EnvVars {
    let sandbox_app_secret = ProcessInfo.processInfo.environment["sandbox_app_secret"]!
    let sandbox_app_id = Int64(ProcessInfo.processInfo.environment["sandbox_app_id"]!)!
    let sandbox_app_username = ProcessInfo.processInfo.environment["sandbox_app_username"]!
    let sandbox_app_password = ProcessInfo.processInfo.environment["sandbox_app_password"]!
}
