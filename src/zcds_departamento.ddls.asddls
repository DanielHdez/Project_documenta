@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Departamentos'
@Search.searchable: true
define view entity Zcds_departamento
  as select from zdepartamentos as Departamentos
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['DName']
  key id_departament as IdDepartament,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      d_name         as DName,
      @Search.defaultSearchElement: true
      d_adress       as DAdress,
      d_phone        as DPhone,
      @Search.defaultSearchElement: true
      d_email        as DEmail
}
