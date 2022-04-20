@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Requerimeientos de la documentación'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_requerimientos as select from ztrequeri_dhl 
association to parent ZI_Documenta_DHL as _Documenta on $projection.id = _Documenta.id
and $projection.n_document = _Documenta.n_document
association to ZI_changes_dhl as _Incident on $projection.id = _Incident.id

{
    key id,
    key n_document,
    key requerimiento,
    documento,
    descripcion,
    fecha_registro,
    user_ejecuta,
    departamento,
    status,
    validado,
    ruta_doc ,
    crea_date_time,
    crea_uname,
    lchg_date_time,
    lchg_uname,
    _Incident,
    _Documenta
}
