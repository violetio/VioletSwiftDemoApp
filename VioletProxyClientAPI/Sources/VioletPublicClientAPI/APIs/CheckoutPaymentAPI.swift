//
// CheckoutPaymentAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class CheckoutPaymentAPI {

    /**
     Apply Payment Method
     
     - parameter xVioletToken: (header)  
     - parameter xVioletAppSecret: (header)  
     - parameter xVioletAppId: (header)  
     - parameter cartId: (path)  
     - parameter priceCart: (query)  (optional, default to false)
     - parameter body: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func checkoutCartCartIdPaymentPost(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, priceCart: Bool? = nil, body: PaymentMethodRequest? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPIAPI.apiResponseQueue, completion: @escaping ((_ data: Order?, _ error: Error?) -> Void)) -> RequestTask {
        return checkoutCartCartIdPaymentPostWithRequestBuilder(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId, priceCart: priceCart, body: body).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Apply Payment Method
     - POST /checkout/cart/{cart_id}/payment
     - parameter xVioletToken: (header)  
     - parameter xVioletAppSecret: (header)  
     - parameter xVioletAppId: (header)  
     - parameter cartId: (path)  
     - parameter priceCart: (query)  (optional, default to false)
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<Order> 
     */
    open class func checkoutCartCartIdPaymentPostWithRequestBuilder(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, priceCart: Bool? = nil, body: PaymentMethodRequest? = nil) -> RequestBuilder<Order> {
        var localVariablePath = "/checkout/cart/{cart_id}/payment"
        let cartIdPreEscape = "\(APIHelper.mapValueToPathItem(cartId))"
        let cartIdPostEscape = cartIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{cart_id}", with: cartIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPIAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "price_cart": (wrappedValue: priceCart?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Order>.Type = VioletPublicClientAPIAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Get Stripe Public Token
     
     - parameter xVioletToken: (header)  
     - parameter xVioletAppSecret: (header)  
     - parameter xVioletAppId: (header)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func checkoutPaymentTokenGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, apiResponseQueue: DispatchQueue = VioletPublicClientAPIAPI.apiResponseQueue, completion: @escaping ((_ data: CurrentPaymentToken?, _ error: Error?) -> Void)) -> RequestTask {
        return checkoutPaymentTokenGetWithRequestBuilder(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Stripe Public Token
     - GET /checkout/payment/token
     - Obtain the current Stripe Publishable Key for use in tokenizing payment card data with the <a target='_blank' href='https://stripe.com/docs/stripe-js/reference#stripe-create-token'>Stripe.js library</a>.
     - parameter xVioletToken: (header)  
     - parameter xVioletAppSecret: (header)  
     - parameter xVioletAppId: (header)  
     - returns: RequestBuilder<CurrentPaymentToken> 
     */
    open class func checkoutPaymentTokenGetWithRequestBuilder(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64) -> RequestBuilder<CurrentPaymentToken> {
        let localVariablePath = "/checkout/payment/token"
        let localVariableURLString = VioletPublicClientAPIAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<CurrentPaymentToken>.Type = VioletPublicClientAPIAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
