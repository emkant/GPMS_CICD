prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 800
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>7335182145699007
,p_default_application_id=>150
,p_default_id_offset=>36844276540830363
,p_default_owner=>'WKSP_FRONGPMSTDEV'
);
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(36844276540829563)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:2:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:2:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_imp.id(308463389896310858)
,p_nav_list_template_options=>'#DEFAULT#:js-tabLike'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#app-icon.css?version=#APP_VERSION#',
'#APP_FILES#PreBillingAdjustments#MIN#.css',
'https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css'))
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#typo#MIN#.js',
'#APP_FILES#PreBillingAdjustments#MIN#.js',
'https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js'))
,p_nav_bar_type=>'NAVBAR'
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_imp.component_end;
end;
/
