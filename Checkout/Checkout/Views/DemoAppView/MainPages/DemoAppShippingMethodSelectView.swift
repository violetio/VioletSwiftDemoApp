//
//  DemoAppShippingMethodSelectView.swift
//  Checkout
//
//  Created on 8/28/23
//

import SwiftUI

struct DemoAppShippingMethodSelectView: View {
    var body: some View {
        List {
            Section {
                Text("Contact Card")
            } header: {
                Text("Contact")
            }
            
            Section {
                Text("Ship To Card")
            }
            
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
        
        DemoAppShippingMethodSelectView()
    }
}
