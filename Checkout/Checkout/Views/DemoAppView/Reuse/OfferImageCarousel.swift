//
//  OfferImageCarousel.swift
//  Checkout
//
//  Created on 8/8/23
//

import SwiftUI
import Violet

struct OfferImageCarousel: View {

    var imageURLS: [URL]
    var body: some View {
        TabView {
            ForEach(imageURLS, id: \.self) { imageURL in
                    AsyncImage(url: imageURL) { phase in
                        if let image = phase.image {
                            image.resizable().scaledToFill()
                        } else if phase.error != nil {
                            Color.red
                        } else {
                            Color.purple
                        }

                    }.frame(width: FigmaConstants.OfferCard.imageArea.width,
                            height: FigmaConstants.OfferCard.imageArea.height).clipped().cornerRadius(10).offset(y:-10)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always)).frame(width: FigmaConstants.OfferPDP.imageCarouselArea.width,
                                                                     height: FigmaConstants.OfferPDP.imageCarouselArea.height)
        
    }
}

struct OfferImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        OfferImageCarousel(imageURLS: PreviewMocks.MockOfferItem_12574_ImageURLS())
    }
}
