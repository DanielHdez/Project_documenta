@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Documentacion'
define view entity ZI_Documenta_DHL as select from ztdocumenta_dhl as Documento
composition [0..*] of ZI_Pasos_dhl as _Pasos 
composition [0..*] of ZI_requerimientos as _Requerimientos 
association to parent ZI_changes_dhl as _Incident on $projection.id = _Incident.id
   {
    key id,
    key n_document,
    tipo_doc,
    fecha_registro,
    s_gmp,
    repo_trans,
    descripcion,
    status,
    ots,
    fecha_evaluacion,
    fecha_cambio,
    fecha_cierre,
    entorno_actual,
    ruta_doc,
    crea_date_time,
    crea_uname,
    lchg_date_time,
    lchg_uname,
    _Pasos,
    _Requerimientos,
    _Incident
}
