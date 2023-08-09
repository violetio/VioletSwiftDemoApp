//
//  DemoAppOfferPDP.swift
//  Checkout
//
//  Created on 8/8/23
//

import SwiftUI

struct DemoAppOfferPDP: View {
    
    @Binding var store: AppStore
    @Binding var offerItem: DemoProductGridOfferItem
    
    var body: some View {
        ScrollView {
            VStack {
                OfferImageCarousel(imageURLS: offerItem.imageURLS)
                DemoAppOfferCardText(offerItem: $offerItem)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                Text("Variants Selectors")
                Text("Buttons")
                Text("Offer Description")
            }//.border(.blue)
        }
        
    }
}

struct DemoAppOfferPDP_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppOfferPDP(store: AppStore.mockAppStoreBinding,
                        offerItem: .constant(PreviewMocks.Mock_DemoProductGridOfferItem()))
    }
}
