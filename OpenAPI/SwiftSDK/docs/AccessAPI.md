# AccessAPI

All URIs are relative to *https://sandbox-api.violet.io:443/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authTokenGet**](AccessAPI.md#authtokenget) | **GET** /auth/token | Refresh Token
[**loginPost**](AccessAPI.md#loginpost) | **POST** /login | Login


# **authTokenGet**
```swift
    open class func authTokenGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, completion: @escaping (_ data: RefreshTokenResponse?, _ error: Error?) -> Void)
```

Refresh Token

Refreshes a Users token. Pass the \"refresh_token\" value provided in the response body of a login request in the \"X-Violet-Token\" header.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 

// Refresh Token
AccessAPI.authTokenGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xVioletToken** | **String** |  | 
 **xVioletAppSecret** | **String** |  | 
 **xVioletAppId** | **Int64** |  | 

### Return type

[**RefreshTokenResponse**](RefreshTokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginPost**
```swift
    open class func loginPost(xVioletAppSecret: String, xVioletAppId: Int64, body: LoginRequest? = nil, completion: @escaping (_ data: LoginResponse?, _ error: Error?) -> Void)
```

Login

Log into an existing Violet account with a username and password. If sucessful an access token will be returned in the response body for use in additional requests against the API.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let body = LoginRequest(username: "username_example", password: "password_example") // LoginRequest |  (optional)

// Login
AccessAPI.loginPost(xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, body: body) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **xVioletAppSecret** | **String** |  | 
 **xVioletAppId** | **Int64** |  | 
 **body** | [**LoginRequest**](LoginRequest.md) |  | [optional] 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
