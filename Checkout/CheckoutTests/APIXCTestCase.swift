//
//  APIXCTestCase.swift
//  CheckoutTests
//
//  Created on 3/20/23.
//

@testable import Checkout
import Combine
import SwiftUI
import Violet
import XCTest

class APIXCTestCase: XCTestCase {
    
    let timeout: TimeInterval = 5
    let pageTimeout: TimeInterval = 15
    
    let timeout_5s: TimeInterval = 5
    let timeout_10s: TimeInterval = 10
    let timeout_15s: TimeInterval = 15


    func persistData(fileName: String, data: Data) throws {
        let cachesDir = FileDirectory.CachesFileDirectory()
        let targetWritePath = FilePath(fileName: fileName, fileDirectory: cachesDir)!

        try data.write(to: targetWritePath.fileURL, options: .noFileProtection)
        Logger.debug("Wrote Caches file: \(targetWritePath.fileURL)")
    }

    func reloadData(fileName: String) -> Data? {
        let cachesDir = FileDirectory.CachesFileDirectory()
        let filePath = FilePath(fileName: fileName, fileDirectory: cachesDir)!
        return try? Data(contentsOf: filePath.fileURL)
    }
    
    func persistEncodable<T>(_ encodable: T, to filename: String) where T: Encodable {
        let jsonData = CodableHelper.encode(encodable)
        switch jsonData {
        case .success(let dataToWrite):
            try! self.persistData(fileName: filename, data: dataToWrite)
        case .failure:
            XCTFail()
        }
    }
}
