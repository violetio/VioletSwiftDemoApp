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
    @Published var offerSkusVariants: OfferSkusVariants
    @Published var selectedSkuID: Int64? = nil
    @Published var selectedVariantKeys: [String: String] = [:]
    @Published var singleSkuID: Int64? = nil

    var variantViewModels: [VariantViewModel] { offerSkusVariants.variantViewModels }
    

    init(offer: Offer) {
        Logger.debug("OfferPDPViewState: Init - OfferID: \(offer.id ?? 0)")
        self.offer = offer
        self.offerSkusVariants = OfferSkusVariants(offer: offer)
        let variantsArray = offer.variantsArray()
        Logger.debug("OfferPDPViewState: variantsArray - Count: \(variantsArray.count)")

        Logger.debug("OfferPDPViewState: Skus - Count: \(offer.skus?.count ?? 0)")
        if let singleSku = offer.singleSku(),
           let singleSkuID = singleSku.id {
            self.singleSkuID = singleSkuID
            self.selectedSkuID = singleSkuID
            Logger.debug("OfferPDPViewState: singleSkuID = \(singleSkuID)")
        } else {
            Logger.debug("OfferPDPViewState: Skus Count = \(offer.skus?.count ?? -1)")
        }
    }
    
    func updateAvailableVariants(variantName: String, valueName: String) {
        Logger.debug("updateAvailableVariants: variantName - \(variantName) - valueName - \(valueName)")
        let variantKey = "\(variantName).\(valueName)"
        var intersecting = offerSkusVariants.intersectingSkuIdSetMap(key: variantKey)
        intersecting.removeValue(forKey: variantKey)
        Logger.debug("Other variants showing should be:")
        Logger.debug(" - \(intersecting)")
    }
    
    func selected(variantName: String, valueName: String) {
        updateAvailableVariants(variantName: variantName, valueName: valueName)
        
        let variantKey = "\(variantName).\(valueName)"
        self.selectedVariantKeys[variantName] = variantKey
        if selectedVariantKeys.count == variantViewModels.count {
            if let newlySelectedSkuID = offerSkusVariants.skuID(setNamesToIntersect: Array(selectedVariantKeys.values)) {
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

