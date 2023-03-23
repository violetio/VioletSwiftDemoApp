//
//  BaseAPICall.swift
//  Checkout
//
//  Created by Alan Morford on 3/15/23.
//

import SwiftUI
import VioletPublicClientAPI

/**
 Extract errorResponse into BaseAPICall
 */
class BaseAPICall: ObservableObject {

    @Published var callCompleted = false
    var errorResponse: Error? = nil

    func callIsCompleted(errorResponse: Error? = nil) {
        self.errorResponse = errorResponse
        self.callCompleted = true
    }

}

