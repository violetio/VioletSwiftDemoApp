# CatalogOffersAPI

All URIs are relative to *http://sandbox-api.violet.io/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**catalogOffersMerchantsMerchantIdGet**](CatalogOffersAPI.md#catalogoffersmerchantsmerchantidget) | **GET** /catalog/offers/merchants/{merchant_id} | Get Offers by merchant_id
[**catalogOffersOfferIdGet**](CatalogOffersAPI.md#catalogoffersofferidget) | **GET** /catalog/offers/{offer_id} | Get Offer by ID


# **catalogOffersMerchantsMerchantIdGet**
```swift
    open class func catalogOffersMerchantsMerchantIdGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, merchantId: Int64, page: Int64? = nil, size: Int64? = nil, completion: @escaping (_ data: PageOffer?, _ error: Error?) -> Void)
```

Get Offers by merchant_id

Retrieves a page of offers by Merchant ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let merchantId = 987 // Int64 | 
let page = 987 // Int64 |  (optional)
let size = 987 // Int64 |  (optional)

// Get Offers by merchant_id
CatalogOffersAPI.catalogOffersMerchantsMerchantIdGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, merchantId: merchantId, page: page, size: size) { (response, error) in
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
 **merchantId** | **Int64** |  | 
 **page** | **Int64** |  | [optional] 
 **size** | **Int64** |  | [optional] 

### Return type

[**PageOffer**](PageOffer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogOffersOfferIdGet**
```swift
    open class func catalogOffersOfferIdGet(offerId: Int64, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int64? = nil, completion: @escaping (_ data: Offer?, _ error: Error?) -> Void)
```

Get Offer by ID

Retrieves a single offer by ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let offerId = 987 // Int64 | 
let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int64 |  (optional)

// Get Offer by ID
CatalogOffersAPI.catalogOffersOfferIdGet(offerId: offerId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId) { (response, error) in
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
 **offerId** | **Int64** |  | 
 **xVioletToken** | **String** |  | [optional] 
 **xVioletAppSecret** | **String** |  | [optional] 
 **xVioletAppId** | **Int64** |  | [optional] 

### Return type

[**Offer**](Offer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

