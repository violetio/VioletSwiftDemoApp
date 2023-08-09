//
//  OfferVariantValuePicker.swift
//  Checkout
//
//  Created on 8/9/23
//

import SwiftUI

struct OfferVariantValuePicker: View {
    @Binding var variantViewModel: VariantViewModel
    var body: some View {
        Text("Variant Name: \(variantViewModel.name)")
    }
}

struct OfferVariantValuePicker_Previews: PreviewProvider {
    static var previews: some View {
        OfferVariantValuePicker(variantViewModel: .constant(PreviewMocks.Mock_DemoProductGridOfferItem_12555().variantViewModels[0]))
    }
}
