//
//  DemoAppCartView.swift
//  Checkout
//
//  Created on 8/16/23
//

import SwiftUI

struct DemoAppCartView: View {
    @Binding var store: AppStore
    @ObservedObject var cartViewState: CartViewState
    @StateObject var router: Router
    
    var body: some View {
        VStack(spacing: 0) {
        
                if cartViewState.cartEmpty {
                    Spacer()
                    Text("Your Cart is Empty")
                        .font(.system(size: 20, weight: .semibold))
                    Text("Continue browsing the Demo App.")
                        .font(.system(size: 14))
                        .frame(minHeight: 25)
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
                    //Spacer()
                    HStack {
                        Text("Subtotal")
                        Spacer()
                        Text(cartViewState.cartSubTotalText)
                    }.font(.system(size: 14, weight: .semibold))
                        .padding(0)
                        //.withBlackBorder()
                    
                    Text("Shipping and taxes calculated at checkout.")
                        .frame(maxHeight: 21)
                        .font(.system(size: 14))
                        .padding(0)
                        //.withBlackBorder()
                        
                }
                  
                
                NavigationLink(value: NavigationKey.addShippingAddress) {
//                    Button {
//
//
//                    } label: {
                        Text("Checkout")
                            .font(Font.custom("SF Pro Text", size: 17))
                            .frame(width: 340, height: 50)
                            .foregroundColor(.white)
                            .background(Color(red: 0, green: 0.48, blue: 1))
                            .cornerRadius(12)
//                    }
//                    .frame(width: 340, alignment: .bottom)
                }


            }.padding(25)
                .background(Color.white)
//            .withBlackBorder()
            .frame(maxHeight: 166)
            
            
        }.frame(maxHeight: .infinity).withScrollViewBackgroundColor()
//            .withBlackBorder()
        .navigationTitle("Shopping Cart")
    }
}

struct DemoAppCartView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_71169()!

    static var previews: some View {
        Group {
            NavigationStack {
                DemoAppCartView(store: AppStore.mockAppStoreBinding,
                                cartViewState: CartViewState(order: mockOrder),
                                router: Router())
            }.previewDisplayName("1 Sku")
            
            DemoAppCartView(store: AppStore.mockAppStoreBinding,
                            cartViewState: CartViewState(skuCount: 0),
                            router: Router()).previewDisplayName("0 Skus")
        }
    }
}
