# WebhookEvent

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int** |  | [optional] [readonly] 
**appId** | **Int** | App ID | [optional] 
**webhookId** | **Int** | ID of the webhook the event occurred on | [optional] 
**entityId** | **Int64** | ID of entity this event occurred for | [optional] 
**statusCode** | **Int** | HTTP Status Code | [optional] 
**response** | **String** | Response from the remote url | [optional] 
**eventType** | **String** | Type of webhook event | [optional] 
**attempts** | **Int** | Deliver attempts of the webhook the event | [optional] 
**status** | **String** | Status of webhook event | 
**dateCreated** | **Date** | Date of creation | [optional] [readonly] 
**dateLastModified** | **Date** | Date of last update | [optional] [readonly] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


