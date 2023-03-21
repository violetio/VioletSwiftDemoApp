# CatalogSkusAPI

All URIs are relative to *https://sandbox-api.violet.io:443/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**catalogSkusSkuIdGet**](CatalogSkusAPI.md#catalogskusskuidget) | **GET** /catalog/skus/{sku_id} | Get Sku by ID


# **catalogSkusSkuIdGet**
```swift
    open class func catalogSkusSkuIdGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, skuId: Int64, completion: @escaping (_ data: Sku?, _ error: Error?) -> Void)
```

Get Sku by ID

Retreives a single SKU by ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let skuId = 987 // Int64 | 

// Get Sku by ID
CatalogSkusAPI.catalogSkusSkuIdGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, skuId: skuId) { (response, error) in
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
 **skuId** | **Int64** |  | 

### Return type

[**Sku**](Sku.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

