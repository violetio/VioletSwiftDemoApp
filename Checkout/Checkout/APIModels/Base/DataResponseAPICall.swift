//
//  DataResponseAPICall.swift
//  Checkout
//
//  Created by Alan Morford on 3/23/23.
//

import VioletPublicClientAPI
/**
    Extract a common generic type `DataResponseAPICall`
        to capture the 'dataResponse' from an API Call typed to the call being made.
    
    Added Type Contraint <DataResponseType: Codable> to better constraint this to ONLY types returning from an APICall. Now atleast cannot simply be anything,
 
 */
class DataResponseAPICall<DataResponseType: Codable>: BaseAPICall {
    var dataResponse: DataResponseType? = nil
    
    func callIsCompleted(errorResponse: Error? = nil, dataResponse: DataResponseType? = nil) {
        self.dataResponse = dataResponse
        super.callIsCompleted(errorResponse: errorResponse)
    }
    
    override func callIsCompleted(errorResponse: Error? = nil) {
        super.callIsCompleted(errorResponse: errorResponse)
    }
    
    func logError(_ error: Error?) {
        Logger.error(error)
    }
}
