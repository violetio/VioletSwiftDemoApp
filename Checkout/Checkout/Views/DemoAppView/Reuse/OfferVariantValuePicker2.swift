//
//  OfferVariantValuePicker2.swift
//  Checkout
//
//  Created on 8/9/23
//

import SwiftUI

struct OfferVariantValuePicker2: View {
    @State var variantViewModel: VariantViewModel
    @State var selectedValue: String
    
    var geoSize: CGSize? = nil
    var body: some View {

        Menu {
            Picker(selection: $selectedValue) {
                ForEach(variantViewModel.variantValuesArray) { value in
                    Text(value.name)
                }
            } label: {
                //Text(label)
            }.frame(width: 340, height: 50)
        } label: {
            //Text(label)
            LabeledContent(variantViewModel.name, value: selectedValue).padding(.horizontal)
                .frame(width: 340, height: 50)
                .foregroundColor(.black)
        }.background(Color.white).cornerRadius(12)

    }
}

struct OfferVariantValuePicker2_Previews: PreviewProvider {
    static let mockOfferItem = PreviewMocks.Mock_DemoProductGridOfferItem_12555()
    static let mockVariant_1 = mockOfferItem.variantViewModels[0]
    static let mockVariant_DefaultValue = mockVariant_1.variantValuesArray[0]
    static var previews: some View {
        OfferVariantValuePicker(variantViewModel: mockVariant_1, selectedValue: mockVariant_DefaultValue.name)
    }
}
