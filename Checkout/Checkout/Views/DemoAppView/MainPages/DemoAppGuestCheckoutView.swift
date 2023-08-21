//
//  DemoAppGuestCheckoutView.swift
//  Checkout
//
//  Created on 8/21/23
//

import SwiftUI

struct DemoAppGuestCheckoutView: View {
    
    @State var email: String = ""
    @State var fullName: String = ""
    var body: some View {
        VStack {
            Form {
                TextField("Email", text: $email)

                TextField("FullName", text: $fullName)
            }.formStyle(.grouped)
            

                    
        }
    }
}

struct DemoAppGuestCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppGuestCheckoutView()
    }
}
