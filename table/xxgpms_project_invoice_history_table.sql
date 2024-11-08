  CREATE TABLE "XXGPMS_PROJECT_INVOICE_HISTORY" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY
 MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 68371 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
	"INVOICE_DATE" DATE,
	"INVOICE_NUMBER" VARCHAR2(1000),
	"ADJUSTMENTS" NUMBER,
	"INVOICE_AMOUNT" NUMBER,
	"TAX" NUMBER,
	"TOTAL_INVOICE_AMOUNT" NUMBER,
	"OPEN_BALANCE" NUMBER,
	"LAST_RECEIPT_DATE" DATE,
	"SESSION_ID" NUMBER,
	"CONTRACT_ID" NUMBER,
	"INVOICE_ID" NUMBER,
	PRIMARY KEY ("ID")
  USING INDEX
  PCTFREE 10 INITRANS 20 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 10 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"