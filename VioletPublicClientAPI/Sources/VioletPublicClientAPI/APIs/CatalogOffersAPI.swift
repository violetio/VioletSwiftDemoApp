//
// CatalogOffersAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class CatalogOffersAPI {

    /**
     Get Offer by ID
     
     - parameter offerId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func catalogOffersOfferIdGet(offerId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: Offer?, _ error: Error?) -> Void)) -> RequestTask {
        return catalogOffersOfferIdGetWithRequestBuilder(offerId: offerId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Offer by ID
     - GET /catalog/offers/{offer_id}
     - Retrieves a single offer by ID.
     - parameter offerId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - returns: RequestBuilder<Offer> 
     */
    open class func catalogOffersOfferIdGetWithRequestBuilder(offerId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil) -> RequestBuilder<Offer> {
        var localVariablePath = "/catalog/offers/{offer_id}"
        let offerIdPreEscape = "\(APIHelper.mapValueToPathItem(offerId))"
        let offerIdPostEscape = offerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{offer_id}", with: offerIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Offer>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
