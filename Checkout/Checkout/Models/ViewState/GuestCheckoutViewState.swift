//
//  GuestCheckoutViewState.swift
//  Checkout
//
//  Created on 8/21/23
//

import Foundation
import Violet

class GuestCheckoutViewState: ObservableObject {
    @Published var email: String = ""
    @Published var fullName: String = ""
    
    init() {}
}
