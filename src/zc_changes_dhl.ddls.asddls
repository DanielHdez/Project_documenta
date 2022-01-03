@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumo root'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_Changes_DHL
provider contract transactional_query
as projection on ZI_changes_dhl  {
  
    key id as Id,
    @ObjectModel.text.element: ['SolicitanteName']
    s_solicitante_id as SolicitanteId,
    s_solicitante_name as SolicitanteName,
    departamento as Departamento,
    @Semantics.eMail.address: true
    email as Email,
    fecha_registro as FechaRegistro,
    t_change as TChange,
    repo_trans as RepoTrans,
    descripcion as Descripcion,
    prioridad as Prioridad,
   @ObjectModel.text.element: ['ConsultorName']
    consultor_id as ConsultorId,
    consultor_name as ConsultorName,
    status as Status,
    fecha_plan_entre as FechaPlanEntre,
//    crea_date_time as CreaDateTime,
//    crea_uname as CreaUname,
//    lchg_date_time as LchgDateTime,
//    lchg_uname as LchgUname,
    _Documenta : redirected to composition child Zc_Documenta_DHL // Make association public
}
