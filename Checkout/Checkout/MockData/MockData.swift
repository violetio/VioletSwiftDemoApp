//
//  MockData.swift
//  Checkout
//
//  Created by Alan Morford on 3/16/23.
//

import Foundation
import SwiftCSV

class MockData {
    static func loadData() -> CSV<Named>? {
        guard let fileUrl = Bundle.main.url(forResource: "Sandbox_Offers_MerchantID_10000", withExtension: "csv") else {
            return nil
        }

        return try? CSV<Named>(url: fileUrl,
                              delimiter: .comma,
                              encoding: String.Encoding.utf8,
                              loadColumns: true)
    }
}
