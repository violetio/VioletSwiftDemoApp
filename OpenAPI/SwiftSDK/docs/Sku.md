# Sku

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int64** |  | 
**offerId** | **Int64** | ID of the Offer | 
**merchantId** | **Int** | ID of the Merchant | 
**externalId** | **String** | ID of the SKU on the External Ecom Platform | [optional] 
**name** | **String** | Sku Name | [optional] 
**asin** | **String** | Amazon Standard Identification Number | [optional] 
**gtin** | **String** | Global Trade Item Number | [optional] 
**upc** | **String** | Universal Product Code | [optional] 
**ean** | **String** | European Article Number | [optional] 
**isbn** | **String** | International Standard Book Number | [optional] 
**inStock** | **Bool** | Is the Product in Stock | [optional] [default to false]
**quantityAvailable** | **Int** | Quantity Available | [optional] 
**inventoryTracked** | **Bool** | Is the SKUs inventory tracked | [optional] [default to false]
**salePrice** | **Int** | Sale Price of the SKU | 
**retailPrice** | **Int** | Retail Price of the SKU | [optional] 
**currency** | **String** | The starting currency of this SKU | 
**taxable** | **Bool** | Is the product taxable | [optional] [default to false]
**taxType** | **String** | Type of Tax on this SKU | [optional] 
**albums** | [Album] | Sku Albums | [optional] 
**variantValues** | [SkuVariantValue] | Variant Values that apply to this SKU | [optional] 
**type** | **String** |  | [optional] 
**status** | **String** | SKU Status | [optional] 
**dateCreated** | **Date** | Date of SKU creation | [optional] 
**dateLastModified** | **Date** | Date of last SKU update | [optional] 
**skuDimensions** | [**SkuDimensions**](SkuDimensions.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


