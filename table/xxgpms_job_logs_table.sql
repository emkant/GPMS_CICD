  CREATE TABLE "XXGPMS_JOB_LOGS" 
   (	"JOB_NAME" VARCHAR2(100 CHAR),
	"START_TS" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"END_TS" TIMESTAMP (6) WITH LOCAL TIME ZONE,
	"STATUS" VARCHAR2(100 CHAR),
	"ERROR" CLOB
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 10 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"
 LOB ("ERROR") STORE AS SECUREFILE  (
  TABLESPACE "DATA" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING NOCOMPRESS KEEP_DUPLICATES 
  STORAGE( INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT))