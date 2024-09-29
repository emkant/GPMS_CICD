prompt --application/pages/page_00009
begin
--   Manifest
--     PAGE: 00009
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
 p_id=>9
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'WIP Form'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27130979027421007)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131067553421008)
,p_name=>'P9_JWT_BASE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(27130979027421007)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131235431421009)
,p_name=>'P9_FUSION_USER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(27130979027421007)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131989607421017)
,p_name=>'P9_AGREEMENT_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(27130979027421007)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27132102677421018)
,p_name=>'P9_PROJECT_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(27130979027421007)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27132226060421019)
,p_name=>'P9_SOURCE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(27130979027421007)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27132275682421020)
,p_name=>'P9_URL'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(29148827203792954)
,p_name=>'Get the Access Token'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29149180162792962)
,p_event_id=>wwv_flow_imp.id(29148827203792954)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const queryString = window.location.search;',
'const urlParams = new URLSearchParams(queryString);',
'const page_type = urlParams.get(''P2_AGREEMENT_NUMBER'');',
'apex.item(''P9_AGREEMENT_NUMBER'').setValue(page_type);',
'const page_type1 = urlParams.get(''P2_SOURCE'');',
'apex.item(''P9_SOURCE'').setValue(page_type1);',
'const page_type2 = urlParams.get(''P2_PROJECT_NUMBER'');',
'apex.item(''P9_PROJECT_NUMBER'').setValue(page_type2);',
'',
'',
'if((!''&G_SAAS_ACCESS_TOKEN!JS.''))',
'{',
'   getAccessToken(''&G_SAAS_ACCESS_URL!JS.''); // Escape JS special characters',
'}',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27132501238421022)
,p_event_id=>wwv_flow_imp.id(29148827203792954)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :G_SAAS_ACCESS_TOKEN IS NOT NULL ',
'     AND :G_SAAS_USER IS NOT NULL ',
'     THEN',
'      APEX_CUSTOM_AUTH.DEFINE_USER_SESSION(p_user => :G_SAAS_USER',
'                                           ,p_session_id => :APP_SESSION);',
'',
'      apex_util.redirect_url (''https://g15d023dedae272-fronteragpmsdev.adb.us-ashburn-1.oraclecloudapps.com/''||',
'      apex_page.get_url(p_page=>2,p_clear_cache => 2',
'        --  ,p_items=>''P2_AGREEMENT_NUMBER,P_SOURCE,P2_PROJECT_NUMBER'',',
'            -- p_values=> ''''''''||:P9_AGREEMENT_NUMBER||'',''||:P9_SOURCE||'',''||:P9_PROJECT_NUMBER||'''''''')',
'));',
'end if;'))
,p_attribute_02=>'G_SAAS_USER,G_SAAS_ACCESS_TOKEN'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(27130892504421006)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch the JWT Token'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_query_string varchar2(8500);',
'  l_jwt_start_pos NUMBER;',
'  l_jwt_arr APEX_APPLICATION_GLOBAL.VC_ARR2;',
'  l_prn_json varchar2(10000);',
'  l_web_url varchar2(200) := ''/fscmUI/HedTokenGenerationServlet?response_type=code'';',
'',
'begin',
'XX_GPMS.WIP_DEBUG(2,9, ''In Page 9 Fetch JWT'',null); ',
'XX_JWT_USERNAME();',
'l_query_string  := owa_util.get_cgi_env(''QUERY_STRING'');',
'XX_JWT_USERNAME1(l_query_string);',
'l_jwt_start_pos := INSTR(l_query_string,''jwt='');',
'XX_JWT_USERNAME1(l_jwt_start_pos);',
'XX_GPMS.WIP_DEBUG(2,9.1, l_jwt_start_pos,null); ',
'',
'  if l_jwt_start_pos <> 0 then ',
'    :P9_JWT_BASE := SUBSTR(l_query_string, l_jwt_start_pos+4, 10000);',
'',
'    l_jwt_arr       := APEX_UTIL.STRING_TO_TABLE(:P10_JWT_BASE, ''.'');',
'    :G_SAAS_ACCESS_TOKEN := l_jwt_arr(2);',
'',
'       l_prn_json := UTL_ENCODE.TEXT_DECODE(l_jwt_arr(2), ''UTF8'', UTL_ENCODE.BASE64);',
'',
'       APEX_JSON.PARSE (l_prn_json);',
'      :P9_FUSION_USER := APEX_JSON.get_varchar2 (p_path => ''prn'');',
'      :G_SAAS_USER := :P9_FUSION_USER;',
'      :G_JWT_BASE := :P9_JWT_BASE;',
'',
'  else',
'      XX_GPMS.WIP_DEBUG(2,9.2, :G_SAAS_ACCESS_TOKEN,null); ',
'    --   :G_SAAS_ACCESS_URL := ''https://fa-eqkm-dev7-saasfademo1.ds-fa.oraclepdemos.com'';',
'      :G_SAAS_ACCESS_URL := ''https://fa-ewqs-dev1-saasfaprod1.fa.ocs.oraclecloud.com'';',
'      :P9_JWT_BASE := ''OTBI''; ',
'      :G_JWT_BASE := ''OTBI'';    ',
'    end if;',
'  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>13146029380827309
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(29149762852794345)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_ACCESS_TOKEN'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object;',
'begin',
'  :G_SAAS_ACCESS_TOKEN   := apex_application.g_x01;',
'  :G_SAAS_USER           := apex_application.g_x02;',
'  :G_SAAS_PREFERRED_NAME := apex_application.g_x03;',
'  :G_TIMESTAMP           := apex_application.g_x04;',
'  :G_TOKEN_DURATION      := apex_application.g_x05;',
'--   APEX_CUSTOM_AUTH.SET_USER(:P2_SAAS_USER);',
'  apex_json.write(''ok'',true);',
'exception',
'  when others then apex_json.write(''sqlerrm'',sqlerrm);',
'end;',
'apex_json.close_all;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>15164899729200648
);
wwv_flow_imp.component_end;
end;
/
