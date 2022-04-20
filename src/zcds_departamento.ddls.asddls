@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Departamentos'
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity Zcds_departamento
  as select from zdepartamentos as Departamentos
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Nombre']
  key id_departament as IdDepartament,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      d_name         as Nombre,
      @Search.defaultSearchElement: true
      d_adress       as Direccion,
      d_phone        as Telefono,
      @Search.defaultSearchElement: true
      d_email        as Email
}
