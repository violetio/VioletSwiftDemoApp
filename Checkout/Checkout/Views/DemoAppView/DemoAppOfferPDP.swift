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
    @State var selectedSkuID: OrderSkuID? = nil
    @ObservedObject var offerPDPViewState: OfferPDPViewState
    
    var body: some View {
        ScrollView {
            VStack {
                OfferImageCarousel(imageURLS: offerItem.imageURLS)
                
                VStack(alignment: .leading, spacing: 8) {
                    DemoAppOfferCardText(offerItem: $offerItem)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    if offerItem.variantViewModels.count > 0 {
                        
                        ForEach(offerItem.variantViewModels) { variant in
                            OfferVariantValuePicker(variantViewModel: variant, selectedValue: variant.variantValuesArray[0].name, offerPDPViewState: offerPDPViewState)
                        }

                    }
                    
                    if StripeAPI.deviceSupportsApplePay() {
                        //Font 17
                        PaymentButton(action: applePayButtonAction)
                            
                            .frame(width: 340, height: 44).padding(.top)
                    } else {
                        Text("Device does not support Apple Pay")
                    }
                    
                    Button {
                        if let orderID = store.cartViewState.cartId {
                            let orderSkuID: OrderSkuID = 33524
                            let orderQuantity: OrderQuantity = 1
                            store.sender.send(.addSkuToCart(orderID, orderSkuID, orderQuantity))
                        } else {
                            Logger.error("DemoAppOfferPDP: No Active Order ID")
                        }
                    } label: {
                        Text("Add To Cart")
                            .font(Font.custom("SF Pro Text", size: 17))
                            .frame(width: 340, height: 44)
                            .foregroundColor(.white)
                            .background(Color(red: 0, green: 0.48, blue: 1))
                            .cornerRadius(12)
                    }
                    .disabled(selectedSkuID == nil)
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
                }, cartViewState: store.cartViewState)
            }
        }.withScrollViewBackgroundColor()
            
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
                                offerItem: .constant(PreviewMocks.Mock_DemoProductGridOfferItem_12574()),
                                offerPDPViewState: OfferPDPViewState(offer: PreviewMocks.Mock_DemoProductGridOfferItem_12574().offerEntity))
            }.previewDisplayName("No Variants OfferID 12574")
            
            NavigationStack {
                DemoAppOfferPDP(store: AppStore.mockAppStoreBinding,
                                offerItem: .constant(PreviewMocks.Mock_DemoProductGridOfferItem_12555()),
                                offerPDPViewState: OfferPDPViewState(offer: PreviewMocks.Mock_DemoProductGridOfferItem_12555().offerEntity))
            }.previewDisplayName("3 Variants OfferID 12555")
        }
    }
}
