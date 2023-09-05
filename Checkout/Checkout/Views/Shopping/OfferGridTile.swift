//
//  OffersGridTile.swift
//  Checkout
//
//  Created on 4/24/23.
//

import SwiftUI

struct OfferGridTile: View {
    
    @Binding var offerItem: OfferItem
    
    var body: some View {
        let borderColor: Color = offerItem.offerEntity != nil ? Color.blue : Color.black
        VStack {
            if let thumbURL =  offerItem.firstAlbumMediaImageURL() {
                AsyncImage(url: thumbURL) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFit()
                    } else if phase.error != nil {
                        Color.red
                    } else {
                        Color.purple
                    }
                    
                }
            }
            else {
                offerItem.thumbnailImage
                    .frame(minWidth:100, minHeight: 50)
                    .colorInvert()
            }
            Text(offerItem.name).foregroundColor(Color.white)
        }
        .frame(maxWidth: StyleConstants.OfferGridLayoutConstants.itemMaxWidth,
               maxHeight: StyleConstants.OfferGridLayoutConstants.itemMaxHeight)
        .background(Color.gray)
        .border(borderColor).padding(10)
    }
}

struct OffersGridTile_Previews: PreviewProvider {
    static var previews: some View {
        OfferGridTile(offerItem: .constant(OfferItem.Empty()))
    }
}
