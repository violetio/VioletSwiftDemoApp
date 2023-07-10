//
//  DemoAppProductGrid.swift
//  Checkout
//
//  Created on 6/29/23
//

import SwiftUI

struct DemoAppProductGrid: View {
    @Binding var store: AppStore
    var loadedOffers: [DemoProductGridOfferItem] = PreviewMocks.MockOfferItemsArray2()
    let layout = [
        GridItem(.fixed(340))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 5) {
                ForEach(loadedOffers, id: \.offer_id) { offerItem in

                    VStack(alignment: .leading, spacing: 12) {
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(width: 340, height: 340)
                          .background(
                            Image("PATH_TO_IMAGE")
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              .frame(width: 340, height: 340)
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

            .padding(.horizontal)
            
        }.background(Color(red: 0.95, green: 0.95, blue: 0.97))
        //BUG: This -background(Color- setting doesn't appear to be working
    }
}

struct DemoAppProductGrid_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppProductGrid(store: AppStore.mockAppStoreBinding)
    }
}
