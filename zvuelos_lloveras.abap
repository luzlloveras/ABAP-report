*&---------------------------------------------------------------------*
*& Report ZVUELOS_LLOVERAS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zvuelos_lloveras.

INITIALIZATION.

  INCLUDE: zvuelos_lloveras_top,
  zvuelos_lloveras_f01.

AT SELECTION-SCREEN OUTPUT.

  PERFORM f_radiobuttom.

start-of-selection.
  IF p_id IS INITIAL AND p_name IS INITIAL.
      message 'Debe llenar al menos un campo para poder ejecutar el programa' type 'E'.
  ENDIF.

perform f_getdata.
perform f_savedata.
perform f_alv.
perform f_excel.