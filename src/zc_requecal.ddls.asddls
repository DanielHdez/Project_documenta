@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Requerimeientos de la documentación'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_REQUECAL
  as projection on ZI_requerimientos
{
  key id             as Id,
  key n_document     as NDocument,
  key requerimiento  as Requerimiento,
      descripcion    as Descripcion,
      fecha_registro as FechaRegistro,
      user_ejecuta   as UserEjecuta,
      departamento   as Departamento,
      status         as Status,
      validado       as Validado,
      ruta_doc       as RutaDoc,
//      crea_date_time as CreaDateTime,
//      crea_uname     as CreaUname,
//      lchg_date_time as LchgDateTime,
//      lchg_uname     as LchgUname,
      /* Associations */
      _Documenta : redirected to parent ZC_DOCCAL_DHL,
      _Incident  : redirected to ZC_ChanCal_DHL
} where status = 'P. FIRMA'
