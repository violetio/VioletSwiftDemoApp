# CheckoutItemsAPI

All URIs are relative to *http://sandbox-api.violet.io/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkoutCartCartIdSkusOrderSkuIdDelete**](CheckoutItemsAPI.md#checkoutcartcartidskusorderskuiddelete) | **DELETE** /checkout/cart/{cart_id}/skus/{order_sku_id} | Remove SKU from Cart
[**checkoutCartCartIdSkusOrderSkuIdPut**](CheckoutItemsAPI.md#checkoutcartcartidskusorderskuidput) | **PUT** /checkout/cart/{cart_id}/skus/{order_sku_id} | Update SKU in Cart
[**checkoutCartCartIdSkusPost**](CheckoutItemsAPI.md#checkoutcartcartidskuspost) | **POST** /checkout/cart/{cart_id}/skus | Add SKU to Cart


# **checkoutCartCartIdSkusOrderSkuIdDelete**
```swift
    open class func checkoutCartCartIdSkusOrderSkuIdDelete(cartId: Int64, orderSkuId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Remove SKU from Cart

Removes a cart SKU by its ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let cartId = 987 // Int64 | 
let orderSkuId = 987 // Int64 | 
let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int64 |  (optional)
let priceCart = true // Bool |  (optional) (default to false)

// Remove SKU from Cart
CheckoutItemsAPI.checkoutCartCartIdSkusOrderSkuIdDelete(cartId: cartId, orderSkuId: orderSkuId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, priceCart: priceCart) { (response, error) in
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
 **orderSkuId** | **Int64** |  | 
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

# **checkoutCartCartIdSkusOrderSkuIdPut**
```swift
    open class func checkoutCartCartIdSkusOrderSkuIdPut(cartId: Int64, orderSkuId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil, body: OrderSku? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Update SKU in Cart

Modifies a cart SKU by its ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let cartId = 987 // Int64 | 
let orderSkuId = 987 // Int64 | 
let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int64 |  (optional)
let priceCart = true // Bool |  (optional) (default to false)
let body = OrderSku(id: 123, merchantId: 123, appId: 123, productId: "productId_example", skuId: 123, externalId: "externalId_example", name: "name_example", thumbnail: "thumbnail_example", quantity: 123, price: 123) // OrderSku |  (optional)

// Update SKU in Cart
CheckoutItemsAPI.checkoutCartCartIdSkusOrderSkuIdPut(cartId: cartId, orderSkuId: orderSkuId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, priceCart: priceCart, body: body) { (response, error) in
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
 **orderSkuId** | **Int64** |  | 
 **xVioletToken** | **String** |  | [optional] 
 **xVioletAppSecret** | **String** |  | [optional] 
 **xVioletAppId** | **Int64** |  | [optional] 
 **priceCart** | **Bool** |  | [optional] [default to false]
 **body** | [**OrderSku**](OrderSku.md) |  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutCartCartIdSkusPost**
```swift
    open class func checkoutCartCartIdSkusPost(cartId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, priceCart: Bool? = nil, body: OrderSku? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Add SKU to Cart

Adds a SKU to the cart by its ID. Quantity will default to 1 if no quantity is passed. Quantities greater than 10 will default to 10.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let cartId = 987 // Int64 | 
let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int64 |  (optional)
let priceCart = true // Bool |  (optional) (default to false)
let body = OrderSku(id: 123, merchantId: 123, appId: 123, productId: "productId_example", skuId: 123, externalId: "externalId_example", name: "name_example", thumbnail: "thumbnail_example", quantity: 123, price: 123) // OrderSku |  (optional)

// Add SKU to Cart
CheckoutItemsAPI.checkoutCartCartIdSkusPost(cartId: cartId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, priceCart: priceCart, body: body) { (response, error) in
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
 **body** | [**OrderSku**](OrderSku.md) |  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

