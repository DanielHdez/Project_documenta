@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consutores interface'
@Search.searchable: true

define view entity ZCDS_Unidades
  as select from zint_unidades as Unidades
{

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Unidad']
  key Unidades.id   as Unidad,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      Unidades.description as Descripcion
}
