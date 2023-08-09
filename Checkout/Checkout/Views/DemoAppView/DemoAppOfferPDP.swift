//
//  DemoAppOfferPDP.swift
//  Checkout
//
//  Created on 8/8/23
//

import PassKit
import StripeApplePay
import SwiftUI

struct DemoAppOfferPDP: View {
    @Binding var store: AppStore
    @Binding var offerItem: DemoProductGridOfferItem
    
    var body: some View {
        ScrollView {
            VStack {
                OfferImageCarousel(imageURLS: offerItem.imageURLS)
                
                VStack(alignment: .leading, spacing: 8) {
                    DemoAppOfferCardText(offerItem: $offerItem)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    if offerItem.variants.count > 0 {
                        Text("Variants Selectors")
                        Text("Variants Count: \(offerItem.variants.count)")
                    }
                    
                    if StripeAPI.deviceSupportsApplePay() {
                        PaymentButton(action: applePayButtonAction).cornerRadius(12)
                    } else {
                        Text("Device does not support Apple Pay")
                    }
                    
                    Button {
                        print("Add Sku To Cart")
                    } label: {
                        Text("Add To Cart")
                            .font(Font.custom("SF Pro Text", size: 17))
                            .frame(width: 340, height: 50)
                            .foregroundColor(.white)
                            .background(Color(red: 0, green: 0.48, blue: 1))
                            .cornerRadius(12)
                    }
                    
                    .padding(.horizontal, 15.5)
                    .padding(.vertical, 15)
                    .frame(width: 340, alignment: .top)

                    Text("Description")
                        .font(.system(size: 17, weight: .semibold))
                    // Small Regular Body
                    Text("\(offerItem.description)")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(0)
                .frame(width: 340, alignment: .topLeading)
            } // .border(.blue)
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavBarCartButton(action: {
                    print("Custom button tapped!")
                }, buttonText: "0")
            }
        }
    }
    
    func applePayButtonAction() {
        Logger.info("Apple Pay Button Tapped!")
    }
}

struct DemoAppOfferPDP_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                DemoAppOfferPDP(store: AppStore.mockAppStoreBinding,
                                offerItem: .constant(PreviewMocks.Mock_DemoProductGridOfferItem_12574()))
            }.previewDisplayName("No Variants OfferID 12574")
            
            NavigationStack {
                DemoAppOfferPDP(store: AppStore.mockAppStoreBinding,
                                offerItem: .constant(PreviewMocks.Mock_DemoProductGridOfferItem_12555()))
            }.previewDisplayName("3 Variants OfferID 12555")
        }
    }
}
