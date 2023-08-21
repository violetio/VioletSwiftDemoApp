//
//  SkuVariantValues.swift
//  Checkout
//
//  Created on 8/20/23
//

import Foundation
import Violet

class SkuVariantValues {
    let sku: Sku
    var skuId: Int64 = 0
    var variantNameValueMap: [String: String] = [:]
    
    init(sku: Sku) {
        self.sku = sku
        self.load(sku: sku)
    }
    
    func load(sku: Sku) {
        self.skuId = sku.id ?? 0
        if let variantValuesSet = sku.variantValues {
            for variantValue in variantValuesSet {
                if let name = variantValue.variant,
                   let value = variantValue.value {
                    variantNameValueMap[name] = value
                    
                }
            }
        }
    }
    
    static func inspect(sku: Sku) {
        if let skuId = sku.id {
            Logger.debug("SkuVariantValues: skuId = \(skuId)")
            if let variantValuesSet = sku.variantValues {
                Logger.debug("SkuVariantValues: variantValuesSet.count = \(variantValuesSet.count)")
            }
        }
    }
}
