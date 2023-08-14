//
//  VariantsViewModelTests.swift
//  CheckoutTests
//
//  Created on 8/9/23
//

import XCTest
@testable import Checkout

final class VariantsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_1() throws {
        let offer_id_12555 = MockOffers.load_Offer_12555()!
        let sut = VariantsViewModel(offer: offer_id_12555)
//        XCTAssertEqual(sut.variants.count, 3)
//        sut.go()
        //let skuIdSetMap = VariantsViewModel.buildSkuIdSetMap(offer: offer_id_12555)
        Logger.info("\(sut.skuIdSetMap)")
        
        let setNamesToIntersect: [String] = ["Color.Semi Solar Yellow/ Scarlet" , "Size.6 Women\'s / 5 Men\'s", "Width.M"]
        
        let result = sut.skuID(setNamesToIntersect: setNamesToIntersect)
        Logger.info("sut.skuID? : \(result)")
        
    }
    
    func test_2() throws {
        let offer_id_12555 = MockOffers.load_Offer_12555()!
        
        let offer_item = DemoProductGridOfferItem.fromEntity(entity: offer_id_12555)!
        XCTAssertEqual(offer_item.variantViewModels.count, 3)
        
        let variant = offer_item.variantViewModels[0]
        Logger.info("Variant Name: \(variant.name)")
        variant.variantValuesArray.forEach { val in
            Logger.info("val: \(val.name)")
        }
    }

}
