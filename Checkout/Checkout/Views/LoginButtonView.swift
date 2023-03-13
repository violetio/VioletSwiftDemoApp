//
//  LoginButtonView.swift
//  Checkout
//
//  Created by Alan Morford on 3/10/23.
//

import SwiftUI

struct LoginButtonView: View {
    
    let caller = APICallRunner()
    var body: some View {
        Button("Login") {
            print("---- Start Login Action")
            caller.loginPost()
            print("---- Completed Login Action")
        }.padding(6)
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView()
    }
}
