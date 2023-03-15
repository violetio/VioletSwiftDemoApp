//
// CheckoutItemsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class CheckoutItemsAPI {

    /**
     Remove SKU from Cart
     
     - parameter cartId: (path)  
     - parameter orderSkuId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter priceCart: (query)  (optional, default to false)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func checkoutCartCartIdSkusOrderSkuIdDelete(cartId: Int64, orderSkuId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: Order?, _ error: Error?) -> Void)) -> RequestTask {
        return checkoutCartCartIdSkusOrderSkuIdDeleteWithRequestBuilder(cartId: cartId, orderSkuId: orderSkuId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, priceCart: priceCart).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Remove SKU from Cart
     - DELETE /checkout/cart/{cart_id}/skus/{order_sku_id}
     - Removes a cart SKU by its ID.
     - parameter cartId: (path)  
     - parameter orderSkuId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter priceCart: (query)  (optional, default to false)
     - returns: RequestBuilder<Order> 
     */
    open class func checkoutCartCartIdSkusOrderSkuIdDeleteWithRequestBuilder(cartId: Int64, orderSkuId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil) -> RequestBuilder<Order> {
        var localVariablePath = "/checkout/cart/{cart_id}/skus/{order_sku_id}"
        let cartIdPreEscape = "\(APIHelper.mapValueToPathItem(cartId))"
        let cartIdPostEscape = cartIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{cart_id}", with: cartIdPostEscape, options: .literal, range: nil)
        let orderSkuIdPreEscape = "\(APIHelper.mapValueToPathItem(orderSkuId))"
        let orderSkuIdPostEscape = orderSkuIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{order_sku_id}", with: orderSkuIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "price_cart": (wrappedValue: priceCart?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Order>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Update SKU in Cart
     
     - parameter cartId: (path)  
     - parameter orderSkuId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter priceCart: (query)  (optional, default to false)
     - parameter body: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func checkoutCartCartIdSkusOrderSkuIdPut(cartId: Int64, orderSkuId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil, body: OrderSku? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: Order?, _ error: Error?) -> Void)) -> RequestTask {
        return checkoutCartCartIdSkusOrderSkuIdPutWithRequestBuilder(cartId: cartId, orderSkuId: orderSkuId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, priceCart: priceCart, body: body).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update SKU in Cart
     - PUT /checkout/cart/{cart_id}/skus/{order_sku_id}
     - Modifies a cart SKU by its ID.
     - parameter cartId: (path)  
     - parameter orderSkuId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter priceCart: (query)  (optional, default to false)
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<Order> 
     */
    open class func checkoutCartCartIdSkusOrderSkuIdPutWithRequestBuilder(cartId: Int64, orderSkuId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil, body: OrderSku? = nil) -> RequestBuilder<Order> {
        var localVariablePath = "/checkout/cart/{cart_id}/skus/{order_sku_id}"
        let cartIdPreEscape = "\(APIHelper.mapValueToPathItem(cartId))"
        let cartIdPostEscape = cartIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{cart_id}", with: cartIdPostEscape, options: .literal, range: nil)
        let orderSkuIdPreEscape = "\(APIHelper.mapValueToPathItem(orderSkuId))"
        let orderSkuIdPostEscape = orderSkuIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{order_sku_id}", with: orderSkuIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "price_cart": (wrappedValue: priceCart?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Order>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Add SKU to Cart
     
     - parameter cartId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter priceCart: (query)  (optional, default to false)
     - parameter body: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func checkoutCartCartIdSkusPost(cartId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil, body: OrderSku? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: Order?, _ error: Error?) -> Void)) -> RequestTask {
        return checkoutCartCartIdSkusPostWithRequestBuilder(cartId: cartId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, priceCart: priceCart, body: body).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Add SKU to Cart
     - POST /checkout/cart/{cart_id}/skus
     - Adds a SKU to the cart by its ID. Quantity will default to 1 if no quantity is passed. Quantities greater than 10 will default to 10.
     - parameter cartId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter priceCart: (query)  (optional, default to false)
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<Order> 
     */
    open class func checkoutCartCartIdSkusPostWithRequestBuilder(cartId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil, body: OrderSku? = nil) -> RequestBuilder<Order> {
        var localVariablePath = "/checkout/cart/{cart_id}/skus"
        let cartIdPreEscape = "\(APIHelper.mapValueToPathItem(cartId))"
        let cartIdPostEscape = cartIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{cart_id}", with: cartIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "price_cart": (wrappedValue: priceCart?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Order>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}