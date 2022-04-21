@EndUserText.label: 'Cabecera orden'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root view entity ZC_SALES_Head_DHL 
provider contract transactional_query
as projection on ZI_SALES_HEAD_DHL 
 {
    key Id,
    key Email,
    Firstname,
    Lasttname,
    @ObjectModel.text.element: ['Countrycode']
    Country,
    _Country.CountryISOCode as Countrycode,
    Createon,
    Deliverydate,
    Orderstatus,
    @Semantics.imageUrl: true
    Imagenurl,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _SalesItem : redirected to composition child ZC_SALES_ITEM_DHL,
    _Country
}
