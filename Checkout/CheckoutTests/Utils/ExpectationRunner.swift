//
//  ExpectationRunner.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/27/23.
//

@testable import Checkout
import Combine
import XCTest

class ExpectationRunner {
    let expectation = XCTestExpectation(description: "CallCompleted True")
    let baseAPICall: BaseAPICall
    var streamHandle: AnyCancellable?
    var expectations: [XCTestExpectation] {
        return [self.expectation]
    }

    init(_ baseAPICall: BaseAPICall) {
        self.baseAPICall = baseAPICall
    }

    private func publisher() -> Publishers.Drop<Published<Bool>.Publisher> {
        return self.baseAPICall.$callCompleted.dropFirst()
    }

    typealias PublisherOutput = Publishers.Drop<Published<Bool>.Publisher>.Output

    func sink(outputValue: @escaping ((PublisherOutput) -> Void)) {
        self.streamHandle = self.publisher()
            .sink(receiveValue: {
                outputValue($0)
                self.expectation.fulfill()
            })
    }
}
