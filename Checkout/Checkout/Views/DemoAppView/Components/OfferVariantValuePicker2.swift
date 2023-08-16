//
//  OfferVariantValuePicker2.swift
//  Checkout
//
//  Created on 8/9/23
//

import SwiftUI

struct OfferVariantValuePicker2: View {
    @State var variantViewModel: VariantViewModel
    @State var selectedValue: String? = nil
    @State var labelText: String? = nil
    
    var geoSize: CGSize? = nil
    var body: some View {

        Menu {
            Picker(selection: $selectedValue) {
                ForEach(variantViewModel.variantValuesArray) { value in
                    Text(value.name)
                }
            } label: {
                if let v = selectedValue {
                    Text("\(v)")
                }
                //Text(label)
            }.frame(width: 340, height: 50).onChange(of: selectedValue) { newValue in
                labelText = selectedValue
            }
        } label: {
//            if let v = selectedValue {
//                Text("label")
//            } else {
//                Text("value")
//            }
            //Text(label)
            LabeledContent(labelText ?? variantViewModel.name, value:"").padding(.horizontal)
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
        OfferVariantValuePicker2(variantViewModel: mockVariant_1, selectedValue: nil)
    }
}
