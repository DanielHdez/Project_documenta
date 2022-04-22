CLASS lhc_ZI_SALES_HEAD_DHL DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Head RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Head RESULT result.

    METHODS ValidateDeliveryDAte FOR VALIDATE ON SAVE
      IMPORTING keys FOR Head~ValidateDeliveryDAte.

    METHODS ValidateStatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR Head~ValidateStatus.

ENDCLASS.

CLASS lhc_ZI_SALES_HEAD_DHL IMPLEMENTATION.

  METHOD get_instance_features.

    READ ENTITIES OF zi_sales_head_dhl IN LOCAL MODE
     ENTITY head
     FIELDS ( email )
     WITH VALUE #(  FOR <key_row> IN keys
                 (  %key = <key_row>-%key ) )
     RESULT DATA(lt_salesorder).
    DATA(lv_hoy) = cl_abap_context_info=>get_system_date( ).
    LOOP AT lt_salesorder ASSIGNING FIELD-SYMBOL(<fs_salesorder>).

    ENDLOOP.



*    IF lt_travel_result IS NOT INITIAL.
*      MODIFY ENTITIES OF zi_sales_head_dhl IN LOCAL MODE
*      ENTITY Head
*      UPDATE FIELDS ( Createon )
*      WITH VALUE #(  FOR <key_row> IN keys
*                  (  %key = <key_row>-%key
*                     Createon = cl_abap_context_info=>get_user_time_zone( ) ) )
*      FAILED failed
*      REPORTED reported.

*    ENDIF.




  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD ValidateDeliveryDAte.

    READ ENTITY zi_sales_head_dhl\\head
      FIELDS ( Createon Deliverydate )
      WITH VALUE #( FOR <ls_keys> IN keys ( %key = <ls_keys>-%key ) )
      RESULT DATA(lt_sales).

    LOOP AT lt_sales ASSIGNING FIELD-SYMBOL(<fs_sales>).

           IF <fs_sales>-Createon LT cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #( id = <fs_sales>-Id
                        email = <fs_sales>-Email ) TO failed-head.
        APPEND VALUE #( id = <fs_sales>-Id
                        email = <fs_sales>-Email
                       %msg               = new_message(  id       = 'ZMSGORDERS'
                                                          number  = '002'
                                                          v1      = <fs_sales>-createon
                                                          severity = if_abap_behv_message=>severity-error )
                       %element-createon = if_abap_behv=>mk-on
                       ) TO reported-head.
      ELSEIF <fs_sales>-Deliverydate LE cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #( id = <fs_sales>-Id
                               email = <fs_sales>-Email ) TO failed-head.
        APPEND VALUE #( id = <fs_sales>-Id
                        email = <fs_sales>-Email
                       %msg               = new_message(  id       = 'ZMSGORDERS'
                                                          number  = '003'
                                                          v1      = <fs_sales>-Deliverydate
                                                          severity = if_abap_behv_message=>severity-error )
                       %element-Deliverydate = if_abap_behv=>mk-on
                       ) TO reported-head.
      ELSEIF <fs_sales>-Createon GT <fs_sales>-Deliverydate.
        APPEND VALUE #( id = <fs_sales>-Id
                                email = <fs_sales>-Email ) TO failed-head.
        APPEND VALUE #( id = <fs_sales>-Id
                        email = <fs_sales>-Email
                       %msg               = new_message(  id       = 'ZMSGORDERS'
                                                          number  = '004'
                                                           v1      = <fs_sales>-Createon
                                                           v2      = <fs_sales>-Deliverydate
                                                           severity = if_abap_behv_message=>severity-error )
                        %element-Createon = if_abap_behv=>mk-on
                        %element-Deliverydate   = if_abap_behv=>mk-on
                        ) TO reported-head.

      ENDIF.

    ENDLOOP.



  ENDMETHOD.

  METHOD ValidateStatus.

    READ ENTITY zi_sales_head_dhl
     FIELDS ( orderStatus )
     WITH VALUE #( FOR <ls_keys> IN keys ( %key = <ls_keys>-%key ) )
     RESULT DATA(lt_order_result).
    LOOP AT lt_order_result ASSIGNING FIELD-SYMBOL(<fs_order_result>).
      CASE <fs_order_result>-orderStatus.

        WHEN '1'.
        WHEN '1'.
        WHEN '3'.
        WHEN OTHERS.
          APPEND VALUE #( id = <fs_order_result>-Id email = <fs_order_result>-Email  ) TO failed-head.
          APPEND VALUE #( id = <fs_order_result>-Id email = <fs_order_result>-Email
                         %msg               = new_message(  id       = 'ZMSGORDERS'
                                                            number  = '001'
                                                            v1      = <fs_order_result>-orderStatus
                                                            severity = if_abap_behv_message=>severity-error )
                         %element-orderstatus = if_abap_behv=>mk-on
                         ) TO reported-head.
      ENDCASE.
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
