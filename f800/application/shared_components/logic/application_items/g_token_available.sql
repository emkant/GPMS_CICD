prompt --application/shared_components/logic/application_items/g_token_available
begin
--   Manifest
--     APPLICATION ITEM: G_TOKEN_AVAILABLE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>7335182145699007
,p_default_application_id=>150
,p_default_id_offset=>36844276540830363
,p_default_owner=>'WKSP_FRONGPMSTDEV'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(43923459007206608)
,p_name=>'G_TOKEN_AVAILABLE'
,p_protection_level=>'I'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
