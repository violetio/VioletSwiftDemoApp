# Order

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int64** |  | [optional] 
**token** | **String** |  | [optional] 
**sellerId** | **Int64** | ID of the Seller | [optional] 
**userId** | **Int64** | ID of the User placing the order | [optional] 
**appId** | **Int64** | ID of the App creating the order | [optional] 
**customer** | [**OrderCustomer**](OrderCustomer.md) |  | [optional] 
**bags** | [Bag] | Bags in the Order | [optional] 
**shippingAddress** | [**OrderAddress**](OrderAddress.md) |  | [optional] 
**billingAddress** | [**OrderAddress**](OrderAddress.md) |  | [optional] 
**paymentMethod** | [**OrderPaymentMethod**](OrderPaymentMethod.md) |  | [optional] 
**subTotal** | **Int** | Subtotal of the Order | [optional] 
**shippingTotal** | **Int** | Shipping Total of the Order | [optional] 
**taxTotal** | **Int** | Tax Total of the Order | [optional] 
**total** | **Int** | Total of the Order | [optional] 
**appCustomerId** | **String** | App Customer ID | [optional] 
**appOrderId** | **String** | App Order ID | [optional] 
**status** | **String** | Status of the Order | 
**dateCreated** | **Date** | Date of order creation | [optional] 
**dateLastModified** | **Date** | Date of last order update | [optional] 
**guest** | **Bool** | Is the customer a guest or an authed user. | [optional] [default to false]
**referralId** | **String** | Optional value used to represent an identifier in your system. Max length of 128 characters. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


