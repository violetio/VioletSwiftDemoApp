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
    @Published var selectedVariantKeys: [String: String] = [:]
    public let variants: [Variant]
    let variantViewModels: [VariantViewModel]
    

    init(offer: Offer) {
        //Logger.debug("OfferPDPViewState: Init")
        self.offer = offer
        self.variantsViewModel = VariantsViewModel(offer: offer)
        let variantsArray = offer.variantsArray()
        self.variants = variantsArray
        self.variantViewModels = variantsArray.compactMap { VariantViewModel(variant: $0)}.sorted(by: { l, r in
            l.name < r.name
        })
        if let singleSku = offer.singleSku(),
           let singleSkuID = singleSku.id {
            self.selectedSkuID = singleSkuID
            Logger.debug("OfferPDPViewState: singleSkuID = \(singleSkuID)")
        } else {
            Logger.debug("OfferPDPViewState: Skus Count = \(offer.skus?.count ?? -1)")
        }
    }
    
    func selected(variantName: String, valueName: String) {
        let variantKey = "\(variantName).\(valueName)"
        self.selectedVariantKeys[variantName] = variantKey
        if selectedVariantKeys.count == variantViewModels.count {
            if let newlySelectedSkuID = variantsViewModel.skuID(setNamesToIntersect: Array(selectedVariantKeys.values)) {
                Logger.debug("OfferPDPViewState: newlySelectedSkuID - \(newlySelectedSkuID)")
                selectedSkuID = newlySelectedSkuID
            } else {
                Logger.debug("OfferPDPViewState: newlySelectedSkuID - NOTHING for SelectedKeys: \(selectedVariantKeys)")
            }
        } else {
//            Logger.debug("OfferPDPViewState: Missing Selection?")
//            Logger.debug("- SelectedKeys: \(selectedVariantKeys)")
        }
    }

}

