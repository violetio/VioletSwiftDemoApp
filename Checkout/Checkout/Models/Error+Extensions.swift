//
//  Error+Extensions.swift
//  Checkout
//
//  Created by Alan Morford on 5/1/23.
//

import VioletPublicClientAPI
import Foundation

public extension Error {
    
    func errorResponse_HttpCode() -> Int? {
        if let errorResponse = self as? ErrorResponse {
            if case let .error(int, _, _, _) = errorResponse {
                return int
            }
        }
        return nil
    }
    
    func isErrorResponse_401() -> Bool {
        return errorResponse_HttpCode() == 401
    }
    
}
