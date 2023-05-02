# Transaction

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int64** |  | [optional] 
**merchantId** | **Int** | ID of the Merchant receiving the transaction | 
**sellerId** | **Int64** | ID of the User who facilitated the transaction | [optional] 
**appId** | **Int64** | ID of the App that created the Order | 
**orderId** | **Int64** | ID of the Order the Transaction applies to | [optional] 
**bagId** | **Int64** | ID of the Bag the Transaction applies to | 
**paymentMethodId** | **Int64** | ID of the referenced Payment Method | 
**gatewayTransactionId** | **String** | ID of the Transaction in the Payment Gateway | [optional] 
**gateway** | **String** | Gateway processing the Transaction | [optional] 
**amount** | **Int** | Total amount being transacted | [optional] 
**currency** | **String** | Currency the Transaction takes place in | [optional] 
**type** | **String** | Transaction Type | [optional] 
**errorCode** | **String** | Error Code from gateway if error occurred | [optional] 
**status** | **String** | Transaction Status | [optional] 
**test** | **Bool** | Is this a test Transaction | [optional] [default to false]
**dateCreated** | **Date** | Date of transaction creation | [optional] 
**dateLastModified** | **Date** | Date of last transaction update | [optional] 
**orderPaymentMethod** | [**OrderPaymentMethod**](OrderPaymentMethod.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


