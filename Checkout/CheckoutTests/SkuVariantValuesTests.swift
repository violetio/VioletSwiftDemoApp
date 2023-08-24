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
        //let sut = SkuVariantValues(sku: firstSku)
        //SkuVariantValues.inspect(sku: firstSku)
//        Logger.debug("SkuVariantValues: skuId = \(sut.skuId)")
//        Logger.debug("SkuVariantValues: variantNameValueMap = \(sut.variantNameValueMap)")
        let sut = OfferSkusVariants(offer: offer_id_12555)
        let setNamesToIntersect: [String] = ["Color.Semi Solar Yellow/ Scarlet" , "Size.6 Women\'s / 5 Men\'s", "Width.M"]
        
        let result = sut.skuID(setNamesToIntersect: setNamesToIntersect)
        Logger.info("sut.skuID? : \(result)")
        
    }

}
