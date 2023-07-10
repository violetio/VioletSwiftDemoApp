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
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: FigmaConstants.OfferCard.imageArea.width,
                     height: FigmaConstants.OfferCard.imageArea.height)
              .background(
                Image("PATH_TO_IMAGE")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: FigmaConstants.OfferCard.imageArea.width,
                         height: FigmaConstants.OfferCard.imageArea.height)
                  .clipped()
              )
            VStack(alignment: .leading, spacing: 8) {
                Text("\(offerItem.name)")
                    .font(.system(size: 21, weight: .semibold))
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .topLeading)
                Text("\(offerItem.vendor)")
                    .font(.system(size: 14, weight: .regular))
                    .italic()
                    .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.58))
                Text("Merchant Name")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.58))
                
            }
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
                         offerItem: .constant(PreviewMocks.Mock_DemoProductGridOfferItem()))
    }
}
