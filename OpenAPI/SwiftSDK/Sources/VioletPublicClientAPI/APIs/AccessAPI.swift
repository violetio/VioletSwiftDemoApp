//
// AccessAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class AccessAPI {

    /**
     Refresh Token
     
     - parameter xVioletToken: (header)  
     - parameter xVioletAppSecret: (header)  
     - parameter xVioletAppId: (header)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func authTokenGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, apiResponseQueue: DispatchQueue = VioletPublicClientAPIAPI.apiResponseQueue, completion: @escaping ((_ data: RefreshTokenResponse?, _ error: Error?) -> Void)) -> RequestTask {
        return authTokenGetWithRequestBuilder(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Refresh Token
     - GET /auth/token
     - Refreshes a Users token. Pass the \"refresh_token\" value provided in the response body of a login request in the \"X-Violet-Token\" header.
     - parameter xVioletToken: (header)  
     - parameter xVioletAppSecret: (header)  
     - parameter xVioletAppId: (header)  
     - returns: RequestBuilder<RefreshTokenResponse> 
     */
    open class func authTokenGetWithRequestBuilder(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64) -> RequestBuilder<RefreshTokenResponse> {
        let localVariablePath = "/auth/token"
        let localVariableURLString = VioletPublicClientAPIAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-Token": xVioletToken.encodeToJSON(),
            "X-Violet-App-Secret": xVioletAppSecret.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<RefreshTokenResponse>.Type = VioletPublicClientAPIAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Login
     
     - parameter xVioletAppSecret: (header)  
     - parameter xVioletAppId: (header)  
     - parameter body: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func loginPost(xVioletAppSecret: String, xVioletAppId: Int64, body: LoginRequest? = nil, apiResponseQueue: DispatchQueue = VioletPublicClientAPIAPI.apiResponseQueue, completion: @escaping ((_ data: LoginResponse?, _ error: Error?) -> Void)) -> RequestTask {
        return loginPostWithRequestBuilder(xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, body: body).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Login
     - POST /login
     - Log into an existing Violet account with a username and password. If sucessful an access token will be returned in the response body for use in additional requests against the API.
     - parameter xVioletAppSecret: (header)  
     - parameter xVioletAppId: (header)  
     - parameter body: (body)  (optional)
     - returns: RequestBuilder<LoginResponse> 
     */
    open class func loginPostWithRequestBuilder(xVioletAppSecret: String, xVioletAppId: Int64, body: LoginRequest? = nil) -> RequestBuilder<LoginResponse> {
        let localVariablePath = "/login"
        let localVariableURLString = VioletPublicClientAPIAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "X-Violet-App-Secret": xVioletAppSecret.encodeToJSON(),
            "X-Violet-App-Id": xVioletAppId.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<LoginResponse>.Type = VioletPublicClientAPIAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}