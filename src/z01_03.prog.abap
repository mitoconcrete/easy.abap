*&---------------------------------------------------------------------*
*& Report Z01_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01_03.

TYPES: BEGIN OF ts_test,
        empcd TYPE zemplist-empcd,
        ename TYPE zemplist-ename,
        depcd TYPE zemplist-depcd,
       END OF ts_test.

DATA gt_test TYPE TABLE OF ts_test.

TABLES: zemplist.
SELECT-OPTIONS s_empcd
FOR zemplist-empcd.

SELECT empcd, ename, depcd
  FROM zemplist
  WHERE empcd IN @s_empcd
  INTO TABLE @gt_test.

cl_demo_output=>display( gt_test ).
