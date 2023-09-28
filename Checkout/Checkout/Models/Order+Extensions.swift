//
//  Order+Extensions.swift
//  Checkout
//
//  Created on 5/1/23.
//

import Violet
import Foundation

public extension Order {
    
    var cartCurrency: String {
        self.currency ?? "USD"
    }
    
    var cartSubTotalText: String {
        return currencyString(amount: subTotal)
    }
    
    var cartTaxTotalText: String {
        return currencyString(amount: taxTotal)
    }
    
    var cartShippingTotalText: String {
        return currencyString(amount: shippingTotal)
    }
    
    var cartFullTotalText: String {
        return currencyString(amount: total)
    }
    
    func currencyString(amount: Int? = nil) -> String {
        return (Double(amount ?? 0) / 100).formatted(.currency(code: cartCurrency))
    }
    
    
}
