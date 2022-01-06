@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS de root'
define root view entity ZI_changes_dhl as select from ztchanges_dhl as Incident
composition [0..*] of ZI_Documenta_DHL as _Documenta 
association [0..1] to Zcds_consultores as _Consultores on $projection.consultor_id = _Consultores.ConsultorId
association [0..1] to Zcds_departamento as _Departamentos on $projection.departamento = _Departamentos.IdDepartament
{
    key id,
    s_solicitante_id,
    documento,
    s_solicitante_name ,
    departamento ,
    email ,
    fecha_registro,
    t_change ,
    repo_trans ,
    descripcion,
    prioridad ,
    consultor_id,
    consultor_name,
    status,
    fecha_plan_entre,
    @Semantics.systemDateTime.createdAt: true
    crea_date_time,
    @Semantics.user.createdBy: true
    crea_uname,
    @Semantics.systemDateTime.lastChangedAt: true
    lchg_date_time,
    @Semantics.user.lastChangedBy: true
    lchg_uname,
    _Documenta,
    _Consultores,
    _Departamentos
    
}
