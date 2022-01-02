@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Pasos de la documentación'
define view entity ZI_Pasos_dhl as select from ztpasosi_dhl as Pasos
association to parent ZI_Documenta_DHL as _Documenta on $projection.id = _Documenta.id
and $projection.n_document = _Documenta.n_document
association to ZI_changes_dhl as _Incident on $projection.id = _Incident.id
{
    key id,
    key n_document,
    key paso,
    descripcion,
    fecha_registro,
    repo_trans,
    status,
    ruta_doc,
    ot,
    cambios_realizados,
    crea_date_time,
    crea_uname,
    lchg_date_time,
    lchg_uname,
    _Incident,
    _Documenta
   
}
