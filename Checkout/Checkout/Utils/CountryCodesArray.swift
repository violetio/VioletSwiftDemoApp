//
//  CountryCodesArray.swift
//  Checkout
//
//  Created on 8/24/23
//

import Foundation

struct CountryCodesArray {
    static func loadJson() -> [String] {
        guard let path = Bundle.main.path(forResource: "country_codes", ofType: "json") else {
            return []
        }
        let stringArray = try? JSONSerialization.jsonObject(with: Data(contentsOf: URL(filePath: path)), options: JSONSerialization.ReadingOptions()) as? [String]
        return stringArray ?? []
    }

}

struct InitJson {
    typealias JsonDict = [String: Any]
    static let initData: JsonDict = InitJson.loadJson()
    
    static let resumeCartId: Int? = initData["resumeCartId"] as? Int
    static let apiBasePath: String? = initData["basePath"] as? String
    
    static func loadJson() -> [String: Any] {
        guard let path = Bundle.main.path(forResource: "init", ofType: "json") else {
            return [:]
        }
        let jsonDict = try? JSONSerialization.jsonObject(with: Data(contentsOf: URL(filePath: path)), options: JSONSerialization.ReadingOptions()) as? JsonDict

//        Logger.debug("stringDict: \(String(describing: jsonDict))")
        return jsonDict ?? [:]
    }
    
}
