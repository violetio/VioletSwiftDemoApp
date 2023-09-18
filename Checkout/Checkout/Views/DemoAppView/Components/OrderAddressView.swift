//
//  OrderAddressView.swift
//  Checkout
//
//  Created on 8/22/23
//

import SwiftUI

struct OrderAddressView: View {
    @ObservedObject var orderAddressViewState: OrderAddressViewState
    
    var body: some View {
        VStack(alignment: .leading) {            
            FormTextField(orderAddressViewState.firstNamePrompt, text: $orderAddressViewState.firstName)
            FormTextField(orderAddressViewState.lastNamePrompt, text: $orderAddressViewState.lastName)
            FormTextField(orderAddressViewState.addressLine1Prompt, text: $orderAddressViewState.address1)
            FormTextField(orderAddressViewState.addressLine2Prompt, text: $orderAddressViewState.address2)
            FormTextField(orderAddressViewState.cityPrompt, text: $orderAddressViewState.city)
            FormTextField(orderAddressViewState.statePrompt, text: $orderAddressViewState.state)
            FormTextField(orderAddressViewState.postalCodePrompt, text: $orderAddressViewState.postalCode)
            
            Menu {
                Picker("Country", selection: $orderAddressViewState.country) {
                    ForEach(CountryCodesArray.loadJson(), id: \.self) { pickValue in
                        Text(pickValue).font(.system(size: 12, weight: .semibold))//.tag(pickValue)
                    }
                }
            } label: {
                LabeledContent("Country", value: orderAddressViewState.country)
                    .font(Font.custom("SF Pro Text", size: 12))
                    .padding(.horizontal)
                    .frame(width: 340, height: 44)
                    .foregroundColor(.black)
            }
            .background(Color.white)
            .cornerRadius(12)
            .padding(.vertical, 5)
            
        }
    }
}

struct OrderAddressView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            OrderAddressView(orderAddressViewState: OrderAddressViewState())
        }.frame(width: 390)
            .navigationTitle("Guest Checkout").withScrollViewBackgroundColor()
    }
}

