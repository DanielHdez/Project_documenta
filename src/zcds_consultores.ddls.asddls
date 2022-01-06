@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consutores interface'
@Search.searchable: true

define view entity Zcds_consultores
  as select from zint_consultores as Consultores
{

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['ConsultorName']
  key Consultores.consultor_id   as ConsultorId,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      Consultores.consultor_name as ConsultorName,
      especialidad               as Especialidad
}
