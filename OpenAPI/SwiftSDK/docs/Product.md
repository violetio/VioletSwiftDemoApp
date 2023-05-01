# Product

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**name** | **String** | Product Name | 
**description** | **String** | Product Description | [optional] 
**longDescription** | **String** | Product Long Description | [optional] 
**slug** | **String** | Product Slug/Handle | 
**brand** | **String** | Brand | [optional] 
**available** | **Bool** | Is the Product Available | [optional] [default to false]
**visible** | **Bool** | Is the Product Visible | [optional] [default to false]
**type** | **String** | Product Type | [optional] 
**currency** | **String** |  | [optional] 
**minPrice** | **Int** | Minimum Price of the Product | [optional] 
**maxPrice** | **Int** | Maximum Price of the Product | [optional] 
**variants** | [ProductVariant] | Product Variants | [optional] 
**offers** | [Offer] | Merchant Offerings | [optional] 
**categories** | [Category] | Categories | [optional] 
**gender** | **String** | Gender | [optional] 
**meta** | [Meta] | Meta Data | [optional] 
**tags** | **[String]** | Tags | [optional] 
**relatedProductIds** | **[String]** | ID&#39;s of related products. | [optional] 
**crossSaleProductIds** | **[String]** | ID&#39;s of Cross Saleable Products. | [optional] 
**gtins** | **[String]** | List of Global Trade Item Numbers | [optional] 
**defaultImageUrl** | **String** | The default/cover image of the Product | [optional] 
**qtyAvailable** | **Int** | Overall Quantity | [optional] 
**maxCommissionRate** | **Double** | The maximum commission rate offered by a merchant. | [optional] 
**dateCreated** | **Date** | Date of product creation | [optional] 
**dateLastModified** | **Date** | Date of last product update | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


