# OrdersAPI

All URIs are relative to *https://sandbox-api.violet.io:443/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ordersGet**](OrdersAPI.md#ordersget) | **GET** /orders | Get Orders
[**ordersOrderIdGet**](OrdersAPI.md#ordersorderidget) | **GET** /orders/{order_id} | Get Order by ID
[**ordersSearchPost**](OrdersAPI.md#orderssearchpost) | **POST** /orders/search | Search Orders


# **ordersGet**
```swift
    open class func ordersGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, page: Int? = nil, size: Int? = nil, completion: @escaping (_ data: PageOrder?, _ error: Error?) -> Void)
```

Get Orders

Returns a paginated list of orders. <br><br>Orders are limited to those placed by your app.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let page = 987 // Int |  (optional) (default to 1)
let size = 987 // Int |  (optional) (default to 20)

// Get Orders
OrdersAPI.ordersGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, page: page, size: size) { (response, error) in
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
 **page** | **Int** |  | [optional] [default to 1]
 **size** | **Int** |  | [optional] [default to 20]

### Return type

[**PageOrder**](PageOrder.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ordersOrderIdGet**
```swift
    open class func ordersOrderIdGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, orderId: Int64, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Get Order by ID

Retrieves a single order by ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let orderId = 987 // Int64 | 

// Get Order by ID
OrdersAPI.ordersOrderIdGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, orderId: orderId) { (response, error) in
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
 **orderId** | **Int64** |  | 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ordersSearchPost**
```swift
    open class func ordersSearchPost(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, page: Int? = nil, size: Int? = nil, body: OrderSearchRequest? = nil, completion: @escaping (_ data: PageOrder?, _ error: Error?) -> Void)
```

Search Orders

Performs a paginated search of all orders. Orders can be searched by 'merchant_id', 'user_id', or a combination of both. <br><br>Orders are limited to those placed by your app.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let page = 987 // Int |  (optional) (default to 1)
let size = 987 // Int |  (optional) (default to 20)
let body = OrderSearchRequest(userId: 123, merchantId: 123, referralId: "referralId_example") // OrderSearchRequest |  (optional)

// Search Orders
OrdersAPI.ordersSearchPost(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, page: page, size: size, body: body) { (response, error) in
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
 **page** | **Int** |  | [optional] [default to 1]
 **size** | **Int** |  | [optional] [default to 20]
 **body** | [**OrderSearchRequest**](OrderSearchRequest.md) |  | [optional] 

### Return type

[**PageOrder**](PageOrder.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

