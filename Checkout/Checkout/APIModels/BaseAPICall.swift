//
//  BaseAPICall.swift
//  Checkout
//
//  Created by Alan Morford on 3/15/23.
//

import SwiftUI
import VioletPublicClientAPI

class BaseAPICall: ObservableObject {

    @Published var callCompleted = false

    func callIsCompleted() {
        self.callCompleted = true
    }

}
