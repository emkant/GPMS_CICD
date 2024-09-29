prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>7335182145699007
,p_default_application_id=>150
,p_default_id_offset=>36844276540830363
,p_default_owner=>'WKSP_FRONGPMSTDEV'
);
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'GenerateInvoiceForm'
,p_alias=>'GENERATEINVOICEFORM'
,p_page_mode=>'MODAL'
,p_step_title=>'Submit Invoice'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(300912949961551496)
,p_plug_name=>'Submit Invoice'
,p_region_name=>'GenerateInvoice'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(308408320642310814)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(301163931307833780)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_button_name=>'InvoiceSubmit'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(308468966713310861)
,p_button_image_alt=>'Submit'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-9'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30661706975267109)
,p_name=>'INV_BILL_FROM_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_prompt=>'Bill From Date'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35714333201251738)
,p_name=>'P3_WRITE_UP_DOWN_VALUE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_item_default=>'0'
,p_prompt=>'Write Up/Down Value'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41118581997014731)
,p_name=>'P3_PRJDET_AGREEMENT_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301148245737470756)
,p_name=>'INV_JUSTIFICATION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_prompt=>'Adjustment Justification'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cHeight=>5
,p_colspan=>10
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(308468185507310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301148298382470757)
,p_name=>'INV_RETAINER_BALANCE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_prompt=>'Retainer Balance'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301148375112470758)
,p_name=>'INV_RETAINER_CHK'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_item_default=>'N'
,p_prompt=>'Apply Retainer Balance'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301162824474833769)
,p_name=>'ADJUSTMENT_AMOUNT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301162886325833770)
,p_name=>'INV_CONTRACT_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_prompt=>'Agreement'
,p_source=>'P3_PRJDET_AGREEMENT_NUMBER`'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct contract_number, contract_number contract_number_desc ',
'from xxgpms_project_contract',
'where contract_number = nvl(:P3_PRJDET_AGREEMENT_NUMBER,contract_number)',
'and   project_number = nvl(:INV_PROJECT_NUMBER,project_number)',
'-- and session_id = v(''APP_SESSION'')'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(308468185507310861)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301164179475833783)
,p_name=>'INV_PROJECT_NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_prompt=>'&P0_PROJECT_LABEL.'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct project_number d, project_number r ',
'from   xxgpms_project_costs',
'WHERE SESSION_ID = V(''APP_SESSION'')',
'order by 1',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- ALL --'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301164267211833784)
,p_name=>'INV_BILL_THRU_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_prompt=>'Bill Thru Date'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(326545016051972862)
,p_name=>'JUSTIFICATION_COMMENT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(300912949961551496)
,p_use_cache_before_default=>'NO'
,p_source=>'** Invoice adjustments require additional approval(s). Please supply a justification below.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cHeight=>2
,p_tag_attributes=>'style="font-weight:boldl;color:red;font-size:12px;"'
,p_display_when_type=>'NEVER'
,p_read_only_when_type=>'ALWAYS'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(301164049677833781)
,p_name=>'InvoiceSubmitClick'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(301163931307833780)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16678864471673432)
,p_event_id=>wwv_flow_imp.id(301164049677833781)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setTimer();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301164119366833782)
,p_event_id=>wwv_flow_imp.id(301164049677833781)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'-- XX_GPMS.GENERATE_EVENTS(:INV_PROJECT_NUMBER,:INV_CONTRACT_NUMBER, :P_BILL_THRU_DATE);',
'',
'',
'XX_GPMS.GENERATE_DRAFT_INVOICE(:INV_PROJECT_NUMBER',
'                               ,:INV_BILL_THRU_DATE',
'                               ,:INV_CONTRACT_NUMBER',
'                               ,null--:INV_JUSTIFICATION',
'                               ,null',
'                               ,:INV_BILL_FROM_DATE);',
'end;',
''))
,p_attribute_02=>'INV_CONTRACT_NUMBER,INV_PROJECT_NUMBER,INV_BILL_THRU_DATE,INV_JUSTIFICATION,INV_BILL_FROM_DATE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301164595817833787)
,p_event_id=>wwv_flow_imp.id(301164049677833781)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'endTimer();',
'apex.navigation.dialog.close(true);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41118153598014727)
,p_event_id=>wwv_flow_imp.id(301164049677833781)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'INVOICE_SUBMIT'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35714532542251740)
,p_name=>'Fetch the Write Up Down Value'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'INV_PROJECT_NUMBER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35714659440251741)
,p_event_id=>wwv_flow_imp.id(35714532542251740)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_WRITE_UP_DOWN_VALUE'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- select sum(write_up_down_value)',
'-- from (',
'--     select distinct project_number,',
'--       nvl(write_up_down_value, 0) write_up_down_value,',
'--       contract_number',
'--     from xxgpms_project_costs',
'--   )',
'-- where (',
'--     (project_number = NVL(:INV_PROJECT_NUMBER, project_number))',
'--     OR (',
'--       contract_number = nvl(:P3_PRJDET_AGREEMENT_NUMBER, contract_number)',
'--     )',
'--   );',
'',
'  select to_char(nvl(round(abs(sum(bill_trns_amount)),2),0),''999G999G999G999G990D00'')',
'  from   xxgpms_project_events ',
'  where project_number = NVL(:INV_PROJECT_NUMBER, project_number)',
'  and   contract_number = nvl(:P3_PRJDET_AGREEMENT_NUMBER, contract_number)',
'  and   event_type_name = ''WIP Adjustment''',
'  and   nvl(fusion_flag,''N'') = ''N''',
'  and   session_id = V(''APP_SESSION'');'))
,p_attribute_07=>'INV_PROJECT_NUMBER'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41115004473014695)
,p_event_id=>wwv_flow_imp.id(35714532542251740)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// if (apex.item(''P3_WRITE_UP_DOWN_VALUE'').getValue()<=1000){',
'//     apex.item(''JUSTIFICATION_COMMENT'').hide();',
'//     apex.item(''INV_JUSTIFICATION'').hide();',
'// }',
'// else{',
'//     apex.item(''JUSTIFICATION_COMMENT'').show();',
'//     apex.item(''INV_JUSTIFICATION'').show();',
'// }'))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35714815840251742)
,p_name=>'Hide or Show Justification'
,p_event_sequence=>40
,p_condition_element=>'P3_WRITE_UP_DOWN_VALUE'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'1000'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35714921752251743)
,p_event_id=>wwv_flow_imp.id(35714815840251742)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Show Justification'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'JUSTIFICATION_COMMENT,INV_JUSTIFICATION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35714974286251744)
,p_event_id=>wwv_flow_imp.id(35714815840251742)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Hide Justification'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'JUSTIFICATION_COMMENT,INV_JUSTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30661955470267111)
,p_name=>'New'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30662048070267112)
,p_event_id=>wwv_flow_imp.id(30661955470267111)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(apex.item(''P_BILL_FROM_DATE'').getValue());'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(29656666141000223)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set the Agreement Number and Project Number as needed'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cnt number;',
'begin',
'  if :INV_PROJECT_NUMBER is null and :P3_PRJDET_AGREEMENT_NUMBER is not null ',
'  then',
'    select count(distinct PROJECT_NUMBER) ',
'    into   v_cnt',
'    from   xxgpms_project_contract',
'    where  contract_number = :P3_PRJDET_AGREEMENT_NUMBER;',
'',
'    if v_cnt =1  ',
'    then',
'      select distinct PROJECT_NUMBER',
'      into   :INV_PROJECT_NUMBER',
'      from   xxgpms_project_contract',
'      where  contract_number = :P3_PRJDET_AGREEMENT_NUMBER;',
'    end if;',
'  elsif :P3_PRJDET_AGREEMENT_NUMBER is null and :INV_PROJECT_NUMBER is not null ',
'  then',
'    select count(distinct contract_number) ',
'    into   v_cnt',
'    from   xxgpms_project_contract',
'    where  PROJECT_NUMBER = :INV_PROJECT_NUMBER;',
'',
'    if v_cnt =1  ',
'    then',
'      select distinct contract_number',
'      into   :P3_PRJDET_AGREEMENT_NUMBER',
'      from   xxgpms_project_contract',
'      where  PROJECT_NUMBER = :INV_PROJECT_NUMBER;',
'    end if;',
'  end if;',
'end;  ',
'',
':INV_BILL_FROM_DATE := :P_BILL_FROM_DATE;',
':INV_BILL_THRU_DATE := :P_BILL_THRU_DATE;',
'',
'XX_GPMS.GENERATE_EVENTS(:INV_PROJECT_NUMBER,:INV_CONTRACT_NUMBER, :P_BILL_THRU_DATE);',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>15671803017406526
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(18895835819130157)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Percentage_for_the_progress'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select percentage,message',
'into   :P0_PROGRESS_BAR2, :P0_PROGRESS_MESSAGE',
'from   progress_bar_entries',
'where  module = ''GENERATE_INVOICE''',
'and    seq = :P0_PROGRESS_SEQ',
'order  by seq;',
'exception',
' when others then',
'   :P0_PROGRESS_BAR2 := 99;',
'   :P0_PROGRESS_MESSAGE := ''Processing..'';',
'end;',
'',
'apex_json.open_object;',
'apex_json.write(''percent'', :P0_PROGRESS_BAR2);',
'apex_json.write(''message'', :P0_PROGRESS_MESSAGE);',
'apex_json.close_object;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>18895835819130157
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- SELECT PERCENTAGE, MESSAGE',
'-- INTO  :P2_PROGRESS_BAR2,:P2_PROGRESS_MESSAGE',
'-- FROM (',
'-- SELECT * ',
'-- FROM  PROGRESS_ENTRIES',
'-- ORDER BY CREATED_DATE DESC)',
'-- WHERE ROWNUM = 1;',
''))
);
wwv_flow_imp.component_end;
end;
/
