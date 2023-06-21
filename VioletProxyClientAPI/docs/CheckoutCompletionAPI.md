# CheckoutCompletionAPI

All URIs are relative to *https://sandbox-api.violet.io:443/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkoutCartCartIdPriceGet**](CheckoutCompletionAPI.md#checkoutcartcartidpriceget) | **GET** /checkout/cart/{cart_id}/price | Price Cart
[**checkoutCartCartIdSubmitPost**](CheckoutCompletionAPI.md#checkoutcartcartidsubmitpost) | **POST** /checkout/cart/{cart_id}/submit | Submit Cart


# **checkoutCartCartIdPriceGet**
```swift
    open class func checkoutCartCartIdPriceGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Price Cart

Prices the cart. This includes the calculation of shipping and tax rates. Before pricing a cart the shipping address, billing address, shipping method, and any SKUs should be applied to the cart.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let cartId = 987 // Int64 | 

// Price Cart
CheckoutCompletionAPI.checkoutCartCartIdPriceGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId) { (response, error) in
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
 **cartId** | **Int64** |  | 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutCartCartIdSubmitPost**
```swift
    open class func checkoutCartCartIdSubmitPost(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Submit Cart

Submits a cart. For each unique bag in your cart an order will be submitted to the source merchant's platform. Depending on the number of bags in your cart this request can take a few moments as each external order is submitted.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let cartId = 987 // Int64 | 

// Submit Cart
CheckoutCompletionAPI.checkoutCartCartIdSubmitPost(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId) { (response, error) in
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
 **cartId** | **Int64** |  | 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

