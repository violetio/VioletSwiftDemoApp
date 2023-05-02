# CheckoutCartAPI

All URIs are relative to *https://sandbox-api.violet.io:443/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkoutCartByTokenTokenGet**](CheckoutCartAPI.md#checkoutcartbytokentokenget) | **GET** /checkout/cart/byToken/{token} | Get Cart by Token
[**checkoutCartCartIdDelete**](CheckoutCartAPI.md#checkoutcartcartiddelete) | **DELETE** /checkout/cart/{cart_id} | Delete Cart
[**checkoutCartCartIdGet**](CheckoutCartAPI.md#checkoutcartcartidget) | **GET** /checkout/cart/{cart_id} | Get Cart by ID
[**checkoutCartPost**](CheckoutCartAPI.md#checkoutcartpost) | **POST** /checkout/cart | Create Cart


# **checkoutCartByTokenTokenGet**
```swift
    open class func checkoutCartByTokenTokenGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, token: String, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Get Cart by Token

Retreives a single cart by its token. The token a unique string generated for each cart at the time of creation.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let token = "token_example" // String | 

// Get Cart by Token
CheckoutCartAPI.checkoutCartByTokenTokenGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, token: token) { (response, error) in
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
 **token** | **String** |  | 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutCartCartIdDelete**
```swift
    open class func checkoutCartCartIdDelete(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Cart

Deletes a cart by its ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let cartId = 987 // Int64 | 

// Delete Cart
CheckoutCartAPI.checkoutCartCartIdDelete(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId) { (response, error) in
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

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutCartCartIdGet**
```swift
    open class func checkoutCartCartIdGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Get Cart by ID

Retreives a single cart by its ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let cartId = 987 // Int64 | 

// Get Cart by ID
CheckoutCartAPI.checkoutCartCartIdGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId) { (response, error) in
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

# **checkoutCartPost**
```swift
    open class func checkoutCartPost(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, appOrderId: String? = nil, baseCurrency: String? = nil, referralId: String? = nil, cartInitializationRequest: CartInitializationRequest? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Create Cart

Creates a new empty cart. <br><br>By setting the 'apply_current_user' flag to true the user associated with the current access token will be applied to the cart. If the user has an existing shipping address and/or billing address saved to their account these will automatically be applied to the cart. <strong>Only applies to oAuthed customer transactions.</strong> <br><br>By setting the 'default_payment_method' flag to true the default payment method, if one exists, of the user associated with the current token will be applied to the cart. <strong>Only applies to oAuthed customer transactions.</strong> <br><br>Use the optional 'app_order_id' parameter to map the newly created cart to an ID in your systems.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let appOrderId = "appOrderId_example" // String |  (optional)
let baseCurrency = "baseCurrency_example" // String |  (optional) (default to "USD")
let referralId = "referralId_example" // String |  (optional)
let cartInitializationRequest = CartInitializationRequest(baseCurrency: "baseCurrency_example", skus: [OrderSku(id: 123, merchantId: 123, appId: 123, productId: "productId_example", skuId: 123, externalId: "externalId_example", name: "name_example", thumbnail: "thumbnail_example", quantity: 123, price: 123)], referralId: "referralId_example", appOrderId: "appOrderId_example", customer: OrderCustomer(userId: 123, firstName: "firstName_example", lastName: "lastName_example", email: "email_example", name: "name_example"), walletBasedCheckout: false) // CartInitializationRequest |  (optional)

// Create Cart
CheckoutCartAPI.checkoutCartPost(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, appOrderId: appOrderId, baseCurrency: baseCurrency, referralId: referralId, cartInitializationRequest: cartInitializationRequest) { (response, error) in
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
 **appOrderId** | **String** |  | [optional] 
 **baseCurrency** | **String** |  | [optional] [default to &quot;USD&quot;]
 **referralId** | **String** |  | [optional] 
 **cartInitializationRequest** | [**CartInitializationRequest**](CartInitializationRequest.md) |  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

