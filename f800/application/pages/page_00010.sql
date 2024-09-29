prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'Access Denied'
,p_alias=>'AD'
,p_step_title=>'Access Denied'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-PageBody--login',
'{',
'    background-color: white;',
'}'))
,p_step_template=>wwv_flow_imp.id(308360991908310788)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41116159072014707)
,p_plug_name=>'GPMS WIP Form'
,p_region_template_options=>'#DEFAULT#:t-Login-region--headerTitle js-removeLandmark'
,p_plug_template=>wwv_flow_imp.id(308407001201310814)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41116321863014708)
,p_plug_name=>'Access Denied'
,p_parent_plug_id=>wwv_flow_imp.id(41116159072014707)
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--danger'
,p_plug_template=>wwv_flow_imp.id(308377170963310796)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'You do not have access to this application!'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41116619286014711)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_imp.id(41116159072014707)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(308381858607310799)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41116449339014710)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(41116619286014711)
,p_button_name=>'TRY_AGAIN'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--pill:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(308469095164310861)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Try Again'
,p_button_position=>'CHANGE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9::'
,p_button_css_classes=>'u-textCenter	'
,p_icon_css_classes=>'fa-repeat'
);
wwv_flow_imp.component_end;
end;
/
