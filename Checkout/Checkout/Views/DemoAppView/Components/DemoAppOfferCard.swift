//
//  DemoAppOfferCard.swift
//  Checkout
//
//  Created on 7/10/23
//

import SwiftUI

struct DemoAppOfferCard: View {
    @Binding var store: AppStore
    @Binding var offerItem: DemoProductGridOfferItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            DemoAppOfferCardImage(imageURL: .constant(offerItem.firstAlbumMediaImageURL()))
            DemoAppOfferCardText(offerItem: $offerItem)
            .padding(.horizontal, 10)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
        }
        .padding(.horizontal, 0)
        .padding(.top, 0)
        .padding(.bottom, 12)
        .background(.white)
        .cornerRadius(10)
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .inset(by: 0.5)
            .stroke(Color(red: 0.9, green: 0.9, blue: 0.92), lineWidth: 1)
        )
    }
}

struct DemoAppOfferCard_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppOfferCard(store: AppStore.mockAppStoreBinding,
                         offerItem: .constant(PreviewMocks.Mock_DemoProductGridOfferItem_12574()))
    }
}
