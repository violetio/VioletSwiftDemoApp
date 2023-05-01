# CheckoutPaymentAPI

All URIs are relative to *https://sandbox-api.violet.io:443/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkoutCartCartIdPaymentPost**](CheckoutPaymentAPI.md#checkoutcartcartidpaymentpost) | **POST** /checkout/cart/{cart_id}/payment | Apply Payment Method
[**checkoutPaymentTokenGet**](CheckoutPaymentAPI.md#checkoutpaymenttokenget) | **GET** /checkout/payment/token | Get Stripe Public Token


# **checkoutCartCartIdPaymentPost**
```swift
    open class func checkoutCartCartIdPaymentPost(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, cartId: Int64, priceCart: Bool? = nil, body: PaymentMethodRequest? = nil, completion: @escaping (_ data: Order?, _ error: Error?) -> Void)
```

Apply Payment Method

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let cartId = 987 // Int64 | 
let priceCart = true // Bool |  (optional) (default to false)
let body = PaymentMethodRequest(token: "token_example", intentBasedCapture: false, cardNumber: "cardNumber_example", cardCvc: 123, cardExpMonth: 123, cardExpYear: 123, cardPostalCode: "cardPostalCode_example", completeCheckout: false, appOrderId: "appOrderId_example") // PaymentMethodRequest |  (optional)

// Apply Payment Method
CheckoutPaymentAPI.checkoutCartCartIdPaymentPost(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, cartId: cartId, priceCart: priceCart, body: body) { (response, error) in
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
 **body** | [**PaymentMethodRequest**](PaymentMethodRequest.md) |  | [optional] 

### Return type

[**Order**](Order.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkoutPaymentTokenGet**
```swift
    open class func checkoutPaymentTokenGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, completion: @escaping (_ data: CurrentPaymentToken?, _ error: Error?) -> Void)
```

Get Stripe Public Token

Obtain the current Stripe Publishable Key for use in tokenizing payment card data with the <a target='_blank' href='https://stripe.com/docs/stripe-js/reference#stripe-create-token'>Stripe.js library</a>.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClientAPI

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 

// Get Stripe Public Token
CheckoutPaymentAPI.checkoutPaymentTokenGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId) { (response, error) in
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

[**CurrentPaymentToken**](CurrentPaymentToken.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

