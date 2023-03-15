//
//  LoginButtonView.swift
//  Checkout
//
//  Created by Alan Morford on 3/10/23.
//

import SwiftUI
import VioletPublicClientAPI

struct LoginButtonView: View {
    
    @StateObject var loginPostRequest = LoginPostRequest(appCreds: AppCreds.SandBoxTestCreds_Alan())
    var body: some View {
        if loginPostRequest.callCompleted {
            Text("Logged In").bold()
            let token_prefix: String = loginPostRequest.dataResponse?.token?.prefix(9).debugDescription ?? "-"
            Text("Token: \(token_prefix)").bold()
            
        } else {
            Button("Login") {
                print("---- Start Login Action")
                loginPostRequest.send()
                
            }.padding(6)

        }
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView()
    }
}
