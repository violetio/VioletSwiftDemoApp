//
//  OfferImageCarousel.swift
//  Checkout
//
//  Created on 8/8/23
//

import SwiftUI
import Violet

struct OfferImageCarousel: View {
    
    @Binding var mediaArray: [Media]
    var body: some View {
        TabView {
            ForEach(mediaArray, id: \.self) { mediaItem in
                if let mediaUrlString = mediaItem.url,
                   let imageURL = URL(string: mediaUrlString){
                    AsyncImage(url: imageURL) { phase in
                        if let image = phase.image {
                            image.resizable().scaledToFill()
                        } else if phase.error != nil {
                            Color.red
                        } else {
                            Color.purple
                        }

                    }.frame(width: FigmaConstants.OfferCard.imageArea.width,
                            height: FigmaConstants.OfferCard.imageArea.height).clipped()
                } else {
                    Text("No Media URL")
                }
                



            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        
    }
}

struct OfferImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        OfferImageCarousel(mediaArray: .constant(PreviewMocks.MockOfferItem_12574_Media()))
    }
}
