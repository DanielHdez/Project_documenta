@EndUserText.label: 'Cabecera de ordenes'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZI_SALES_HEAD_DHL as select from zsales_head_dhl as HEADER
composition [0..*] of ZI_SALES_ITEM_DHL as _SalesItem 
association [0..1] to I_Country      as _Country on $projection.Country = _Country.Country
{
    key id as Id,
         @Semantics.eMail.address: true
    key email as Email,
    firstname as Firstname,
    lasttname as Lasttname,
    country as Country,
    createon as Createon,
    deliverydate as Deliverydate,
    orderstatus as Orderstatus,
    imagenurl as Imagenurl,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
     @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    _SalesItem,
    _Country
}
