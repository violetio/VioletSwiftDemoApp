# Bag

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int64** |  | [optional] 
**orderId** | **Int64** | ID of the Order the Bag belongs to | 
**merchantId** | **Int** | ID of the Merchant the Bag references | 
**appId** | **Int64** | ID of the App creating this Bag | 
**externalId** | **String** | ID of the Order on the External Ecommerce Platform | [optional] 
**status** | **String** | Status | [optional] 
**fulfillmentStatus** | **String** | Fulfillment Status | [optional] 
**financialStatus** | **String** | Financial Status | [optional] 
**skus** | [OrderSku] | SKUs added to the bag | [optional] 
**shippingMethod** | [**OrderShippingMethod**](OrderShippingMethod.md) |  | [optional] 
**taxes** | [OrderTax] | Taxes applied to the bag | 
**subTotal** | **Int** | Subtotal of the bag | [optional] 
**shippingTotal** | **Int** | Shipping Total of the bag | [optional] 
**taxTotal** | **Int** | Tax Total of the bag | [optional] 
**total** | **Int** | Total price of the bag | [optional] 
**transactions** | [Transaction] | Transactions of the bag | [optional] 
**externalCheckout** | **Bool** | If bag is tracked externally | [optional] [default to false]
**merchantName** | **String** | Name of Merchant | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


