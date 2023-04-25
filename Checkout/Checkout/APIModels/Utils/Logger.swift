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
public class Logger {
    
    public enum LogLevel {
        case info
        case error
        case debug
    }
    
    public func log(_ message: String, logLevel: LogLevel = .info) {
        print("\(logLevel): \(message)")
    }
    
    public func info(_ message: String) {
        log(message,logLevel: .info)
    }
    
    public func error(_ message: String) {
        log(message,logLevel: .error)
    }
    
    public static func log(_ message: String, logLevel: LogLevel = .info) {
        print("\(logLevel): \(message)")
    }

    public static func info(_ message: String) {
        log(message,logLevel: .info)
    }

    public static func error(_ message: String) {
        log(message,logLevel: .error)
    }
    
    public static func error(_ error: Error) {
        log(error.localizedDescription, logLevel: .error)
    }
    
    public static func debug(_ message: String) {
        log(message,logLevel: .debug)
    }
}
