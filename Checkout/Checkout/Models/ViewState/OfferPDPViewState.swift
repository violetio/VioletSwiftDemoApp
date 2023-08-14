//
//  OfferPDPViewState.swift
//  Checkout
//
//  Created on 8/14/23
//

import Foundation
import Violet

class OfferPDPViewState: ObservableObject {
    @Published var offer: Offer
    @Published var variantsViewModel: VariantsViewModel
    @Published var selectedSkuID: Int64? = nil
    var selectedVariantKeys: [String: String] = [:]
    public let variants: [Variant]
    let variantViewModels: [VariantViewModel]
    

    init(offer: Offer) {
        self.offer = offer
        self.variantsViewModel = VariantsViewModel(offer: offer)
        let variantsArray = offer.variantsArray()
        self.variants = variantsArray
        self.variantViewModels = variantsArray.compactMap { VariantViewModel(variant: $0)}.sorted(by: { l, r in
            l.name < r.name
        })
    }
    
    func selected(variantName: String, valueName: String) {
        let variantKey = "\(variantName).\(valueName)"
        Logger.info("OfferPDPViewState: variantKey- \(variantKey)")
        selectedVariantKeys[variantName] = variantKey
        if selectedVariantKeys.count == variantViewModels.count {
            var newlySelectedSkuID = variantsViewModel.skuID(setNamesToIntersect: Array(selectedVariantKeys.values))
            Logger.info("OfferPDPViewState: newlySelectedSkuID - \(newlySelectedSkuID)")
            selectedSkuID = newlySelectedSkuID
        }
    }

}

