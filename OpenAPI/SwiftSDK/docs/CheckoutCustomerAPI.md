# CheckoutCustomerAPI

All URIs are relative to *https://sandbox-api.violet.io:443/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkoutCartCartIdBillingAddressPost**](CheckoutCustomerAPI.md#checkoutcartcartidbillingaddresspost) | **POST** /checkout/cart/{cart_id}/billing_address | Set Billing Address
[**checkoutCartCartIdBillingAddressPut**](CheckoutCustomerAPI.md#checkoutcartcartidbillingaddressput) | **PUT** /checkout/cart/{cart_id}/billing_address | Update Billing Address
[**checkoutCartCartIdCustomerPost**](CheckoutCustomerAPI.md#checkoutcartcartidcustomerpost) | **POST** /checkout/cart/{cart_id}/customer | Apply Guest Customer to Cart
[**checkoutCartCartIdShippingAddressPost**](CheckoutCustomerAPI.md#checkoutcartcartidshippingaddresspost) | **POST** /checkout/cart/{cart_id}/shipping_address | Set Shipping Address
[**checkoutCartCartIdShippingAddressPut**](CheckoutCustomerAPI.md#checkoutcartcartidshippingaddressput) | **PUT** /checkout/cart/{cart_id}/shipping_address | Update Shipping Address


# **checkoutCartCartIdBillingAddressPost**
```swift
    open class func checkoutCartCartIdBillingAddressPost(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, priceCart: Bool? = nil, body: OrderAddress? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Set Billing Address

Applies the provided billing address to the cart.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let cartId = 987 // Int64 | 
let priceCart = true // Bool |  (optional) (default to false)
let body = OrderAddress(name: "name_example", city: "city_example", state: "state_example", country: "country_example", postalCode: "postalCode_example", phone: "phone_example", type: "type_example", address1: "address1_example", address2: "address2_example") // OrderAddress |  (optional)

// Set Billing Address
CheckoutCustomerAPI.checkoutCartCartIdBillingAddressPost(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId, priceCart: priceCart, body: body) { (response, error) in
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
 **priceCart** | **Bool** |  | [optional] [default to false]
 **body** | [**OrderAddress**](OrderAddress.md) |  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutCartCartIdBillingAddressPut**
```swift
    open class func checkoutCartCartIdBillingAddressPut(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, priceCart: Bool? = nil, body: OrderAddress? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Update Billing Address

Modifies the billing address of the cart.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let cartId = 987 // Int64 | 
let priceCart = true // Bool |  (optional) (default to false)
let body = OrderAddress(name: "name_example", city: "city_example", state: "state_example", country: "country_example", postalCode: "postalCode_example", phone: "phone_example", type: "type_example", address1: "address1_example", address2: "address2_example") // OrderAddress |  (optional)

// Update Billing Address
CheckoutCustomerAPI.checkoutCartCartIdBillingAddressPut(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId, priceCart: priceCart, body: body) { (response, error) in
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
 **priceCart** | **Bool** |  | [optional] [default to false]
 **body** | [**OrderAddress**](OrderAddress.md) |  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutCartCartIdCustomerPost**
```swift
    open class func checkoutCartCartIdCustomerPost(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, priceCart: Bool? = nil, body: GuestOrderCustomer? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Apply Guest Customer to Cart

Applies a guest customer to the cart. Guest customers consist of a first name, last name, and email address. Guest customers are not persisted within Violet for use on future orders.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let cartId = 987 // Int64 | 
let priceCart = true // Bool |  (optional) (default to false)
let body = GuestOrderCustomer(firstName: "firstName_example", lastName: "lastName_example", email: "email_example", shippingAddress: OrderAddress(name: "name_example", city: "city_example", state: "state_example", country: "country_example", postalCode: "postalCode_example", phone: "phone_example", type: "type_example", address1: "address1_example", address2: "address2_example"), billingAddress: nil, sameAddress: false) // GuestOrderCustomer |  (optional)

// Apply Guest Customer to Cart
CheckoutCustomerAPI.checkoutCartCartIdCustomerPost(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId, priceCart: priceCart, body: body) { (response, error) in
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
 **priceCart** | **Bool** |  | [optional] [default to false]
 **body** | [**GuestOrderCustomer**](GuestOrderCustomer.md) |  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutCartCartIdShippingAddressPost**
```swift
    open class func checkoutCartCartIdShippingAddressPost(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, priceCart: Bool? = nil, body: OrderAddress? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Set Shipping Address

Applies the provided shipping address to the cart.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let cartId = 987 // Int64 | 
let priceCart = true // Bool |  (optional) (default to false)
let body = OrderAddress(name: "name_example", city: "city_example", state: "state_example", country: "country_example", postalCode: "postalCode_example", phone: "phone_example", type: "type_example", address1: "address1_example", address2: "address2_example") // OrderAddress |  (optional)

// Set Shipping Address
CheckoutCustomerAPI.checkoutCartCartIdShippingAddressPost(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId, priceCart: priceCart, body: body) { (response, error) in
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
 **priceCart** | **Bool** |  | [optional] [default to false]
 **body** | [**OrderAddress**](OrderAddress.md) |  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutCartCartIdShippingAddressPut**
```swift
    open class func checkoutCartCartIdShippingAddressPut(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, priceCart: Bool? = nil, body: OrderAddress? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Update Shipping Address

Modifies the shipping address of the cart.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let cartId = 987 // Int64 | 
let priceCart = true // Bool |  (optional) (default to false)
let body = OrderAddress(name: "name_example", city: "city_example", state: "state_example", country: "country_example", postalCode: "postalCode_example", phone: "phone_example", type: "type_example", address1: "address1_example", address2: "address2_example") // OrderAddress |  (optional)

// Update Shipping Address
CheckoutCustomerAPI.checkoutCartCartIdShippingAddressPut(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId, priceCart: priceCart, body: body) { (response, error) in
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
 **priceCart** | **Bool** |  | [optional] [default to false]
 **body** | [**OrderAddress**](OrderAddress.md) |  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

