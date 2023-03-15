//
// CatalogSkusAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class CatalogSkusAPI {

    /**
     Get Sku by ID
     
     - parameter skuId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func catalogSkusSkuIdGet(skuId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: Sku?, _ error: Error?) -> Void)) -> RequestTask {
        return catalogSkusSkuIdGetWithRequestBuilder(skuId: skuId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Sku by ID
     - GET /catalog/skus/{sku_id}
     - Retreives a single SKU by ID.
     - parameter skuId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - returns: RequestBuilder<Sku> 
     */
    open class func catalogSkusSkuIdGetWithRequestBuilder(skuId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil) -> RequestBuilder<Sku> {
        var localVariablePath = "/catalog/skus/{sku_id}"
        let skuIdPreEscape = "\(APIHelper.mapValueToPathItem(skuId))"
        let skuIdPostEscape = skuIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{sku_id}", with: skuIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Sku>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}