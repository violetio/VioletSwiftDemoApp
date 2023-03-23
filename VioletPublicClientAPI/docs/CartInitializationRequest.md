# CartInitializationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**baseCurrency** | **String** | Base currency of cart | [optional] 
**skus** | [OrderSku] | Optional collection of SKUs | [optional] 
**referralId** | **String** | Associate the order with a user or affiliate in your system | [optional] 
**appOrderId** | **String** | Map the order in Violet to an order record within your system | [optional] 
**customer** | [**OrderCustomer**](OrderCustomer.md) |  | [optional] 
**walletBasedCheckout** | **Bool** | Boolean denoting whether or not this order will be placed through a wallet based payment mechanism such as apple pay | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


