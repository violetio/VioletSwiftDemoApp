//
//  TestBundleFileTestCase.swift
//  CheckoutTests
//
//  Created on 3/24/23.
//

import Violet
import XCTest

class TestBundleFileTestCase: XCTestCase {
    var testBundle: Bundle!
    
    override func setUpWithError() throws {
        testBundle = Bundle(for: type(of: self))
    }
    
    func data(forResource name: String?, withExtension ext: String?) -> Data? {
        let file: URL! = testBundle.url(forResource: name, withExtension: ext)
        return try! Data(contentsOf: file)
    }
    
    func decode<T>(_ type: T.Type, from data: Data) -> T? where T: Decodable {
        let decodedResult = CodableHelper.decode(type, from: data)
        switch decodedResult {
        case .failure:
            return nil
        case .success(let blob):
            return blob
        }
    }
    
    func decode<T>(_ type: T.Type, forResource name: String?, withExtension ext: String?) -> T? where T: Decodable {
        guard let jsonData = data(forResource: name, withExtension: ext) else {
            return nil
        }
        return decode(type, from: jsonData)
    }
    
    func decodeJson<T>(_ type: T.Type, forResource name: String?) -> T? where T: Decodable {
        guard let jsonData = data(forResource: name, withExtension: "json") else {
            return nil
        }
        return decode(type, from: jsonData)
    }
    
    static func data(forResource name: String?, withExtension ext: String?) -> Data? {
        let testBundle = Bundle(for: TestBundleFileTestCase.classForCoder())
        guard let file: URL = testBundle.url(forResource: name, withExtension: ext) else {
            return nil
        }
        return try! Data(contentsOf: file)
    }

    static func decode<T>(_ type: T.Type, from data: Data) -> T? where T: Decodable {
        let decodedResult = CodableHelper.decode(type, from: data)
        switch decodedResult {
        case .failure:
            return nil
        case .success(let blob):
            return blob
        }
    }

    static func decodeJson<T>(_ type: T.Type, forResource name: String?) -> T? where T: Decodable {
        guard let jsonData = data(forResource: name, withExtension: "json") else {
            return nil
        }
        return decode(type, from: jsonData)
    }
}
