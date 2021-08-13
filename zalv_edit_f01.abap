*&---------------------------------------------------------------------*
*& Include          ZALV_EDIT2_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form GET_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .
  SELECT * INTO TABLE gt_alumnos FROM zalumnos.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form GET_ALV
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_alv .
*Declaraciones de tipos, estructuras y tablas propias del ALV

  TYPE-POOLS: slis.

*Tabla y estructura del catalogo
  DATA: ti_catalogo TYPE slis_t_fieldcat_alv,
        st_catalogo TYPE slis_fieldcat_alv,
*Estructura para la configuracion de la salida
        st_layout   TYPE slis_layout_alv,
*Variable con el nombre del programa
        v_repid     LIKE sy-repid.

*Armado del catalogo del ALV --------------------- ABAP 740 ----------------------------

  ti_catalogo = VALUE #( ( fieldname = 'DNI' seltext_l = 'DNI' outputlen = '15' edit = 'X' )
  ( fieldname = 'NOMBRE' seltext_l = 'NOMBRE' outputlen = '15' edit = 'X' )
  ( fieldname = 'APELLIDO' seltext_l = 'APELLIDO' outputlen = '15' edit = 'X' ) ).

*Configuracion de la salida del ALV
  CLEAR st_layout.
  st_layout-zebra = abap_true. "Rayado de lineas
  st_layout-colwidth_optimize = abap_true.


*Ejecucion de la funcion del ALV

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program      = sy-repid
      i_callback_user_command = 'HANDLE_USER_COMMAND'
      is_layout               = st_layout "slis_layout_alv
      it_fieldcat             = ti_catalogo "slis_t_fieldcat_alv
    TABLES
      t_outtab                = gt_alumnos
    EXCEPTIONS
      program_error           = 1
      OTHERS                  = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

ENDFORM.

FORM handle_user_command USING r_ucomm     LIKE sy-ucomm
                               rs_selfield TYPE slis_selfield.
  IF r_ucomm = '&DATA_SAVE'.
    MODIFY zalumnos FROM TABLE gt_alumnos.
    IF sy-subrc = 0.
      MESSAGE 'Se modificó exitosamente la tabla' TYPE 'S'.
    ELSE.
      MESSAGE 'No se pudo moficicar la tabla' TYPE 'E'.
    ENDIF.
  ENDIF.
ENDFORM.
