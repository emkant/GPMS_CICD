prompt --application/shared_components/logic/application_computations/g_saas_access_url
begin
--   Manifest
--     APPLICATION COMPUTATION: G_SAAS_ACCESS_URL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>7335182145699007
,p_default_application_id=>150
,p_default_id_offset=>13984863123593697
,p_default_owner=>'WKSP_FRONGPMSTDEV'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(28521002252599321)
,p_computation_sequence=>10
,p_computation_item=>'G_SAAS_ACCESS_URL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select base_url from prt_environments',
'where organization_id in (',
'select organization_id from prt_organizations',
'where upper(organization_name) = :CLIENT)',
'and   upper(environment_name) = :ENV'))
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
