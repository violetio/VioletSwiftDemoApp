//
//  DemoAppGuestCheckoutView.swift
//  Checkout
//
//  Created on 8/21/23
//

import SwiftUI

struct DemoAppGuestCheckoutView: View {
    
    @ObservedObject var guestCheckoutViewState: GuestCheckoutViewState
    var body: some View {
        VStack {
            Form {
                TextField("Email", text: $guestCheckoutViewState.email)

                TextField("FullName", text: $guestCheckoutViewState.fullName)
            }.formStyle(.grouped)
            

                    
        }
    }
}

struct DemoAppGuestCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppGuestCheckoutView(guestCheckoutViewState: GuestCheckoutViewState())
    }
}
