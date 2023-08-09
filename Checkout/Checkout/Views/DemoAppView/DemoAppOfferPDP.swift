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
                
                
                VStack(alignment: .leading, spacing: 8) {
                    DemoAppOfferCardText(offerItem: $offerItem)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    Text("Variants Selectors")
                    Text("Buttons")
                    
                    Text("Description")
                        .font(.system(size: 17, weight: .semibold))
                    // Small Regular Body
                    Text("\(offerItem.description)")
                      .font(Font.custom("Inter", size: 14))
                      .foregroundColor(.black)
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(0)
                .frame(width: 340, alignment: .topLeading)
                
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
