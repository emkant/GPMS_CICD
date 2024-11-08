  CREATE TABLE "XXGPMS_PROJECT_WIP_CATEGORY" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY
 MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 554759 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
	"WIP_CATEGORY" VARCHAR2(200),
	"DRAFT_NUMBER" VARCHAR2(100),
	"AGREEMENT_NUMBER" VARCHAR2(200),
	"PROJECT_NUMBER" VARCHAR2(200),
	"SESSION_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 10 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"