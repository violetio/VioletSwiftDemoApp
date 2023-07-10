//
//  DemoAppOfferCardImage.swift
//  Checkout
//
//  Created on 7/10/23
//

import SwiftUI

struct DemoAppOfferCardImage: View {
    var body: some View {
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
    }
}

struct DemoAppOfferCardImage_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppOfferCardImage()
    }
}
