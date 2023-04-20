//
//  IntPrice.swift
//  Checkout
//
//  Created by Alan Morford on 4/20/23.
//

import Foundation

struct IntPrice: PriceViewModel, Equatable {
    static var USDPriceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }()
    
    static func formatCurrency(_ amount: Int) -> String {
        return USDPriceFormatter.string(from: NSNumber(value: amount/100)) ?? ""
    }
    
    let price: Int
    init(price: Int) {
        self.price = price
    }
    
    func priceText() -> String {
        return IntPrice.formatCurrency(price)
    }
}
