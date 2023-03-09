# EventsWebhookEventsAPI

All URIs are relative to *http://sandbox-api.violet.io/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllWebhookEvents1**](EventsWebhookEventsAPI.md#getallwebhookevents1) | **GET** /events/webhooks/all/events | Get All Webhook Events
[**getWebhookEventBodyByEventId1**](EventsWebhookEventsAPI.md#getwebhookeventbodybyeventid1) | **GET** /events/webhooks/{webhook_id}/events/{event_id}/body | Get Webhook Event Body
[**getWebhookEventById1**](EventsWebhookEventsAPI.md#getwebhookeventbyid1) | **GET** /events/webhooks/{webhook_id}/events/{event_id} | Get Webhook Event
[**getWebhookEventTypes1**](EventsWebhookEventsAPI.md#getwebhookeventtypes1) | **GET** /events/webhooks/event/types | Get Webhook Event Types
[**getWebhookEvents1**](EventsWebhookEventsAPI.md#getwebhookevents1) | **GET** /events/webhooks/{webhook_id}/events | Get Webhook Events


# **getAllWebhookEvents1**
```swift
    open class func getAllWebhookEvents1(xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, since: Int64? = nil, page: Int? = nil, size: Int? = nil, completion: @escaping (_ data: [WebhookEvent]?, _ error: Error?) -> Void)
```

Get All Webhook Events

Retrieves WebhookEvents from all Webhooks.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int |  (optional)
let appId = 987 // Int |  (optional)
let since = 987 // Int64 |  (optional)
let page = 987 // Int |  (optional) (default to 1)
let size = 987 // Int |  (optional) (default to 20)

// Get All Webhook Events
EventsWebhookEventsAPI.getAllWebhookEvents1(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, appId: appId, since: since, page: page, size: size) { (response, error) in
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
 **xVioletToken** | **String** |  | [optional] 
 **xVioletAppSecret** | **String** |  | [optional] 
 **xVioletAppId** | **Int** |  | [optional] 
 **appId** | **Int** |  | [optional] 
 **since** | **Int64** |  | [optional] 
 **page** | **Int** |  | [optional] [default to 1]
 **size** | **Int** |  | [optional] [default to 20]

### Return type

[**[WebhookEvent]**](WebhookEvent.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWebhookEventBodyByEventId1**
```swift
    open class func getWebhookEventBodyByEventId1(webhookId: Int, eventId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, completion: @escaping (_ data: WebhookEventBody?, _ error: Error?) -> Void)
```

Get Webhook Event Body

Retrieves the body of a Webhook Event.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let webhookId = 987 // Int | 
let eventId = 987 // Int | 
let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int |  (optional)
let appId = 987 // Int |  (optional)

// Get Webhook Event Body
EventsWebhookEventsAPI.getWebhookEventBodyByEventId1(webhookId: webhookId, eventId: eventId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, appId: appId) { (response, error) in
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
 **webhookId** | **Int** |  | 
 **eventId** | **Int** |  | 
 **xVioletToken** | **String** |  | [optional] 
 **xVioletAppSecret** | **String** |  | [optional] 
 **xVioletAppId** | **Int** |  | [optional] 
 **appId** | **Int** |  | [optional] 

### Return type

[**WebhookEventBody**](WebhookEventBody.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWebhookEventById1**
```swift
    open class func getWebhookEventById1(webhookId: Int, eventId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, completion: @escaping (_ data: WebhookEvent?, _ error: Error?) -> Void)
```

Get Webhook Event

Retrieves a single WebhookEvent by ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let webhookId = 987 // Int | 
let eventId = 987 // Int | 
let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int |  (optional)
let appId = 987 // Int |  (optional)

// Get Webhook Event
EventsWebhookEventsAPI.getWebhookEventById1(webhookId: webhookId, eventId: eventId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, appId: appId) { (response, error) in
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
 **webhookId** | **Int** |  | 
 **eventId** | **Int** |  | 
 **xVioletToken** | **String** |  | [optional] 
 **xVioletAppSecret** | **String** |  | [optional] 
 **xVioletAppId** | **Int** |  | [optional] 
 **appId** | **Int** |  | [optional] 

### Return type

[**WebhookEvent**](WebhookEvent.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWebhookEventTypes1**
```swift
    open class func getWebhookEventTypes1(xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, completion: @escaping (_ data: [String]?, _ error: Error?) -> Void)
```

Get Webhook Event Types

Retrieves a list of all supported Webhook event types.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int |  (optional)

// Get Webhook Event Types
EventsWebhookEventsAPI.getWebhookEventTypes1(xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId) { (response, error) in
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
 **xVioletToken** | **String** |  | [optional] 
 **xVioletAppSecret** | **String** |  | [optional] 
 **xVioletAppId** | **Int** |  | [optional] 

### Return type

**[String]**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWebhookEvents1**
```swift
    open class func getWebhookEvents1(webhookId: Int, xVioletToken: String? = nil, xVioletAppSecret: String? = nil, xVioletAppId: Int? = nil, appId: Int? = nil, since: Int64? = nil, page: Int? = nil, size: Int? = nil, completion: @escaping (_ data: [WebhookEvent]?, _ error: Error?) -> Void)
```

Get Webhook Events

Retrieves WebhookEvents from a single Webhook.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import VioletPublicClient

let webhookId = 987 // Int | 
let xVioletToken = "xVioletToken_example" // String |  (optional)
let xVioletAppSecret = "xVioletAppSecret_example" // String |  (optional)
let xVioletAppId = 987 // Int |  (optional)
let appId = 987 // Int |  (optional)
let since = 987 // Int64 |  (optional)
let page = 987 // Int |  (optional) (default to 1)
let size = 987 // Int |  (optional) (default to 20)

// Get Webhook Events
EventsWebhookEventsAPI.getWebhookEvents1(webhookId: webhookId, xVioletToken: xVioletToken, xVioletAppSecret: xVioletAppSecret, xVioletAppId: xVioletAppId, appId: appId, since: since, page: page, size: size) { (response, error) in
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
 **webhookId** | **Int** |  | 
 **xVioletToken** | **String** |  | [optional] 
 **xVioletAppSecret** | **String** |  | [optional] 
 **xVioletAppId** | **Int** |  | [optional] 
 **appId** | **Int** |  | [optional] 
 **since** | **Int64** |  | [optional] 
 **page** | **Int** |  | [optional] [default to 1]
 **size** | **Int** |  | [optional] [default to 20]

### Return type

[**[WebhookEvent]**](WebhookEvent.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

