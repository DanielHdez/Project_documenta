CLASS zcl_idata_dhl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_idata_dhl IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_department  TYPE STANDARD TABLE OF ZDepartamentos,
          lt_consultores TYPE STANDARD TABLE OF zint_consultores,
          lt_unidades    TYPE STANDARD TABLE OF zint_unidades.
    DATA: ls_department  TYPE ZDepartamentos,
          ls_consultores TYPE zint_consultores,
          ls_unidades    TYPE zint_unidades.
*
    ls_department-id_departament = '001'.
    ls_department-d_name = 'Contabilidad'.
    ls_department-d_email = 'Contabilidad@dom.es'.
    ls_department-d_adress = 'Planta 1, edificio 1'.
    ls_department-d_phone = '+34888555222'.
    APPEND ls_department TO lt_department.
    CLEAR ls_department.
    ls_department-id_departament = '002'.
    ls_department-d_name = 'Supply Chain'.
    ls_department-d_email = 'Supply@dom.es'.
    ls_department-d_adress = 'Planta 1, edificio 2'.
    ls_department-d_phone = '+34888555333'.
    APPEND ls_department TO lt_department.
    ls_department-id_departament = '003'.
    ls_department-d_name = 'Ventas'.
    ls_department-d_email = 'Ventas@dom.es'.
    ls_department-d_adress = 'Planta 1, edificio 3'.
    ls_department-d_phone = '+34888555321'.
    APPEND ls_department TO lt_department.
    ls_department-id_departament = '004'.
    ls_department-d_name = 'Finanzas'.
    ls_department-d_email = 'Finanzas@dom.es'.
    ls_department-d_adress = 'Planta 2, edificio 1'.
    ls_department-d_phone = '+34888555123'.
    APPEND ls_department TO lt_department.
    ls_department-id_departament = '005'.
    ls_department-d_name = 'RRHH'.
    ls_department-d_email = 'RRHH@dom.es'.
    ls_department-d_adress = 'Planta 2, edificio 2'.
    ls_department-d_phone = '+34888555222'.
    APPEND ls_department TO lt_department.
    ls_department-id_departament = '006'.
    ls_department-d_name = 'Compras'.
    ls_department-d_email = 'Compras@dom.es'.
    ls_department-d_adress = 'Planta 1, Edificio 4'.
    ls_department-d_phone = '+34888555145'.
    APPEND ls_department TO lt_department.
    ls_department-id_departament = '007'.
    ls_department-d_name = 'Planificacion'.
    ls_department-d_email = 'Planificacion@dom.es'.
    ls_department-d_adress = 'Planta 1, Edificio 4'.
    ls_department-d_phone = '+34888555145'.
    APPEND ls_department TO lt_department.
    ls_department-id_departament = '008'.
    ls_department-d_name = 'Producci??n'.
    ls_department-d_email = 'Producci??n@dom.es'.
    ls_department-d_adress = 'Planta 3, Edificio 1'.
    ls_department-d_phone = '+34258655514'.
    APPEND ls_department TO lt_department.

    ls_consultores-consultor_id = '001'.
    ls_consultores-consultor_name = 'Pedro de Le??n'.
    ls_consultores-especialidad = 'Finanzas'.
    APPEND ls_consultores TO lt_consultores.

    ls_consultores-consultor_id = '002'.
    ls_consultores-consultor_name = 'Juan de la Cruz'.
    ls_consultores-especialidad = 'Finanzas'.
    APPEND ls_consultores TO lt_consultores.

    ls_consultores-consultor_id = '003'.
    ls_consultores-consultor_name = 'David Ant??n'.
    ls_consultores-especialidad = 'Ventas'.
    APPEND ls_consultores TO lt_consultores.

    ls_consultores-consultor_id = '004'.
    ls_consultores-consultor_name = 'David juanchu'.
    ls_consultores-especialidad = 'Compras'.
    APPEND ls_consultores TO lt_consultores.

    ls_consultores-consultor_id = '005'.
    ls_consultores-consultor_name = 'Dolores Piqueta'.
    ls_consultores-especialidad = 'Abap'.
    APPEND ls_consultores TO lt_consultores.

    ls_consultores-consultor_id = '006'.
    ls_consultores-consultor_name = 'Daniel Hernandez'.
    ls_consultores-especialidad = 'Abap'.
    APPEND ls_consultores TO lt_consultores.

    ls_unidades-client       = '001'.
    ls_unidades-id           = 'Kg'.
    ls_unidades-description  = 'Kilogramo'.
    APPEND ls_unidades TO lt_unidades.

    ls_unidades-client       = '001'.
    ls_unidades-id           = 'Gr'.
    ls_unidades-description  = 'Gramos'.
    APPEND ls_unidades TO lt_unidades.

    ls_unidades-client       = '001'.
    ls_unidades-id           = 'm'.
    ls_unidades-description  = 'metros'.
    APPEND ls_unidades TO lt_unidades.

    ls_unidades-client       = '001'.
    ls_unidades-id           = 'Cm'.
    ls_unidades-description  = 'Centimetros'.
    APPEND ls_unidades TO lt_unidades.

    ls_unidades-client       = '001'.
    ls_unidades-id           = 'l'.
    ls_unidades-description  = 'Litros'.
    APPEND ls_unidades TO lt_unidades.


    DELETE FROM: ZDepartamentos, zint_consultores .
    INSERT: ZDepartamentos FROM TABLE @lt_department,
            zint_consultores FROM TABLE @lt_consultores,
            zint_unidades FROM TABLE @lt_unidades.
    out->write( 'DONE!' ).


  ENDMETHOD.
ENDCLASS.
