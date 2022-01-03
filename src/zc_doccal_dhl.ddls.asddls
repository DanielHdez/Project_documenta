@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumer documentacion'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_DOCCAL_DHL 
as projection on ZI_Documenta_DHL {
    key id as Id,
    key n_document as NDocument,
    tipo_doc as TipoDoc,
    fecha_registro as FechaRegistro,
    s_gmp as SGmp,
    repo_trans as RepoTrans,
    descripcion as Descripcion,
    status as Status,
    ots as Ots,
    fecha_evaluacion as FechaEvaluacion,
    fecha_cambio as FechaCambio,
    fecha_cierre as FechaCierre,
    entorno_actual as EntornoActual,
    ruta_doc as RutaDoc,
    crea_date_time as CreaDateTime,
    crea_uname as CreaUname,
    lchg_date_time as LchgDateTime,
    lchg_uname as LchgUname,
    /* Associations */
    _Incident : redirected to parent ZC_ChanCal_DHL,
//    _Pasos : redirected to composition child ZC_Pasos_dhl,
    _Requerimientos : redirected to composition child ZC_REQUECAL
} where status = 'P_EVALUA' or status = 'P_CAMBIO' or status = 'P_CIERRE' 
