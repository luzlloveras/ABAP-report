*&---------------------------------------------------------------------*
*& Include          ZVUELOS_LLOVERAS_TOP
*&---------------------------------------------------------------------*


*----------- Parametros --------------
TABLES scustom.
PARAMETERS: r_id   RADIOBUTTON GROUP rb1 USER-COMMAND uc DEFAULT 'X', "Radio buttom
            r_nom  RADIOBUTTON GROUP rb1, "Radio buttom
            p_id   TYPE scustom-id MODIF ID a,
            p_name TYPE scustom-name MODIF ID b.