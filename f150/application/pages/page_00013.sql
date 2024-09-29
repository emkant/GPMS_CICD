prompt --application/pages/page_00013
begin
--   Manifest
--     PAGE: 00013
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
 p_id=>13
,p_name=>'Edit Bill Lines'
,p_alias=>'EDIT-BILL-LINES'
,p_page_mode=>'MODAL'
,p_step_title=>'Edit Bill Lines'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV-table td, .a-GV-table th {',
'    white-space: unset !important;',
'}',
'',
'.overLimit{',
'    color: red;',
'    background-color: white;',
'    border: 1px solid red;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'1000'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6500160791171613)
,p_plug_name=>'Hourly Fees'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--noIcon:t-Alert--info:t-Alert--removeHeading js-removeLandmark'
,p_plug_template=>wwv_flow_imp.id(294392307839717099)
,p_plug_display_sequence=>110
,p_location=>null
,p_plug_source=>'<div>Total Hourly Fees:   <b>&P13_HOURLY_FEES.</b></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6501332034171624)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>130
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2694548078079741)
,p_plug_name=>'Edit Bill Lines Grid'
,p_region_name=>'ig'
,p_parent_plug_id=>wwv_flow_imp.id(6501332034171624)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>130
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SNO,',
'       DESCRIPTION,',
'       FEES,',
'       PROJECT_NUMBER,',
'       PROJECT_ID,',
'       AGREEMENT_NUMBER,',
'       SESSION_ID',
'  from XXGPMS_BILL_LINES',
' where session_id = v(''APP_SESSION'')',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P13_PROJECT_NUMBER,P13_AGREEMENT_NUMBER,P13_PROJECT_ID,P13_ROLLING_TOTAL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Edit Bill Lines Grid'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6499254134171604)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6499343580171605)
,p_name=>'FEES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FEES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Fees'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6499530448171606)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6499815846171609)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6499843504171610)
,p_name=>'PROJECT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P13_PROJECT_NUMBER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6500003639171611)
,p_name=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P13_PROJECT_ID'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6500105060171612)
,p_name=>'AGREEMENT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AGREEMENT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P13_AGREEMENT_NUMBER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6500795453171619)
,p_name=>'SESSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SESSION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'v(''APP_SESSION'')'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(2695035384079745)
,p_internal_uid=>16679898507673442
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_no_data_found_message=>'&nbsp;'
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'',
'     config.defaultGridViewOptions = { ',
'     footer: false ',
'     }; ',
'',
'    config.initActions = function (actions) {',
'        var $ig = $(actions.context),',
'            saveAction = actions.lookup("save"),',
'            originalSaveAction = saveAction.action;',
'',
'        saveAction.action = function (event, el) {',
'            var view = $ig.interactiveGrid("getCurrentView"),',
'                model = view.model,',
'                workHoursKey = model.getFieldKey("FEES"),',
'                workHours, meta, workHoursTotal = 0;',
'',
'            model.forEach(function (record, index, id) {',
'                workHours = parseFloat(record[workHoursKey]);',
'                meta = model.getRecordMetadata(id);',
'',
'                if (!isNaN(workHours) && !meta.deleted && !meta.agg) {',
'                    workHoursTotal += workHours;',
'                }',
'',
'            });',
'',
'            if (workHoursTotal <= apex.item(''P13_HOURLY_FEES'').getValue()) { // Change it to your hours count',
'                originalSaveAction();',
'                apex.page.submit({',
'                    showWait: false',
'                });',
'            }',
'            else {',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: "page",',
'                    message: "The current Overall Sum ("+workHoursTotal+") is greater than "+apex.item(''P13_HOURLY_FEES'').getValue()+"!",',
'                    unsafe: true',
'                }]);',
'',
'            }',
'',
'            return true;',
'        }',
'    }',
'',
'    return config;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(6485354233128256)
,p_interactive_grid_id=>wwv_flow_imp.id(2695035384079745)
,p_static_id=>'204703'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6485574995128257)
,p_report_id=>wwv_flow_imp.id(6485354233128256)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6505309756171784)
,p_view_id=>wwv_flow_imp.id(6485574995128257)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6499254134171604)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>680
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6506230964171788)
,p_view_id=>wwv_flow_imp.id(6485574995128257)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6499343580171605)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>160
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6509229945372825)
,p_view_id=>wwv_flow_imp.id(6485574995128257)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6499530448171606)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>50
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6513566007496014)
,p_view_id=>wwv_flow_imp.id(6485574995128257)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6499815846171609)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6514495766496017)
,p_view_id=>wwv_flow_imp.id(6485574995128257)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6499843504171610)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6515346425496020)
,p_view_id=>wwv_flow_imp.id(6485574995128257)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6500003639171611)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6516326722496023)
,p_view_id=>wwv_flow_imp.id(6485574995128257)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6500105060171612)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6879861629314094)
,p_view_id=>wwv_flow_imp.id(6485574995128257)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6500795453171619)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6503068175171642)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(294396186724717101)
,p_plug_display_sequence=>140
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6503670694171648)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(294396186724717101)
,p_plug_display_sequence=>120
,p_plug_new_grid_row=>false
,p_plug_display_column=>11
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6503605567171647)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6503670694171648)
,p_button_name=>'USE_TASKS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Use Tasks'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6501157391171623)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6501332034171624)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2694724073079742)
,p_name=>'P13_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2694548078079741)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2694748097079743)
,p_name=>'P13_PROJECT_NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2694548078079741)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2694896418079744)
,p_name=>'P13_AGREEMENT_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2694548078079741)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6500272473171614)
,p_name=>'P13_HOURLY_FEES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2694548078079741)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(x."Hourly_Fees") s',
'from (',
'select ',
'sum(DECODE(lower(xpc.WIP_CATEGORY),''labor'', project_bill_rate_amt,0)) "Hourly_Fees"',
'from xxgpms_project_costs xpc',
'where 1=1',
'and xpc.PROJECT_NUMBER = COALESCE(:P13_PROJECT_NUMBER,xpc.project_number)',
'and xpc.contract_number = nvl(:P13_AGREEMENT_NUMBER,xpc.contract_number)',
'and xpc.SESSION_ID = V(''SESSION'')',
'union',
'select ',
'sum(DECODE(lower(WIP_CATEGORY),''labor'', project_bill_rate_amt,0)) "Hourly_Fees"',
'from xxgpms_project_costs',
'where 1= 1',
'and PROJECT_NUMBER = COALESCE(:P13_PROJECT_NUMBER,project_number)',
'and contract_number = nvl(:P13_AGREEMENT_NUMBER,contract_number)',
'and SESSION_ID = V(''SESSION'')',
'and project_bill_rate_amt-realized_bill_rate_amt >0',
'union',
'select ',
'sum(DECODE(lower(xpc.WIP_CATEGORY),''labor'', project_bill_rate_amt,0)) "Hourly_Fees"',
'from xxgpms_project_costs xpc',
'where 1= 1',
'and xpc.PROJECT_NUMBER = COALESCE(:P13_PROJECT_NUMBER,xpc.project_number)',
'and xpc.contract_number = nvl(:P13_AGREEMENT_NUMBER,xpc.contract_number)',
'and SESSION_ID = V(''SESSION'')',
') x;',
'',
''))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6501758945171629)
,p_name=>'P13_CURRENCY_CODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2694548078079741)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct CURRENCY_CODE',
'from   xxgpms_project_contract',
'where  CONTRACT_NUMBER = nvl(:P13_AGREEMENT_NUMBER,CONTRACT_NUMBER)',
'and    session_id = v(''SESSION'');'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6502106952171632)
,p_name=>'P13_ROLLING_TOTAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6503068175171642)
,p_prompt=>'Total'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_field_template=>wwv_flow_imp.id(294482824232717164)
,p_item_css_classes=>'u-pullRight'
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-left-lg:margin-right-none'
,p_attribute_03=>'right'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6501341564171625)
,p_name=>'On Click of SAVE'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6501157391171623)
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6501465757171626)
,p_event_id=>wwv_flow_imp.id(6501341564171625)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var model = apex.region(''ig'').widget().interactiveGrid("getViews", "grid").model;',
'var total;',
'var original_total = apex.item(''P13_HOURLY_FEES'').getValue();',
'model.forEach(function (i) {',
'    total = i[model.getFieldKey("FEES")];',
'});',
'',
'if (Number(total) > Number(original_total)) {',
'    // First clear the errors',
'    apex.message.clearErrors();',
'',
'    // Now show new errors',
'    apex.message.showErrors([',
'        {',
'            type: "error",',
'            location: ["page"],',
'            message: "The Overall Sum Cannot be Greater than the Actual Total Hourly Fees!",',
'            unsafe: false',
'        }',
'    ]);',
'}',
'else{',
' apex.region( "ig" ).widget().interactiveGrid( "getActions" ).invoke( "save" );',
' apex.page.submit();',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6501855990171630)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(2694548078079741)
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6501949149171631)
,p_event_id=>wwv_flow_imp.id(6501855990171630)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2694548078079741)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i_selector = $(''#ig_ig tr td[headers="FEES"]'');',
'var i_currency = apex.item("P13_CURRENCY_CODE").getValue();',
'',
'// for (i=0;i<i_selector.length;i++)',
'// {',
'//     i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'// }',
'',
'var model = apex.region("ig").widget().interactiveGrid("getCurrentView").model;',
'var sum = 0;',
'model.forEach(function(i){',
'    console.log(i[model.getFieldKey("FEES")]);',
'    i[model.getFieldKey("FEES")] = currencyFormatter(Number(i[model.getFieldKey("FEES")]),i_currency)',
'})',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6502166081171633)
,p_name=>'Rolling Total'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(2694548078079741)
,p_triggering_element=>'FEES'
,p_bind_type=>'bind'
,p_execution_type=>'DEBOUNCE'
,p_execution_time=>5
,p_execution_immediate=>false
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6502245916171634)
,p_event_id=>wwv_flow_imp.id(6502166081171633)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var model = apex.region("ig").widget().interactiveGrid("getCurrentView").model;',
'var sum = 0;',
'var fees;',
'model.forEach(function(i){',
'    fees = i[model.getFieldKey("FEES")];',
'    fees = fees.replace(/\,/g,'''');',
'    console.log(fees);',
'    sum += Number(fees);',
'})',
'apex.item(''P13_ROLLING_TOTAL'').setValue(sum);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6503240164171644)
,p_event_id=>wwv_flow_imp.id(6502166081171633)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_ROLLING_TOTAL'
,p_attribute_01=>'overLimit'
,p_client_condition_type=>'GREATER_THAN'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P13_ROLLING_TOTAL'
,p_client_condition_expression=>'&P13_HOURLY_FEES.'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6503478078171646)
,p_event_id=>wwv_flow_imp.id(6502166081171633)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_ROLLING_TOTAL'
,p_attribute_01=>'overLimit'
,p_client_condition_type=>'LESS_THAN_OR_EQUAL'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P13_ROLLING_TOTAL'
,p_client_condition_expression=>'&P13_HOURLY_FEES.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6503791347171649)
,p_name=>'Get the Tasks and Fees'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6503605567171647)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6503895325171650)
,p_event_id=>wwv_flow_imp.id(6503791347171649)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from  xxgpms_bill_lines ',
'where agreement_number = :P13_AGREEMENT_NUMBER',
'and SESSION_ID = V(''SESSION'');',
'',
'insert into xxgpms_bill_lines (DESCRIPTION,FEES,AGREEMENT_NUMBER,SESSION_ID)',
'select task_number||'' - ''||task_name , sum(project_bill_rate_amt),contract_number,V(''SESSION'')',
'from xxgpms_project_costs xpc',
'where 1=1',
'and xpc.PROJECT_NUMBER = COALESCE(:P13_PROJECT_NUMBER,xpc.project_number)',
'and xpc.contract_number = nvl(:P13_AGREEMENT_NUMBER,xpc.contract_number)',
'and xpc.SESSION_ID = V(''SESSION'')',
'and wip_category = ''Labor''',
'group by task_number,task_name,contract_number',
'order by 1;',
''))
,p_attribute_02=>'P13_AGREEMENT_NUMBER,P13_PROJECT_NUMBER'
,p_attribute_03=>'P13_ROLLING_TOTAL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4227683133455689)
,p_event_id=>wwv_flow_imp.id(6503791347171649)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_ROLLING_TOTAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(fees)',
'from    xxgpms_bill_lines ',
'where   agreement_number = :P13_AGREEMENT_NUMBER',
'and     session_id = V(''SESSION'');'))
,p_attribute_07=>'P13_AGREEMENT_NUMBER'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6503955385171651)
,p_event_id=>wwv_flow_imp.id(6503791347171649)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2694548078079741)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4227804275455690)
,p_event_id=>wwv_flow_imp.id(6503791347171649)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_ROLLING_TOTAL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6499655286171608)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(2694548078079741)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Edit Bill Lines Grid - Save Interactive Grid Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin  ',
'     case :APEX$ROW_STATUS  ',
'     when ''C'' then ',
'         insert into xxgpms_bill_lines ( description,fees,project_id,project_number,agreement_number,SESSION_ID)  ',
'         values ( :DESCRIPTION, :FEES, :P13_PROJECT_ID,:P13_PROJECT_NUMBER,:P13_AGREEMENT_NUMBER,V(''APP_SESSION'') )  ;',
'     when ''U'' then  ',
'         update xxgpms_bill_lines  ',
'            set description  = :DESCRIPTION,  ',
'                FEES = :FEES  ',
'         WHERE SESSION_ID = V(''APP_SESSION'')',
'         AND   SNO = :SNO;',
'     when ''D'' then  ',
'         delete xxgpms_bill_lines  ',
'         where SNO = :SNO;  ',
'     end case;  ',
'end;  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_only_for_changed_rows=>'N'
,p_internal_uid=>20484518409765305
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6500923387171620)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(2694548078079741)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'New'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>20485786510765317
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6500403291171615)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get the Hourly Fees'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(x."Hourly_Fees")',
'INTO  :P13_HOURLY_FEES',
'from (',
'select ',
'sum(DECODE(lower(xpc.WIP_CATEGORY),''labor'', project_bill_rate_amt,0)) "Hourly_Fees"',
'from xxgpms_project_costs xpc',
'where 1=1',
'and xpc.PROJECT_NUMBER = COALESCE(:P13_PROJECT_NUMBER,xpc.project_number)',
'and xpc.contract_number = nvl(:P13_AGREEMENT_NUMBER,xpc.contract_number)',
'and xpc.SESSION_ID = V(''SESSION'')',
'union',
'select ',
'sum(DECODE(lower(WIP_CATEGORY),''labor'', project_bill_rate_amt,0)) "Hourly_Fees"',
'from xxgpms_project_costs',
'where 1= 1',
'and PROJECT_NUMBER = COALESCE(:P13_PROJECT_NUMBER,project_number)',
'and contract_number = nvl(:P13_AGREEMENT_NUMBER,contract_number)',
'and SESSION_ID = V(''SESSION'')',
'and project_bill_rate_amt-realized_bill_rate_amt >0',
'union',
'select ',
'sum(DECODE(lower(xpc.WIP_CATEGORY),''labor'', project_bill_rate_amt,0)) "Hourly_Fees"',
'from xxgpms_project_costs xpc',
'where 1= 1',
'and xpc.PROJECT_NUMBER = COALESCE(:P13_PROJECT_NUMBER,xpc.project_number)',
'and xpc.contract_number = nvl(:P13_AGREEMENT_NUMBER,xpc.contract_number)',
'and SESSION_ID = V(''SESSION'')',
') x;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>20485266414765312
);
wwv_flow_imp.component_end;
end;
/
