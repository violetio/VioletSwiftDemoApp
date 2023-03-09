# CheckoutShippingAPI

All URIs are relative to *http://sandbox-api.violet.io/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkoutCartCartIdShippingAvailableGet**](CheckoutShippingAPI.md#checkoutcartcartidshippingavailableget) | **GET** /checkout/cart/{cart_id}/shipping/available | Get Available Shipping Methods
[**checkoutCartCartIdShippingPost**](CheckoutShippingAPI.md#checkoutcartcartidshippingpost) | **POST** /checkout/cart/{cart_id}/shipping | Set Shipping Methods
[**checkoutCartCartIdShippingShippingMethodIdDelete**](CheckoutShippingAPI.md#checkoutcartcartidshippingshippingmethodiddelete) | **DELETE** /checkout/cart/{cart_id}/shipping/{shipping_method_id} | Remove Shipping Method


# **checkoutCartCartIdShippingAvailableGet**
```swift
    open class func checkoutCartCartIdShippingAvailableGet(cartId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, completion: @escaping (_ data: [OrderShippingMethodWrapper]?, _ error: Error?) -> Void)
```

Get Available Shipping Methods

Returns a list of available shipping methods for each bag. The shipping address and customer must be applied to the cart before requesting shipping methods.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let cartId = 987 // Int64 | 
let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int64 |  (optional)

// Get Available Shipping Methods
CheckoutShippingAPI.checkoutCartCartIdShippingAvailableGet(cartId: cartId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId) { (response, error) in
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
 **cartId** | **Int64** |  | 
 **xVioletToken** | **String** |  | [optional] 
 **xVioletAppSecret** | **String** |  | [optional] 
 **xVioletAppId** | **Int64** |  | [optional] 

### Return type

[**[OrderShippingMethodWrapper]**](OrderShippingMethodWrapper.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutCartCartIdShippingPost**
```swift
    open class func checkoutCartCartIdShippingPost(cartId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil, body: [BagShippingMethod]? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Set Shipping Methods

Applies a shipping method to a bag. Shipping methods available to each bag can be retreived from 'Get Available Shipping Methods' endpoint. Each bag requires a shipping method.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let cartId = 987 // Int64 | 
let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int64 |  (optional)
let priceCart = true // Bool |  (optional) (default to false)
let body = [BagShippingMethod(bagId: 123, shippingMethodId: "shippingMethodId_example")] // [BagShippingMethod] |  (optional)

// Set Shipping Methods
CheckoutShippingAPI.checkoutCartCartIdShippingPost(cartId: cartId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, priceCart: priceCart, body: body) { (response, error) in
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
 **cartId** | **Int64** |  | 
 **xVioletToken** | **String** |  | [optional] 
 **xVioletAppSecret** | **String** |  | [optional] 
 **xVioletAppId** | **Int64** |  | [optional] 
 **priceCart** | **Bool** |  | [optional] [default to false]
 **body** | [**[BagShippingMethod]**](BagShippingMethod.md) |  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutCartCartIdShippingShippingMethodIdDelete**
```swift
    open class func checkoutCartCartIdShippingShippingMethodIdDelete(cartId: Int64, shippingMethodId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Remove Shipping Method

Removes a previously applied shipping from the cart.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let cartId = 987 // Int64 | 
let shippingMethodId = 987 // Int64 | 
let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int64 |  (optional)
let priceCart = true // Bool |  (optional) (default to false)

// Remove Shipping Method
CheckoutShippingAPI.checkoutCartCartIdShippingShippingMethodIdDelete(cartId: cartId, shippingMethodId: shippingMethodId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, priceCart: priceCart) { (response, error) in
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
 **cartId** | **Int64** |  | 
 **shippingMethodId** | **Int64** |  | 
 **xVioletToken** | **String** |  | [optional] 
 **xVioletAppSecret** | **String** |  | [optional] 
 **xVioletAppId** | **Int64** |  | [optional] 
 **priceCart** | **Bool** |  | [optional] [default to false]

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

