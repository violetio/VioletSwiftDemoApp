//
//  OfferSkusVariantsTests.swift
//  CheckoutTests
//
//  Created on 8/20/23
//

import XCTest
@testable import Checkout

final class OfferSkusVariantsTests: XCTestCase {


    func test_Init() throws {
        let offer_id_12555 = MockOffers.load_Offer_12555()!
        let skuSet = offer_id_12555.skus!
        let firstSku = skuSet.first!
        let sut = OfferSkusVariants(offer: offer_id_12555)
        let setNamesToIntersect: [String] = ["Color.Semi Solar Yellow/ Scarlet" , "Size.6 Women\'s / 5 Men\'s", "Width.M"]
        
        let result = sut.skuID(setNamesToIntersect: setNamesToIntersect)
        Logger.info("sut.skuID? : \(result)")
        
    }

    func test_load_PageOffer_ID_12569() {
        let offer_id_12569 = MockOffers.load_PageOffers(offerId: 12569)!
//        XCTAssertNotNil(offer_id_12569)
        
        let sut = OfferSkusVariants(offer: offer_id_12569)
        let key = "Color.Light Cream/ Anthracite"

        let intersectingKeys = sut.availableVariants(key: key)
        var availableVariantViewModels: [String: VariantViewModel] = [:]
        intersectingKeys.forEach { aKey in
            let split = aKey.split(separator: ".")
            if split.count == 2 {
                let variantName = split[0], valueName = split[1]
                if var variantViewModels = availableVariantViewModels[String(variantName)] {
                    variantViewModels.addValueName(valueName: String(valueName))
                    availableVariantViewModels[String(variantName)] = variantViewModels
                } else {
                    availableVariantViewModels[String(variantName)] = VariantViewModel(name: String(variantName), valueNamesArray: [String(valueName)])
                }
                Logger.debug("variantName: \(variantName), valueName: \(valueName)")
            }

        }
        Logger.debug("availableVariantViewModels: \(availableVariantViewModels)")
    }
    
    /**
     debug: updateAvailableVariants: variantName - Color - valueName - Light Cream/ Anthracite
     debug: Other variants showing should be:
     debug:  - ["Size.X-Large": Set([33423, 33432, 33446, 33419, 33438, 33418, 33442, 33437]), "Size.Medium": Set([33412, 33439, 33421, 33444, 33435, 33420, 33416, 33415, 33428]), "Size.XX-Large": Set([33457, 33450, 33447, 33433, 33453, 33451, 33429, 33417, 33448, 33445]), "Size.Large": Set([33413, 33441, 33456, 33449, 33440, 33455, 33459, 33454]), "Size.Small": Set([33434, 33458, 33427, 33443, 33414, 33426, 33431, 33424, 33430])]
     debug: updateAvailableVariants: variantName - Size - valueName - Small
     debug: Other variants showing should be:
     debug:  - ["Color.Team Red/ Thunder Blue/ Blue": Set([33451, 33434]), "Color.Ashen/ Ocean/ White/ Igloo": Set([33427, 33447, 33418, 33459, 33415]), "Color.Red Sepia/ Black/ Taupe/ White": Set([33428, 33456, 33448, 33443, 33419]), "Color.Diffused Blue/ Cobalt Tint": Set([33414, 33435, 33457, 33441, 33437]), "Color.Light Cream/ Anthracite": Set([33420, 33438, 33454, 33424, 33445]), "Color.Midnight Navy/ Olive Canvas": Set([33442, 33430, 33421, 33413, 33453]), "Color.Anthracite/ Barely Volt": Set([33432, 33440, 33412, 33429, 33431]), "Color.Purple/ Blue/ University Red": Set([33446, 33426, 33455, 33444, 33417]), "Color.Blue Force/ Team Red": Set([33439, 33449, 33458, 33423, 33450])]
     debug: OfferPDPViewState: newlySelectedSkuID - 33424
     */
}
