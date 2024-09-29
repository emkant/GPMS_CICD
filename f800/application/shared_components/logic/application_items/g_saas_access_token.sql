prompt --application/shared_components/logic/application_items/g_saas_access_token
begin
--   Manifest
--     APPLICATION ITEM: G_SAAS_ACCESS_TOKEN
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
 p_id=>wwv_flow_imp.id(42506097889202637)
,p_name=>'G_SAAS_ACCESS_TOKEN'
,p_protection_level=>'I'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
