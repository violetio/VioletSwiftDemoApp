//
//  DemoAppShippingMethodSelectView.swift
//  Checkout
//
//  Created on 8/28/23
//

import SwiftUI

struct DemoAppShippingMethodSelectView: View {
    @Binding var store: AppStore
    @ObservedObject var cartViewState: CartViewState
    
    var body: some View {
        List {
            
            Section {
                Text("Shipping Method Card 1")
                Text("Shipping Method Card 1")
            } header: {
                VStack(alignment: .leading) {
                    Text("Shipping Method").font(.headline).padding(.vertical)
                    Text("Merchant")
                }
            }
        }
        
    }
}

struct DemoAppShippingMethodSelectView_Previews: PreviewProvider {
    static var previews: some View {
        
        DemoAppShippingMethodSelectView(store: AppStore.mockAppStoreBinding,
                                        cartViewState: CartViewState(skuCount: 0))
    }
}
