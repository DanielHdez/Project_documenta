@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CONSUMER PASOS'
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_Pasos_dhl 
as projection on ZI_Pasos_dhl {

    key id as Id,
    key n_document as NDocument,
    key paso as Paso,
    documento as Documento,
    descripcion as Descripcion,
    fecha_registro as FechaRegistro,
    repo_trans as RepoTrans,
    status as Status,
    ruta_doc as RutaDoc,
    ot as Ot,
    cambios_realizados as CambiosRealizados,
//    crea_date_time as CreaDateTime,
//    crea_uname as CreaUname,
//    lchg_date_time as LchgDateTime,
//    lchg_uname as LchgUname,
    /* Associations */
    _Documenta : redirected to parent Zc_Documenta_DHL,
    _Incident : redirected to ZC_Changes_DHL
    }
