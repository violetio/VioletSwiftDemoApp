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
        VStack {
            Text("Offer Images Carousel")
            DemoAppOfferCardText(offerItem: $offerItem)
            .padding(.horizontal, 10)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            Text("Offer Item Detail: \(offerItem.name)")
        }
        
    }
}

struct DemoAppOfferPDP_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppOfferPDP(store: AppStore.mockAppStoreBinding,
                        offerItem: .constant(PreviewMocks.Mock_DemoProductGridOfferItem()))
    }
}
