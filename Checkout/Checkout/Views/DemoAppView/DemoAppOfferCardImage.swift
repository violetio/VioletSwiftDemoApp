//
//  DemoAppOfferCardImage.swift
//  Checkout
//
//  Created on 7/10/23
//

import SwiftUI

struct DemoAppOfferCardImage: View {
    @Binding var imageURL: URL?
    var body: some View {
        VStack {
            if let thumbURL = imageURL {
                AsyncImage(url: thumbURL) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFill()
                    } else if phase.error != nil {
                        FigmaConstants.Colors.scrollViewBackgroundColor
                    } else {
                        FigmaConstants.Colors.scrollViewBackgroundColor
                    }
                    
                }.frame(width: FigmaConstants.OfferCard.imageArea.width,
                        height: FigmaConstants.OfferCard.imageArea.height).clipped()
            }
            else {
                Text("No Image Available")
                    .font(Font.custom("SF Pro", size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.58))
            }
        }.frame(width: FigmaConstants.OfferCard.imageArea.width,
                height: FigmaConstants.OfferCard.imageArea.height)
        //.withBlackBorder()

    }
}

struct DemoAppOfferCardImage_Previews: PreviewProvider {
    static var previews: some View {
        //DemoAppOfferCardImage(imageURL: .constant(nil))
        Group {
            DemoAppOfferCardImage(imageURL: .constant(PreviewMocks.Mock_OfferItem_ImageURL()))
                .previewLayout(PreviewLayout.fixed(width: FigmaConstants.OfferCard.imageArea.width,
                                                   height: FigmaConstants.OfferCard.imageArea.height))
                .previewDisplayName("Default preview")
            
            DemoAppOfferCardImage(imageURL: .constant(nil))
                .previewLayout(PreviewLayout.fixed(width: FigmaConstants.OfferCard.imageArea.width,
                                                   height: FigmaConstants.OfferCard.imageArea.height))
                .previewDisplayName("No Image preview")
        }
    }
}
