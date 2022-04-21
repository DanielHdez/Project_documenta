@EndUserText.label: 'Posiciones de la orden'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_SALES_ITEM_DHL as projection on ZI_SALES_ITEM_DHL {
    key Id,
    key Email,
    key Posicion,
    Name,
    Description,
    Releasedate,
    Discontinuedate,
    Price,
    Height,
    Weidth,
    Depth,
    Quantity,
    Unitofmesure,
    Unitofmesurel,
    Currency,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _SALESHEAD :  redirected to parent ZC_SALES_Head_DHL
}
