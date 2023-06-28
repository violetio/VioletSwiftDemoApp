//
// CatalogCategoriesAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class CatalogCategoriesAPI {

    /**
     Get Categories
     
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter page: (query)  (optional, default to 1)
     - parameter size: (query)  (optional, default to 20)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func catalogCategoriesGet(xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, page: Int? = nil, size: Int? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: [Category]?, _ error: Error?) -> Void)) -> RequestTask {
        return catalogCategoriesGetWithRequestBuilder(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, page: page, size: size).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Categories
     - GET /catalog/categories
     - Retreives a paginated list of all available categories.
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter page: (query)  (optional, default to 1)
     - parameter size: (query)  (optional, default to 20)
     - returns: RequestBuilder<[Category]> 
     */
    open class func catalogCategoriesGetWithRequestBuilder(xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, page: Int? = nil, size: Int? = nil) -> RequestBuilder<[Category]> {
        let localVariablePath = "/catalog/categories"
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": (wrappedValue: page?.encodeToJSON(), isExplode: true),
            "size": (wrappedValue: size?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[Category]>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Get Category by ID
     
     - parameter id: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func catalogCategoriesIdGet(id: String, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: Category?, _ error: Error?) -> Void)) -> RequestTask {
        return catalogCategoriesIdGetWithRequestBuilder(id: id, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Category by ID
     - GET /catalog/categories/{id}
     - Retrieves a single category by ID.
     - parameter id: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - returns: RequestBuilder<Category> 
     */
    open class func catalogCategoriesIdGetWithRequestBuilder(id: String, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil) -> RequestBuilder<Category> {
        var localVariablePath = "/catalog/categories/{id}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Category>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Get Category Tree
     
     - parameter id: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func catalogCategoriesIdTreeGet(id: String, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: [Category]?, _ error: Error?) -> Void)) -> RequestTask {
        return catalogCategoriesIdTreeGetWithRequestBuilder(id: id, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Category Tree
     - GET /catalog/categories/{id}/tree
     - Retreives the category tree by ID.
     - parameter id: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - returns: RequestBuilder<[Category]> 
     */
    open class func catalogCategoriesIdTreeGetWithRequestBuilder(id: String, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil) -> RequestBuilder<[Category]> {
        var localVariablePath = "/catalog/categories/{id}/tree"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[Category]>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Search Categories
     
     - parameter query: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter page: (query)  (optional, default to 1)
     - parameter size: (query)  (optional, default to 20)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func catalogCategoriesSearchQueryGet(query: String, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, page: Int? = nil, size: Int? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: [Category]?, _ error: Error?) -> Void)) -> RequestTask {
        return catalogCategoriesSearchQueryGetWithRequestBuilder(query: query, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, page: page, size: size).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Search Categories
     - GET /catalog/categories/search/{query}
     - Performs a paginated search of all categories where name matches query.
     - parameter query: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter page: (query)  (optional, default to 1)
     - parameter size: (query)  (optional, default to 20)
     - returns: RequestBuilder<[Category]> 
     */
    open class func catalogCategoriesSearchQueryGetWithRequestBuilder(query: String, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, page: Int? = nil, size: Int? = nil) -> RequestBuilder<[Category]> {
        var localVariablePath = "/catalog/categories/search/{query}"
        let queryPreEscape = "\(APIHelper.mapValueToPathItem(query))"
        let queryPostEscape = queryPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{query}", with: queryPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": (wrappedValue: page?.encodeToJSON(), isExplode: true),
            "size": (wrappedValue: size?.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[Category]>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Get Category by Slug
     
     - parameter slug: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func catalogCategoriesSlugSlugGet(slug: String, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPI.apiResponseQueue, completion: @escaping ((_ data: Category?, _ error: Error?) -> Void)) -> RequestTask {
        return catalogCategoriesSlugSlugGetWithRequestBuilder(slug: slug, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Category by Slug
     - GET /catalog/categories/slug/{slug}
     - Retrieves a single category by slug.
     - parameter slug: (path)  
     - parameter xVioletToken: (header)  (optional)
     - parameter xVioletAppSecret: (header)  (optional)
     - parameter xVioletAppId: (header)  (optional)
     - returns: RequestBuilder<Category> 
     */
    open class func catalogCategoriesSlugSlugGetWithRequestBuilder(slug: String, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil) -> RequestBuilder<Category> {
        var localVariablePath = "/catalog/categories/slug/{slug}"
        let slugPreEscape = "\(APIHelper.mapValueToPathItem(slug))"
        let slugPostEscape = slugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{slug}", with: slugPostEscape, options: .literal, range: nil)
        let localVariableURLString = VioletPublicClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken?.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret?.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId?.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Category>.Type = VioletPublicClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
