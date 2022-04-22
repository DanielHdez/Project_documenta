@EndUserText.label: 'Items interface'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_SALES_ITEM_DHL
  as select from zsales_item_dhl as ITEMS
  association to parent ZI_SALES_HEAD_DHL as _SALESHEAD on  $projection.Id    = _SALESHEAD.Id
                                                        and $projection.Email = _SALESHEAD.Email
  association [0..1] to I_Currency      as _Currency on $projection.Currency = _Currency.Currency
{
  key id              as Id,
  key email           as Email,
  key posicion        as Posicion,
      name            as Name,
      description     as Description,
      releasedate     as Releasedate,
      discontinuedate as Discontinuedate,
      price           as Price,
      height          as Height,
      weidth          as Weidth,
      depth           as Depth,
      quantity        as Quantity,
      unitofmesure    as Unitofmesure,
      unitofmesurel   as Unitofmesurel,
      currency        as Currency,
      //@Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _SALESHEAD,
      _Currency

}
