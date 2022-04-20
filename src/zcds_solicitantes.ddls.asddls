@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solicitantes'
@Search.searchable: true
define view entity Zcds_solicitantes as select from ZI_changes_dhl {
    @UI.hidden: true
    key id,
    @ObjectModel.text.element: ['Nombre_Solicitante']
    @UI.lineItem: [{label: 'Solicitante' }]
    s_solicitante_id as Solicitante,
//    documento,
    @UI.dataFieldDefault: [{ label: 'Nombre Solicitente' }]
    @Search.defaultSearchElement: true
    @Semantics.text: true
    
    s_solicitante_name as Nombre_Solicitante
//    departamento,
//    email,
//    fecha_registro,
//    t_change,
//    repo_trans,
//    descripcion,
//    prioridad,
//    consultor_id,
//    consultor_name,
//    status,
//    fecha_plan_entre,
//    crea_date_time,
//    crea_uname,
//    lchg_date_time,
//    lchg_uname,
//    /* Associations */
//    _Consultores,
//    _Departamentos,
//    _Documenta
}
