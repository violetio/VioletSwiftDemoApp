//
//  PriceViewModel.swift
//  Checkout
//
//  Created on 4/20/23.
//

import Foundation

protocol PriceViewModel {
    var price: Int { get }
    
    func priceText() -> String
}
