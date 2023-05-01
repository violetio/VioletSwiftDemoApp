//
//  OfferDetail.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import SwiftUI

struct OfferDetail: View {
    @Binding var offerItem: OfferItem
    @Binding var offerItemSelections: OfferItemSelections
    
    func buttonAction() {
        offerItemSelections.insert(offerItem)
        Logger.info("offerItemSelections: \(offerItemSelections.description)")
    }
    
    var productDetailsView: some View {
        VStack {
            Text(offerItem.name)
                .font(.title)
                .padding(10)
                .foregroundColor(Color.black)
            Text(offerItem.intPrice.priceText())
                .font(.title2)
                .padding(10)
                .foregroundColor(Color.black)
                .background(Color.white).cornerRadius(3)
                
        }.padding(30)
            .background(Color(white: 0.8))
            .cornerRadius(9)
    }
    
    var body: some View {
        VStack {
            
            Group {
                if let thumbURL =  offerItem.firstAlbumMediaImageURL() {
                    AsyncImage(url: thumbURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable().scaledToFit()
                                .border(.black)
                            
                        } else if phase.error != nil {
                            Color.red
                        } else {
                            Color.purple
                        }
                        
                    }.frame(maxHeight: 300)
                } else {
                    offerItem.thumbnailImage
                        .frame(minWidth:100, minHeight: 50)
                        .colorInvert()
                }
                
                productDetailsView

            }.padding([.leading, .trailing], 40)
                OfferSkusView(offerSkus: .constant( offerItem.skus()))
            Spacer()
            Button {
                buttonAction()
            } label: {
                Label("Add To Cart", systemImage: "cart")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent).padding()
                
                
    
        }.withBlackBorder()
    }
}

struct OfferDetail_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetail(offerItem: .constant(PreviewMocks.MockOfferItem()), offerItemSelections: .constant(OfferItemSelections()))
    }
}
