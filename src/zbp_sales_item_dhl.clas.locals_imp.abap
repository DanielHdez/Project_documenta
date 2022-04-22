CLASS lhc_ZI_SALES_ITEM_DHL DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Items RESULT result.

    METHODS ValidateUnitofMesure FOR VALIDATE ON SAVE
      IMPORTING keys FOR Items~ValidateUnitofMesure.

       METHODS ValidateDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR Items~ValidateDate.



ENDCLASS.

CLASS lhc_ZI_SALES_ITEM_DHL IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.



  METHOD ValidateDate.

  ENDMETHOD.
  METHOD ValidateUnitofMesure.

  READ ENTITIES OF zi_sales_head_dhl IN LOCAL MODE
  ENTITY ITEMS
  FIELDS ( Unitofmesure
           Height
           Weidth
           Unitofmesurel
           Depth )
  WITH VALUE #( FOR <key_row> in keys
              ( %key = <key_row>-%key ) )
  RESULT DATA(lt_resultado).

  LOOP AT lt_resultado into data(ls_resultado).

  if ( ( ls_resultado-Height is NOT INITIAL or ls_resultado-Weidth is NOT INITIAL )
     and  ls_resultado-Unitofmesure is INITIAL ) or ( ls_resultado-Depth is not INITIAL
     and ls_resultado-Unitofmesurel is INITIAL ).

   APPEND VALUE #( id = ls_resultado-Id ) TO failed-items.
        APPEND VALUE #( id = ls_resultado-Id
                       %msg               = new_message(  id       = 'ZMSGORDERS'
                                                          number  = '005'
                                                          v1      = ls_resultado-Unitofmesure
                                                          severity = if_abap_behv_message=>severity-error )
                       %element-Unitofmesure = if_abap_behv=>mk-on
                       ) TO reported-items.
  ENDIF.

  IF ls_resultado-Releasedate LT cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #( id = ls_resultado-Id ) TO failed-items.
        APPEND VALUE #( id = ls_resultado-Id
                        %msg               = new_message(  id       = 'ZMSGORDERS'
                                                          number  = '002'
                                                          v1      = ls_resultado-Releasedate
                                                          severity = if_abap_behv_message=>severity-error )
                       %element-Releasedate = if_abap_behv=>mk-on
                       ) TO reported-items.
      ELSEIF ls_resultado-Discontinuedate LE cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #( id = ls_resultado-Id ) TO failed-items.
        APPEND VALUE #( id = ls_resultado-Id
                       %msg               = new_message(  id       = 'ZMSGORDERS'
                                                          number  = '003'
                                                          v1      = ls_resultado-Discontinuedate
                                                          severity = if_abap_behv_message=>severity-error )
                       %element-Discontinuedate = if_abap_behv=>mk-on
                       ) TO reported-items.
      ELSEIF ls_resultado-Releasedate GT ls_resultado-Discontinuedate.
        APPEND VALUE #( id = ls_resultado-Id ) TO failed-items.
        APPEND VALUE #( id = ls_resultado-Id
                       %msg               = new_message(  id       = 'ZMSGORDERS'
                                                          number  = '004'
                                                           v1      = ls_resultado-Releasedate
                                                           v2      = ls_resultado-Discontinuedate
                                                           severity = if_abap_behv_message=>severity-error )
                        %element-Releasedate = if_abap_behv=>mk-on
                        %element-Discontinuedate   = if_abap_behv=>mk-on
                        ) TO reported-items.

      ENDIF.


  ENDLOOP.




  ENDMETHOD.


ENDCLASS.
