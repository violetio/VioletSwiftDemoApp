//
//  APICall.swift
//  Checkout
//
//  Created on 4/26/23
//

import Combine
import Foundation
import SwiftUI
import VioletPublicClientAPI

struct ApiCallCounting {
    static var CallCounter: Int = 0
    static func NextCallCount() -> Int {
        CallCounter += 1
        return CallCounter
    }
}

class APIQueueItem: Hashable {
    static func == (lhs: APIQueueItem, rhs: APIQueueItem) -> Bool {
        return lhs.callCount == rhs.callCount
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(callCount)
    }
    let callCount: Int = ApiCallCounting.NextCallCount()
    let baseApiCall: BaseAPICall

    init(baseApiCall: BaseAPICall) {
        self.baseApiCall = baseApiCall
    }
}

class APICall<T, DataResponseType: Codable>: APIQueueItem where T: DataResponseAPICall<DataResponseType> {

    let dataResponseAPICall: T

    init(apiCall: T) {
        self.dataResponseAPICall = apiCall
        super.init(baseApiCall: apiCall)
    }

    func send(receiveResponse: @escaping T.SinkResponse) {
        dataResponseAPICall.sinkResponse(receiveResponse: receiveResponse)
        dataResponseAPICall.send()
    }
}

enum PendingNoOverlap: CaseIterable {
    case login
    case refreshToken
    case pageOffers
    case createCart
    case getOrderById
    case cartCustomer
    case getShippingMethods
}
