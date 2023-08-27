//
//  DemoAppOfferPDPVariantsView.swift
//  Checkout
//
//  Created on 8/27/23
//

import SwiftUI

struct DemoAppOfferPDPVariantsView: View {
    @ObservedObject var offerPDPViewState: OfferPDPViewState
    
    var body: some View {
        if offerPDPViewState.variantViewModels.count > 0 {
            
            ForEach(offerPDPViewState.variantViewModels) { variant in
                OfferVariantValuePicker(variantViewModel: variant, selectedValue: variant.variantValuesArray[0].name, offerPDPViewState: offerPDPViewState)
            }

        }
    }
}

struct DemoAppOfferPDPVariantsView_Previews: PreviewProvider {
    static let mockOffer = MockOffers.load_PageOffers(offerId: 12569)!
    static var previews: some View {
        VStack {
            DemoAppOfferPDPVariantsView(offerPDPViewState: OfferPDPViewState(offer: mockOffer))
        }
    }
}
