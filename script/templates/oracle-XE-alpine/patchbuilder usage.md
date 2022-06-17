# Using Oracle in a Docker Container for PatchBuilder
To use an Oracle Docker container you have to
- create the hereunder required tablespaces on the installed instance (the default for this version is _XE_)
    + DBENG_M00A
    + DBENG_M00B
    + DBENG_M01A
    + DBENG_M01B
    + DBENG_M02A
    + DBENG_M02B
    + DBENG_M04A
    + DBENG_M04B
    + DBENG_M05A
    + DBENG_M05B
    + DBENG_M06A
    + DBENG_M06B
    + DBENG_M07A
    + DBENG_M07B
    + DBENG_U

Please checkout the "create-tablespace.md"