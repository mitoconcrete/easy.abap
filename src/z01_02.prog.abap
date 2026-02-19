*&---------------------------------------------------------------------*
*& Report Z01_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01_02.

TYPES: BEGIN OF ts_test,
        empcd TYPE zemplist-empcd,
        ename TYPE zemplist-ename,
        depcd TYPE zemplist-depcd,
       END OF ts_test.

DATA gs_test TYPE ts_test.

SELECT SINGLE empcd, ename, depcd
  FROM zemplist
  WHERE empcd = '1001'
  INTO @gs_test.

cl_demo_output=>display( gs_test ).
