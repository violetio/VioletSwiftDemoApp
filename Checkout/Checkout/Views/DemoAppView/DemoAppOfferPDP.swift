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
        Text("Offer Item Detail: \(offerItem.name)")
    }
}

struct DemoAppOfferPDP_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppOfferPDP(store: AppStore.mockAppStoreBinding,
                        offerItem: .constant(PreviewMocks.Mock_DemoProductGridOfferItem()))
    }
}
