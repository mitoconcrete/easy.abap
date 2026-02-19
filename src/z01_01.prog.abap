*&---------------------------------------------------------------------*
*& Report Z01_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01_01.

PARAMETERS: p_empcd TYPE zemplist-empcd.
DATA gv_ename TYPE zemplist-ename.

SELECT SINGLE ename FROM zemplist
  WHERE empcd EQ @p_empcd
  INTO @gv_ename.

WRITE gv_ename.
