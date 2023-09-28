//
//  DemoChannelViewState.swift
//  Checkout
//
//  Created on 5/5/23
//

import Foundation

class DemoProxyActiveViewState: ObservableObject {

    @Published var apiError: Error? = nil
    @Published var proxyWorking: Bool = true
    
    func setError(apiError: Error) {
        self.apiError = apiError
        self.proxyWorking = false
    }
    
    func clearError() {
        self.apiError = nil
        self.proxyWorking = true
    }

}
