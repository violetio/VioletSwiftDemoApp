# PaymentMethodRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**token** | **String** | Generated payment token. | [optional] 
**intentBasedCapture** | **Bool** | Trigger payment intent based capture | [optional] 
**cardNumber** | **String** | Number on the credit or debit card. | [optional] 
**cardCvc** | **Int** | CVC code on the credit or debit card. | [optional] 
**cardExpMonth** | **Int** | Expiration month of the credit or debit card. | [optional] 
**cardExpYear** | **Int** | Expiration year of the credit or debit card. | [optional] 
**cardPostalCode** | **String** | Postal Code of the credit or debit card. | [optional] 
**completeCheckout** | **Bool** | Submit cart immediately after applying the payment method. | [optional] 
**appOrderId** | **String** | Map the order in Violet to an order record within your system. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


