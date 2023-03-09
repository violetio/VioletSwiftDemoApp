# Offer

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Int64** |  | [optional] 
**productId** | **String** | The parent/container product ID | 
**externalId** | **String** | External ID | [optional] 
**externalUrl** | **String** | External URL | [optional] 
**name** | **String** | Name of Product in Offer | 
**description** | **String** | Product Description | [optional] 
**source** | **String** | Source Platform | 
**seller** | **String** | Name of Merchant Selling Product | [optional] 
**vendor** | **String** | Name of Original Vendor | [optional] 
**merchantId** | **Int** | Merchant ID | 
**available** | **Bool** | Is Product Available | [default to false]
**visible** | **Bool** | Is Product Visible | [default to false]
**minPrice** | **Int** | Minimum Price the Product sells for | 
**maxPrice** | **Int** | Maximum Price the Product sells for | [optional] 
**commissionRate** | **Double** | Amount given by merchant | [optional] 
**specialCommissionRate** | **Bool** | If the commission rate is unique to this offer. | [optional] [default to false]
**currency** | **String** | Default Currency of Offer | [optional] 
**sourceCategoryName** | **String** | Original Category on Source Platform | [optional] 
**meta** | [Meta] | Additional Meta Data of the Offer | [optional] 
**variants** | [Variant] | Product Variations | [optional] 
**skus** | [Sku] | Product SKUs | [optional] 
**albums** | [Album] | Product Albums | [optional] 
**threeDEnables** | **Bool** | Is the product 3D Enabled | [optional] [default to false]
**threeDResource** | **String** | 3D Resource Object | [optional] 
**type** | **String** | Product Type | [optional] 
**status** | **String** | Status | [optional] 
**dateCreated** | **Date** | Date of offer creation | [optional] 
**dateLastModified** | **Date** | Date of last offer update | [optional] 
**weightUnit** | **String** | Weight Unit | [optional] 
**sizeUnit** | **String** | Size Unit | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


