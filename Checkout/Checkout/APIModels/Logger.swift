//
//  Logger.swift
//  Checkout
//
//  Created by Alan Morford on 3/13/23.
//

import Foundation

/**
    Instead using print statements, abstracting a Logger type
    that can redirected to an actual Remote Logging solution in the future.
 */
class Logger {
    
    enum LogLevel {
        case info
        case error
        case debug
    }
    
    func log(_ message: String, logLevel: LogLevel = .info) {
        print("\(logLevel): \(message)")
    }
    
    func info(_ message: String) {
        log(message,logLevel: .info)
    }
    
    func error(_ message: String) {
        log(message,logLevel: .error)
    }
    
    static func log(_ message: String, logLevel: LogLevel = .info) {
        print("\(logLevel): \(message)")
    }

    static func info(_ message: String) {
        log(message,logLevel: .info)
    }

    static func error(_ message: String) {
        log(message,logLevel: .error)
    }
    
    static func debug(_ message: String) {
        log(message,logLevel: .debug)
    }
}