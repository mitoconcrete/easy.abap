*&---------------------------------------------------------------------*
*& Report Z01_04
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01_04.

TYPES: BEGIN OF ts_test,
        empcd TYPE zemplist-empcd,
        ename TYPE zemplist-ename,
        depcd TYPE zemplist-depcd,
        dname TYPE zteamlist-dname,
       END OF ts_test.

DATA gt_test TYPE TABLE OF ts_test.

TABLES: zemplist.
SELECT-OPTIONS s_empcd
FOR zemplist-empcd.

SELECT a~empcd, a~ename, a~depcd, b~dname
  FROM zemplist AS a
    INNER JOIN zteamlist AS b
    ON a~depcd EQ b~depcd
  WHERE a~empcd IN @s_empcd
  INTO TABLE @gt_test.

cl_demo_output=>display( gt_test ).
