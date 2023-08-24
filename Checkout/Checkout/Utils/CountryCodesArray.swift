//
//  CountryCodesArray.swift
//  Checkout
//
//  Created on 8/24/23
//

import Foundation

struct CountryCodesArray {
    static func loadJson() -> [String] {
        guard let path = Bundle.main.path(forResource: "country_codes", ofType: ".json") else {
            return []
        }
        //Logger.debug("Path: \(path)")
        let stringArray = try? JSONSerialization.jsonObject(with: Data(contentsOf: URL(filePath: path)), options: JSONSerialization.ReadingOptions()) as? [String]
        return stringArray ?? []
    }

}
