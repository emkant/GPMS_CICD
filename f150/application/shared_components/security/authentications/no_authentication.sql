prompt --application/shared_components/security/authentications/no_authentication
begin
--   Manifest
--     AUTHENTICATION: No Authentication
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>7335182145699007
,p_default_application_id=>150
,p_default_id_offset=>13984863123593697
,p_default_owner=>'WKSP_FRONGPMSTDEV'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(295062296209187839)
,p_name=>'No Authentication'
,p_scheme_type=>'NATIVE_DAD'
,p_attribute_01=>'nobody'
,p_pre_auth_process=>'XX_GPMS.WIP_DEBUG(5555,2,''URL'',null)'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
