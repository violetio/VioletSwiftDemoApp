//
//  DataResponseAPICall.swift
//  Checkout
//
//  Created by Alan Morford on 3/23/23.
//

/**
    Extract a common generic type `DataResponseAPICall`
        to capture the 'dataResponse' from an API Call typed to the call being made.
 */
class DataResponseAPICall<DataResponseType>: BaseAPICall {
    
    var dataResponse: DataResponseType? = nil
    
    func callIsCompleted(errorResponse: Error? = nil, dataResponse: DataResponseType? = nil) {
        self.dataResponse = dataResponse
        super.callIsCompleted(errorResponse: errorResponse)
    }
    
    override func callIsCompleted(errorResponse: Error? = nil) {
        super.callIsCompleted(errorResponse: errorResponse)
    }
}
