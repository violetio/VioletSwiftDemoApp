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
    @ObservedObject var offerPDPViewState: OfferPDPViewState
    @ObservedObject var cartViewState: CartViewState
    @StateObject var router: Router
    
    var body: some View {
        ScrollView {
            VStack {
                OfferImageCarousel(imageURLS: offerItem.imageURLS)
                
                VStack(alignment: .leading, spacing: 8) {
                    DemoAppOfferCardText(offerItem: $offerItem)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    DemoAppOfferPDPVariantsView(offerPDPViewState: offerPDPViewState)
                    
                    InstantPaymentSheetPresentView(store: $store,
                                                   cartViewState: cartViewState,
                                                   selectedSkuID: $offerPDPViewState.selectedSkuID,
                                                   hasPaymentIntent: $cartViewState.paymentSheetViewState.hasPaymentIntent)
                    
                    Button {
                        if let orderID = store.cartViewState.cartId {
                            if let orderSkuID: OrderSkuID = offerPDPViewState.selectedSkuID {
                                let orderQuantity: OrderQuantity = 1
                                store.sender.send(.addSkuToCart(orderID, orderSkuID, orderQuantity))
                            } else {
                                Logger.error("No Selected SkuID for OfferID \(offerItem.id)")
                            }
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
                    .disabled(offerPDPViewState.selectedSkuID == nil)
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
                NavBarCartButton(store: $store,
                                 cartViewState: store.cartViewState,
                                 router: router)
            }
        }.withScrollViewBackgroundColor()
            
    }
    
    func applePayButtonAction() {
        Logger.info("Apple Pay Button Tapped!")
    }
}

struct DemoAppOfferPDP_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_73938()!
    static let mockCartViewState = CartViewState(order: mockOrder)
    static let mockOfferItem_12574 = PreviewMocks.Mock_DemoProductGridOfferItem_12574()
    static let mockOfferItem_12555 = PreviewMocks.Mock_DemoProductGridOfferItem_12555()
    static let mockOfferPDPViewState_12574 = OfferPDPViewState(offer: mockOfferItem_12574.offerEntity)
    static let mockOfferPDPViewState_12555 = OfferPDPViewState(offer: mockOfferItem_12555.offerEntity)
    static var previews: some View {
        Group {
            NavigationStack {
                DemoAppOfferPDP(store: AppStore.mockAppStoreBinding,
                                offerItem: .constant(mockOfferItem_12574),
                                offerPDPViewState: mockOfferPDPViewState_12574,
                                cartViewState: mockCartViewState,
                                router: Router())
            }.previewDisplayName("No Variants OfferID 12574")
            
            NavigationStack {
                DemoAppOfferPDP(store: AppStore.mockAppStoreBinding,
                                offerItem: .constant(mockOfferItem_12555),
                                offerPDPViewState: mockOfferPDPViewState_12555,
                                cartViewState: mockCartViewState,
                                router: Router())
            }.previewDisplayName("3 Variants OfferID 12555")
        }
    }
}
