//
//  VariantViewModelTests.swift
//  CheckoutTests
//
//  Created on 8/9/23
//

import XCTest
@testable import Checkout

final class VariantViewModelTests: XCTestCase {
    
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
    
    func test_3() throws {
        let sut = BagViewState(bag: MockOffers.load_OrderID_71169()!.bags![0])
        XCTAssertEqual(sut.bagID, 56808)
        XCTAssertEqual(sut.orderSkuViewStates.count, 3)
    }

}
