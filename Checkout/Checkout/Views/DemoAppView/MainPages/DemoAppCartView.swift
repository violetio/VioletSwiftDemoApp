//
//  DemoAppCartView.swift
//  Checkout
//
//  Created on 8/16/23
//

import SwiftUI

struct DemoAppCartView: View {
    @Environment(\.dismiss) private var cartViewDismiss
    @Binding var store: AppStore
    @ObservedObject var cartViewState: CartViewState
    @StateObject var router: Router
    
    var body: some View {
        VStack(spacing: 0) {
        
                if cartViewState.cartEmpty {
                    Spacer()
                    VStack(spacing: 10) {
                        Text("Your Cart is Empty")
                            .font(.system(size: 20, weight: .semibold))
                        Text("Continue browsing the Demo App.")
                            .font(.system(size: 14))
                            .frame(minHeight: 25)
                    }
                    Spacer()

                } else {
                    List {
                        ForEach(cartViewState.bagViewStatesArray) { bagViewState in
                            CartBagSection(store: $store,
                                           bagViewState: bagViewState)
                        }
                    }
                }
            
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 0) {
                    
                    CartAmountDetailLine(detailLabelText: "Subtotal", amountLabelText: cartViewState.cartSubTotalText).padding(0)
                    
                    Text("Shipping and taxes calculated at checkout.")
                        .frame(maxHeight: 21)
                        .font(.system(size: 14))
                        .padding(0)
                        //.withBlackBorder()
                        
                }
                
                NextButton(buttonText: "Checkout",
                           nextEnabled: $cartViewState.cartNotEmpty,
                           action: {
                    router.append(NavigationKey.addShippingAddress)
                })

            }.padding(25)
                .background(Color.white)
//            .withBlackBorder()
            .frame(maxHeight: 166)
            
            
        }.frame(maxHeight: .infinity).withScrollViewBackgroundColor()
//            .withBlackBorder()
        .navigationTitle("Shopping Cart")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavBarCartButton(store: $store,
                                 cartViewState: store.cartViewState,
                                 router: router)
            }
        }
    }
}

struct DemoAppCartView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_71169()!
    static let mockOrder_74599 = MockOffers.load_OrderID_74599()!

    static var previews: some View {
        Group {
            NavigationStack {
                DemoAppCartView(store: AppStore.mockAppStoreBinding,
                                cartViewState: CartViewState(order: mockOrder),
                                router: Router())
            }.previewDisplayName("1 Sku")
            
            NavigationStack {
                DemoAppCartView(store: AppStore.mockAppStoreBinding,
                                cartViewState: CartViewState(order: mockOrder_74599),
                                router: Router())
            }.previewDisplayName("0 Skus")
        }
    }
}
