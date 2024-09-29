prompt --application/create_application
begin
--   Manifest
--     FLOW: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>7335182145699007
,p_default_application_id=>150
,p_default_id_offset=>36844276540830363
,p_default_owner=>'WKSP_FRONGPMSTDEV'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'WKSP_FRONGPMSTDEV')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Maples WIP Form')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'PREBILLINGADJUSTMENTS')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'A2634B07F2055876BE294A7089E4FF80C742CEE09643E1655F4B2D1B45C278D2'
,p_bookmark_checksum_function=>'SH512'
,p_accept_old_checksums=>false
,p_compatibility_mode=>'21.2'
,p_accessible_read_only=>'N'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2020.06.24.'
,p_authentication_id=>wwv_flow_imp.id(309047159332781536)
,p_application_tab_set=>1
,p_app_builder_icon_name=>'app-icon.svg'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_referrer_policy=>'strict-origin-when-cross-origin'
,p_pass_ecid=>'N'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Pre-Billing Adjustments'
,p_substitution_string_02=>'CLIENT'
,p_substitution_value_02=>'MAPLES'
,p_substitution_string_03=>'ENV'
,p_substitution_value_03=>'DEV1'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>194
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
);
wwv_flow_imp.component_end;
end;
/
