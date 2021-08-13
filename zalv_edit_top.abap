*&---------------------------------------------------------------------*
*& Include          ZALV_EDIT2_TOP
*&---------------------------------------------------------------------*
DATA: gt_alumnos            TYPE TABLE OF zalumnos,
      gr_table            TYPE REF TO cl_salv_table,
      gr_functions        TYPE REF TO cl_salv_functions,
      lo_alv              TYPE REF TO cl_salv_table,
      lex_message         TYPE REF TO cx_salv_msg,
      lo_layout_settings  TYPE REF TO cl_salv_layout,
      lo_layout_key       TYPE        salv_s_layout_key,
      lo_columns          TYPE REF TO cl_salv_columns_table,
      lo_column           TYPE REF TO cl_salv_column,
      lex_not_found       TYPE REF TO cx_salv_not_found,
      lo_functions        TYPE REF TO cl_salv_functions_list,
      lo_display_settings TYPE REF TO cl_salv_display_settings.
