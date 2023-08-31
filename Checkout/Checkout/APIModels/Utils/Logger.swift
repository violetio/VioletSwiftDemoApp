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
    
    public static func log(_ message: String, logLevel: LogLevel = .info, file: String = #file, line: Int = #line) {
        let lastFilePathComponent = file.split(separator: "/").last ?? "?"
        print("[\(logLevel)]: \(lastFilePathComponent):\(line) - \(message)")
    }
    

    public static func info(_ message: String, file: String = #file, line: Int = #line) {
        log(message,logLevel: .info, file: file, line: line)
    }

    public static func error(_ message: String, file: String = #file, line: Int = #line) {
        log(message,logLevel: .error, file: file, line: line)
    }
    
    public static func error(_ error: Error?, file: String = #file, line: Int = #line) {
        if let anError = error {
            log(anError.localizedDescription, logLevel: .error, file: file, line: line)
        }
    }
    
    public static func error(_ error: Error, file: String = #file, line: Int = #line) {
        log(error.localizedDescription, logLevel: .error, file: file, line: line)
    }
    
    public static func debug(_ message: String, file: String = #file, line: Int = #line) {
        log(message,logLevel: .debug, file: file, line: line)
    }
}
