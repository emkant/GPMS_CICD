  CREATE TABLE "GPMS_PROFILE_OPTIONS" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY
 MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE,
	"PROFILE_OPTION" VARCHAR2(100),
	"VALUE" VARCHAR2(100),
	"ENABLED" VARCHAR2(5),
	"CREATED_DATE" DATE,
	"EXPIRY_DATE" DATE,
	CONSTRAINT "GPMS_PROFILE_OPTIONS_PK" PRIMARY KEY ("ID")
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