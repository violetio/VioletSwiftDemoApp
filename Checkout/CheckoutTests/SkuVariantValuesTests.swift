//
//  SkuVariantValuesTests.swift
//  CheckoutTests
//
//  Created on 8/20/23
//

import XCTest
@testable import Checkout

final class SkuVariantValuesTests: XCTestCase {


    func test_Init() throws {
        let offer_id_12555 = MockOffers.load_Offer_12555()!
        let skuSet = offer_id_12555.skus!
        let firstSku = skuSet.first!
        let sut = SkuVariantValues(sku: firstSku)
        
    }

}
