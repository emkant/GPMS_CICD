prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>7335182145699007
,p_default_application_id=>150
,p_default_id_offset=>13984863123593697
,p_default_owner=>'WKSP_FRONGPMSTDEV'
);
wwv_flow_imp_page.create_page(
 p_id=>7
,p_name=>'Fee Allocation'
,p_alias=>'FEE-ALLOCATION1'
,p_page_mode=>'MODAL'
,p_step_title=>'Fee Allocation'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36683208137316898)
,p_plug_name=>'Form on Person Name'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294395967304717101)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(36684601208316912)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'u-color-9'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15672706291406535)
,p_name=>'P7_FEES_DUMMY'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17681556406886933)
,p_name=>'P7_JUSTIFICATION_CODE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_prompt=>'Justification'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Client Satisfaction;Client Satisfaction,Billing Error;Billing Error,B.I.S.S.;B.I.S.S.,We do not pay for summer associates;We do not pay for summer associates'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- SELECT --'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(294483217619717164)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17681817786889029)
,p_name=>'P7_JUSTIFICATION_TEXT'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>150
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483217619717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27134423448421041)
,p_name=>'P7_PROJECT_NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27134529957421042)
,p_name=>'P7_AGREEMENT_NUMBER'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36683328569316899)
,p_name=>'P7_PERSON_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_prompt=>'Person Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36683340446316900)
,p_name=>'P7_LINES'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_prompt=>'Lines'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36683515229316901)
,p_name=>'P7_HOURS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_prompt=>'Hours'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36683935245316905)
,p_name=>'P7_ADJUSTMENT_FEES'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_prompt=>'Write Down (-Up) Amount'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36684109371316907)
,p_name=>'P7_JOB_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_prompt=>'Job Name'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36684918957316915)
,p_name=>'P7_ADJUSTMENT_FEES_HIDDEN'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41476450185350688)
,p_name=>'P7_REALIZATION_PCT'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_prompt=>'Realization %'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'is-readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41476599130350689)
,p_name=>'P7_FEES'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_prompt=>'Fees'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41476681022350690)
,p_name=>'P7_FEE_ALLOCATION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_prompt=>'Fee Allocation'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41476753192350691)
,p_name=>'P7_WRITE_DOWN_PCT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(36683208137316898)
,p_prompt=>'Write Down (-Up) %'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(16676928017673413)
,p_validation_name=>'Justification is needed for Write Up/Down'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (to_number(:P7_WRITE_DOWN_PCT, ''999G999G999G999G990D000'')  <>0 ',
'  or to_number(:P7_ADJUSTMENT_FEES, ''999G999G999G999G990D000'') <> 0)',
'then',
'  if coalesce(:P7_JUSTIFICATION_CODE,:P7_JUSTIFICATION_TEXT,''~!~'') = ''~!~''',
'  then',
'    return ''Justification is needed if Write Up/Down is performed!'';',
'  end if;',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_imp.id(36684601208316912)
,p_associated_item=>wwv_flow_imp.id(17681556406886933)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(36684771876316914)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save the Adjustment'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  V_STATUS NUMBER;',
'  V_EXP_ID VARCHAR2(32767);',
'BEGIN',
'if :P7_WRITE_DOWN_PCT <> 0 or :P7_ADJUSTMENT_FEES <> 0',
'then',
'SELECT ''-''||LISTAGG(EXPENDITURE_ITEM_ID,''-'')||''-''',
'INTO   V_EXP_ID',
'FROM   XXGPMS_PROJECT_COSTS ',
'WHERE  PERSON_NAME = :P7_PERSON_NAME',
'and    lower(wip_category) = ''labor''',
'AND    SESSION_ID = V(''APP_SESSION'');',
'',
'    V_STATUS :=',
'        XX_GPMS.WIP_TAG_ADJUSTMENT (V_EXP_ID,',
'                                    :P7_AGREEMENT_NUMBER,',
'                                    :P7_WRITE_DOWN_PCT,',
'                                    :P7_FEES_DUMMY-to_number(:P7_ADJUSTMENT_FEES, ''999G999G999G999G990D000''),',
'                                    :P7_FEES_DUMMY,',
'                                    ''Y'',',
'                                    :P7_JUSTIFICATION_CODE',
'                                    ||CASE WHEN :P7_JUSTIFICATION_TEXT IS NOT NULL',
'                                       THEN '': ''||:P7_JUSTIFICATION_TEXT',
'                                       END',
'                                    );',
'',
'IF (:P0_CUMULATIVE_EXP_ID IS NULL)',
'THEN',
':P0_CUMULATIVE_EXP_ID := V_EXP_ID;',
'ELSE',
':P0_CUMULATIVE_EXP_ID := :P0_CUMULATIVE_EXP_ID||''-''||V_EXP_ID;',
'END IF;',
'end if;                                    ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(36684601208316912)
,p_process_success_message=>'Adjustment Successful!!'
,p_internal_uid=>22699908752723217
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(36896779669308590)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_01=>'P0_CUMULATIVE_EXP_ID'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>22911916545714893
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(36684010529316906)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load the Information for the Person'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT --JOB_NAME,',
'     LINES,',
'     HOURS,',
'     to_char(FEES,''999G999G999G999G990D00''),',
'     fees,',
'     trunc(WRITE_DOWN,2),',
'     trunc(WRITE_DOWN_PCT,2),',
'     FEE_ALLOCATION,',
'     REALIZATION_PCT',
'INTO',
'    -- :P7_JOB_NAME,',
'    :P7_LINES,',
'    :P7_HOURS,',
'    :P7_FEES,',
'    :P7_FEES_DUMMY,',
'    :P7_ADJUSTMENT_FEES,',
'    :P7_WRITE_DOWN_PCT,',
'    :P7_FEE_ALLOCATION,',
'    :P7_REALIZATION_PCT',
'FROM',
'(SELECT PERSON_NAME,',
'    --    JOB_NAME,',
'       COUNT(*)                   LINES,',
'       SUM(QUANTITY)              HOURS,',
'       SUM(PROJECT_BILL_RATE_AMT) FEES,',
'       SUM(PROJECT_BILL_RATE_AMT) -   SUM(REALIZED_BILL_RATE_AMT) WRITE_DOWN,',
'       (SUM(PROJECT_BILL_RATE_AMT) - SUM(REALIZED_BILL_RATE_AMT))/DECODE(SUM(PROJECT_BILL_RATE_AMT),0,1,NULL,1,SUM(PROJECT_BILL_RATE_AMT))*100    WRITE_DOWN_PCT,',
'       SUM(REALIZED_BILL_RATE_AMT) FEE_ALLOCATION,',
'       ROUND(SUM(REALIZED_BILL_RATE_AMT)/DECODE(SUM(STANDARD_BILL_RATE_AMT),0,1,NULL,1,SUM(STANDARD_BILL_RATE_AMT))*100,2)        REALIZATION_PCT',
'FROM XXGPMS_PROJECT_COSTS',
'WHERE SESSION_ID = V(''APP_SESSION'')',
'AND   PROJECT_NUMBER = COALESCE(:P7_PROJECT_NUMBER,project_number)',
'and   contract_number = nvl(:P7_AGREEMENT_NUMBER,contract_number)',
'AND  UPPER(TRIM(PERSON_NAME)) = UPPER(TRIM(:P7_PERSON_NAME))',
'and  lower(wip_category) = ''labor''',
'GROUP BY PERSON_NAME',
'-- ,JOB_NAME',
')',
'-- FETCH FIRST ROW ONLY',
'-- WHERE  UPPER(TRIM(PERSON_NAME)) = UPPER(TRIM(:P7_PERSON_NAME))',
';'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>22699147405723209
);
wwv_flow_imp.component_end;
end;
/
