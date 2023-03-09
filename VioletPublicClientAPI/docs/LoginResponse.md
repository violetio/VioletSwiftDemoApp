# LoginResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int64** |  | [optional] 
**firstName** | **String** | The users first name | 
**lastName** | **String** | The users last name | 
**password** | **String** | The users raw desired password | 
**email** | **String** | The users unique email address | 
**merchantId** | **Int** | The Id of the Store the User is associated to. | [optional] 
**type** | **String** | The allowed values for the user type | 
**verified** | **Bool** | If a user has verified their emailed address | [optional] [default to false]
**status** | **String** | The status of the user | [optional] 
**dateCreated** | **Date** | Date of account creation | [optional] 
**dateLastModified** | **Date** | Date of last account update | [optional] 
**roles** | [Role] |  | [optional] 
**token** | **String** | Users Access Token. Currently expires after 1440 minutes. | [optional] 
**refreshToken** | **String** | Users Refresh Token. Never expires. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


