//
//  TabContentView.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import SwiftUI

struct CartTabView: View {
    
    var tab: Tab = .cart
    
    var body: some View {
        Text("Cart Tab View")
    }

}

struct CartTabView_Previews: PreviewProvider {
    static var previews: some View {
        CartTabView()
    }
}
