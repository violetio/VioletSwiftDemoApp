//
//  SelectedOfferView.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import SwiftUI

struct PageOffersView: View {
    
    struct LayoutConstants {
        static let imageMaxWidth: CGFloat = 80
        static let imageMaxHeight: CGFloat = 80
        static let itemMaxWidth: CGFloat = 100
        static let itemMaxHeight: CGFloat = 120
        static let aspectRatio: CGSize = CGSize(width: 80, height: 80)
    }
    let gridDataSource: OfferGridDataSource
    let channelName = "ULTRA"
    init(gridDataSource: OfferGridDataSource) {
        self.gridDataSource = gridDataSource
    }

    
    let layout = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 5) {
                ForEach(gridDataSource.offerGridItems, id: \.self.offer_id) { shoppingOfferGridItem in
                    NavigationLink(destination: AddOfferToCartView(shoppingOfferGridItem: shoppingOfferGridItem)) {
                        
                        VStack {
                            if let thumbURL =  shoppingOfferGridItem.firstAlbumMediaImageURL {
                                AsyncImage(url: thumbURL) { phase in
                                    if let image = phase.image {
                                        image.resizable().scaledToFit()
                                    } else if phase.error != nil {
                                        Color.red
                                    } else {
                                        Color.purple
                                    }
                                    
                                }
                            } else {
                                shoppingOfferGridItem.thumbnailImage
                                    .frame(minWidth:100, minHeight: 50)
                                    .colorInvert()
                            }
                            Text(shoppingOfferGridItem.name).colorInvert()
                        }
                        .frame(maxWidth: LayoutConstants.itemMaxWidth,
                               maxHeight: LayoutConstants.itemMaxHeight)
                        .background(Color.gray)
                        .border(.black).padding(10)
                    }
                }
            }
            .padding(.horizontal)
            
        }
        .navigationBarTitle(channelName, displayMode: .inline)

    }

}

struct PageOffersView_Previews: PreviewProvider {
    static var previews: some View {
        PageOffersView(gridDataSource: PreviewMocks.MockOfferGridDataSource())
    }
}
