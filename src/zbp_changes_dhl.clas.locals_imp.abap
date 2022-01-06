CLASS lhc_Cambios DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Cambios RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Cambios RESULT result.

    METHODS AsignarConsultor FOR MODIFY
      IMPORTING keys FOR ACTION Cambios~AsignarConsultor RESULT result.

    METHODS ValidateConsultant FOR VALIDATE ON SAVE
      IMPORTING keys FOR Cambios~ValidateConsultant.

    METHODS ValidateDepartment FOR VALIDATE ON SAVE
      IMPORTING keys FOR Cambios~ValidateDepartment.

    METHODS ValidateStatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR Cambios~ValidateStatus.

ENDCLASS.

CLASS lhc_Cambios IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD AsignarConsultor.
  ENDMETHOD.

  METHOD ValidateConsultant.
  ENDMETHOD.

  METHOD ValidateDepartment.
  ENDMETHOD.

  METHOD ValidateStatus.
  ENDMETHOD.

ENDCLASS.
