//
// EventsWebhookHeadersAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class EventsWebhookHeadersAPI {

    /**
     Create Webhook Header
     
     - parameter webhookId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter appId: (query)  (optional)
     - parameter body: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func createWebhookHeader1(webhookId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, body: WebhookHeader? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: WebhookHeader?, _ error: Error?) -> Void)) -> RequestTask {
        return createWebhookHeader1WithRequestBuilder(webhookId: webhookId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, appId: appId, body: body).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Create Webhook Header
     - POST /events/webhooks/{webhook_id}/headers
     - Creates a new Webhook Header.
     - parameter webhookId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter appId: (query)  (optional)
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<WebhookHeader> 
     */
    open class func createWebhookHeader1WithRequestBuilder(webhookId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, body: WebhookHeader? = nil) -> RequestBuilder<WebhookHeader> {
        var localVariablePath = "/events/webhooks/{webhook_id}/headers"
        let webhookIdPreEscape = "\(APIHelper.mapValueToPathItem(webhookId))"
        let webhookIdPostEscape = webhookIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{webhook_id}", with: webhookIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "app_id": (wrappedValue: appId?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<WebhookHeader>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Delete Webhook Header
     
     - parameter webhookId: (path)  
     - parameter headerId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter appId: (query)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func deleteWebhookHeader1(webhookId: Int, headerId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) -> RequestTask {
        return deleteWebhookHeader1WithRequestBuilder(webhookId: webhookId, headerId: headerId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, appId: appId).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion((), nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Delete Webhook Header
     - DELETE /events/webhooks/{webhook_id}/headers/{header_id}
     - Deletes Webhook Header.
     - parameter webhookId: (path)  
     - parameter headerId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter appId: (query)  (optional)
     - returns: RequestBuilder<Void> 
     */
    open class func deleteWebhookHeader1WithRequestBuilder(webhookId: Int, headerId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil) -> RequestBuilder<Void> {
        var localVariablePath = "/events/webhooks/{webhook_id}/headers/{header_id}"
        let webhookIdPreEscape = "\(APIHelper.mapValueToPathItem(webhookId))"
        let webhookIdPostEscape = webhookIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{webhook_id}", with: webhookIdPostEscape, options: .literal, range: nil)
        let headerIdPreEscape = "\(APIHelper.mapValueToPathItem(headerId))"
        let headerIdPostEscape = headerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{header_id}", with: headerIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "app_id": (wrappedValue: appId?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = VioletPublicClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Get Webhook Header
     
     - parameter webhookId: (path)  
     - parameter headerId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter appId: (query)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getWebhookHeaderById1(webhookId: Int, headerId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: WebhookHeader?, _ error: Error?) -> Void)) -> RequestTask {
        return getWebhookHeaderById1WithRequestBuilder(webhookId: webhookId, headerId: headerId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, appId: appId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Webhook Header
     - GET /events/webhooks/{webhook_id}/headers/{header_id}
     - Retrieves a Webhook Header by ID.
     - parameter webhookId: (path)  
     - parameter headerId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter appId: (query)  (optional)
     - returns: RequestBuilder<WebhookHeader> 
     */
    open class func getWebhookHeaderById1WithRequestBuilder(webhookId: Int, headerId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil) -> RequestBuilder<WebhookHeader> {
        var localVariablePath = "/events/webhooks/{webhook_id}/headers/{header_id}"
        let webhookIdPreEscape = "\(APIHelper.mapValueToPathItem(webhookId))"
        let webhookIdPostEscape = webhookIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{webhook_id}", with: webhookIdPostEscape, options: .literal, range: nil)
        let headerIdPreEscape = "\(APIHelper.mapValueToPathItem(headerId))"
        let headerIdPostEscape = headerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{header_id}", with: headerIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "app_id": (wrappedValue: appId?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<WebhookHeader>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Get Webhook Headers
     
     - parameter webhookId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter appId: (query)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getWebhookHeaders1(webhookId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: [WebhookHeader]?, _ error: Error?) -> Void)) -> RequestTask {
        return getWebhookHeaders1WithRequestBuilder(webhookId: webhookId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, appId: appId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Webhook Headers
     - GET /events/webhooks/{webhook_id}/headers
     - Retrieves a list of WebhookHeaders by WebhookId.
     - parameter webhookId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter appId: (query)  (optional)
     - returns: RequestBuilder<[WebhookHeader]> 
     */
    open class func getWebhookHeaders1WithRequestBuilder(webhookId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil) -> RequestBuilder<[WebhookHeader]> {
        var localVariablePath = "/events/webhooks/{webhook_id}/headers"
        let webhookIdPreEscape = "\(APIHelper.mapValueToPathItem(webhookId))"
        let webhookIdPostEscape = webhookIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{webhook_id}", with: webhookIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "app_id": (wrappedValue: appId?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[WebhookHeader]>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Update Webhook Header
     
     - parameter webhookId: (path)  
     - parameter headerId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter appId: (query)  (optional)
     - parameter body: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func updateWebhookHeader1(webhookId: Int, headerId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, body: WebhookHeader? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: WebhookHeader?, _ error: Error?) -> Void)) -> RequestTask {
        return updateWebhookHeader1WithRequestBuilder(webhookId: webhookId, headerId: headerId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, appId: appId, body: body).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Update Webhook Header
     - PUT /events/webhooks/{webhook_id}/headers/{header_id}
     - Updates Webhook Header.
     - parameter webhookId: (path)  
     - parameter headerId: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter appId: (query)  (optional)
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<WebhookHeader> 
     */
    open class func updateWebhookHeader1WithRequestBuilder(webhookId: Int, headerId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, body: WebhookHeader? = nil) -> RequestBuilder<WebhookHeader> {
        var localVariablePath = "/events/webhooks/{webhook_id}/headers/{header_id}"
        let webhookIdPreEscape = "\(APIHelper.mapValueToPathItem(webhookId))"
        let webhookIdPostEscape = webhookIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{webhook_id}", with: webhookIdPostEscape, options: .literal, range: nil)
        let headerIdPreEscape = "\(APIHelper.mapValueToPathItem(headerId))"
        let headerIdPostEscape = headerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{header_id}", with: headerIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "app_id": (wrappedValue: appId?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<WebhookHeader>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PUT", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
