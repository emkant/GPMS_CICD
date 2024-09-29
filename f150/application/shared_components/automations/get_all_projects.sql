prompt --application/shared_components/automations/get_all_projects
begin
--   Manifest
--     AUTOMATION: GET_ALL_PROJECTS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>7335182145699007
,p_default_application_id=>150
,p_default_id_offset=>13984863123593697
,p_default_owner=>'WKSP_FRONGPMSTDEV'
);
wwv_flow_imp_shared.create_automation(
 p_id=>wwv_flow_imp.id(3727608018481455)
,p_name=>'GET_ALL_PROJECTS'
,p_static_id=>'get-all-projects'
,p_trigger_type=>'API'
,p_polling_status=>'DISABLED'
,p_result_type=>'ALWAYS'
,p_use_local_sync_table=>false
,p_include_rowid_column=>false
,p_commit_each_row=>false
,p_error_handling_type=>'IGNORE'
);
wwv_flow_imp_shared.create_automation_action(
 p_id=>wwv_flow_imp.id(3727870974481468)
,p_automation_id=>wwv_flow_imp.id(3727608018481455)
,p_name=>'New Action'
,p_execution_sequence=>10
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    XX_GPMS.GET_ALL_MATTERS;',
'end;'))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp.component_end;
end;
/
