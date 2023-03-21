# CatalogProductsAPI

All URIs are relative to *https://sandbox-api.violet.io:443/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**catalogProductsGet**](CatalogProductsAPI.md#catalogproductsget) | **GET** /catalog/products | Get Products
[**catalogProductsProductIdGet**](CatalogProductsAPI.md#catalogproductsproductidget) | **GET** /catalog/products/{product_id} | Get Product by ID
[**catalogProductsRandomGet**](CatalogProductsAPI.md#catalogproductsrandomget) | **GET** /catalog/products/random | Get Random Products
[**catalogProductsSearchPost**](CatalogProductsAPI.md#catalogproductssearchpost) | **POST** /catalog/products/search | Search Products


# **catalogProductsGet**
```swift
    open class func catalogProductsGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, page: Int? = nil, size: Int? = nil, excludePublic: Bool? = nil, completion: @escaping (_ data: PageProduct?, _ error: Error?) -> Void)
```

Get Products

Retreives a paginated list of all products in ascending order since date of creation.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let page = 987 // Int |  (optional) (default to 1)
let size = 987 // Int |  (optional) (default to 20)
let excludePublic = true // Bool | Excludes all publicly available products that are not part of your curated catalog. In sandbox this should be left as false as there are no merchant <-> developer relationships and all products are publically available to all developers. (optional) (default to false)

// Get Products
CatalogProductsAPI.catalogProductsGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, page: page, size: size, excludePublic: excludePublic) { (response, error) in
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
 **excludePublic** | **Bool** | Excludes all publicly available products that are not part of your curated catalog. In sandbox this should be left as false as there are no merchant &lt;-&gt; developer relationships and all products are publically available to all developers. | [optional] [default to false]

### Return type

[**PageProduct**](PageProduct.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogProductsProductIdGet**
```swift
    open class func catalogProductsProductIdGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, productId: String, completion: @escaping (_ data: Product?, _ error: Error?) -> Void)
```

Get Product by ID

Retrieves a single product by ID. This request will include all offers of that product.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let productId = "productId_example" // String | 

// Get Product by ID
CatalogProductsAPI.catalogProductsProductIdGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, productId: productId) { (response, error) in
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
 **productId** | **String** |  | 

### Return type

[**Product**](Product.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogProductsRandomGet**
```swift
    open class func catalogProductsRandomGet(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int64, page: Int? = nil, size: Int? = nil, excludePublic: Bool? = nil, completion: @escaping (_ data: PageProduct?, _ error: Error?) -> Void)
```

Get Random Products

Retreives a paginated list of products in random order. The original random order is maintained through pagination.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int64 | 
let page = 987 // Int |  (optional) (default to 1)
let size = 987 // Int |  (optional) (default to 20)
let excludePublic = true // Bool | Excludes all publicly available products that are not part of your curated catalog. In sandbox this should be left as false as there are no merchant <-> developer relationships and all products are publically available to all developers. (optional) (default to false)

// Get Random Products
CatalogProductsAPI.catalogProductsRandomGet(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, page: page, size: size, excludePublic: excludePublic) { (response, error) in
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
 **excludePublic** | **Bool** | Excludes all publicly available products that are not part of your curated catalog. In sandbox this should be left as false as there are no merchant &lt;-&gt; developer relationships and all products are publically available to all developers. | [optional] [default to false]

### Return type

[**PageProduct**](PageProduct.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **catalogProductsSearchPost**
```swift
    open class func catalogProductsSearchPost(xVioletToken: String, xVioletAppSecret: String, xVioletAppId: Int, page: Int? = nil, size: Int? = nil, excludePublic: Bool? = nil, body: SearchRequest? = nil, completion: @escaping (_ data: PageProduct?, _ error: Error?) -> Void)
```

Search Products

Search the complete product catalog by using the available filters in the request body.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let xVioletToken = "xVioletToken_example" // String | 
let xVioletAppSecret = "xVioletAppSecret_example" // String | 
let xVioletAppId = 987 // Int | 
let page = 987 // Int |  (optional) (default to 1)
let size = 987 // Int |  (optional) (default to 20)
let excludePublic = true // Bool | Excludes all publicly available products that are not part of your curated catalog. In sandbox this should be left as false as there are no merchant <-> developer relationships and all products are publically available to all developers. (optional) (default to false)
let body = SearchRequest(query: "query_example", merchantId: 123, categoryId: "categoryId_example", categorySlug: "categorySlug_example", minCommission: 123, maxCommission: 123, minPrice: 123, maxPrice: 123, includeOffers: false) // SearchRequest |  (optional)

// Search Products
CatalogProductsAPI.catalogProductsSearchPost(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, page: page, size: size, excludePublic: excludePublic, body: body) { (response, error) in
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
 **xVioletAppId** | **Int** |  | 
 **page** | **Int** |  | [optional] [default to 1]
 **size** | **Int** |  | [optional] [default to 20]
 **excludePublic** | **Bool** | Excludes all publicly available products that are not part of your curated catalog. In sandbox this should be left as false as there are no merchant &lt;-&gt; developer relationships and all products are publically available to all developers. | [optional] [default to false]
 **body** | [**SearchRequest**](SearchRequest.md) |  | [optional] 

### Return type

[**PageProduct**](PageProduct.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

