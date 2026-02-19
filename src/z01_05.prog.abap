*&---------------------------------------------------------------------*
*& Report Z01_05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z01_05.

TYPES: BEGIN OF ts_test,
    empcd    TYPE zemplist-empcd,
    ename    TYPE zemplist-ename,
    depcd    TYPE zemplist-depcd,
    dname    TYPE zteamlist-dname,
    relation TYPE zfamily-relation,
    fname    TYPE zfamily-fname,
    bdate    TYPE zfamily-bdate,
    rel_desc TYPE dd07t-ddtext,
  END OF ts_test.

DATA: gt_test TYPE TABLE OF ts_test.

TABLES zemplist.
SELECT-OPTIONS s_empcd FOR zemplist-empcd.

SELECT
  a~empcd,
  a~ename,
  a~depcd,
  b~dname,
  c~relation,
  c~fname,
  c~bdate,
  d~ddtext AS rel_desc
FROM
  zemplist AS a
INNER JOIN
  zteamlist AS b
ON a~depcd EQ b~depcd
LEFT OUTER JOIN
  zfamily AS c
ON a~empcd EQ c~empcd
LEFT OUTER JOIN
  dd07t AS d
ON c~relation EQ d~domvalue_l
    AND d~domname EQ 'ZDRELATION'
    AND d~ddlanguage EQ @sy-langu
    AND d~as4local EQ 'A'
    AND d~as4vers EQ '0000'
WHERE a~empcd IN @s_empcd
INTO TABLE @gt_test.


*cl_demo_output=>display( gt_test ).
DATA : gs_test TYPE ts_test.
LOOP AT gt_test INTO gs_test.
  WRITE: / gs_test-empcd, gs_test-ename, gs_test-depcd, gs_test-dname, gs_test-relation, gs_test-fname, gs_test-bdate, gs_test-rel_desc.
  ULINE.
ENDLOOP.
