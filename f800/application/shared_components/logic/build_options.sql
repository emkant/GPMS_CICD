prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>7335182145699007
,p_default_application_id=>150
,p_default_id_offset=>36844276540830363
,p_default_owner=>'WKSP_FRONGPMSTDEV'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(292031870805406302)
,p_build_option_name=>'DEV_ONLY'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>1
,p_default_on_export=>'EXCLUDE'
);
wwv_flow_imp.component_end;
end;
/
