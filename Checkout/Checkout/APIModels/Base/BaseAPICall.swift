//
//  BaseAPICall.swift
//  Checkout
//
//  Created on 3/15/23.
//

import Combine
import SwiftUI
import Violet

/**
 Extract errorResponse into BaseAPICall
 */
class BaseAPICall: ObservableObject {
    @Published var callCompleted = false
    var errorResponse: Error? = nil
    private var cancellables = Set<AnyCancellable>()

    func callIsCompleted(errorResponse: Error? = nil) {
        self.errorResponse = errorResponse
        callCompleted = true
    }

    func sinkCompleted(receiveValue: @escaping ((Bool) -> Void)) {
        $callCompleted.sink(receiveValue: receiveValue)
            .store(in: &cancellables)
    }
}
