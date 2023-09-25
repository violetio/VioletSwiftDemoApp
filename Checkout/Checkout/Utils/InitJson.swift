//
//  InitJson.swift
//  Checkout
//
//  Created on 9/25/23
//

import Foundation

struct InitJson {
    typealias JsonDict = [String: Any]
    static let initData: JsonDict = InitJson.loadJson()
    
    static let resumeCartId: Int? = initData["resumeCartId"] as? Int
    static let apiBasePath: String? = initData["basePath"] as? String
    static let loggerEnabled: Bool = initData["loggerEnabled"] as? Bool ?? false
    
    static func loadJson() -> [String: Any] {
        guard let path = Bundle.main.path(forResource: "init", ofType: "json") else {
            return [:]
        }
        let jsonDict = try? JSONSerialization.jsonObject(with: Data(contentsOf: URL(filePath: path)), options: JSONSerialization.ReadingOptions()) as? JsonDict

        return jsonDict ?? [:]
    }
    
}
