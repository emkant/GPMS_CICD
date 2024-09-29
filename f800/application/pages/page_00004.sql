prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
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
 p_id=>4
,p_name=>'WIP Adjustments'
,p_alias=>'WIP-TAGGING'
,p_page_mode=>'MODAL'
,p_step_title=>'Bill Adjustments'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#currencyFormatter.js',
'#APP_FILES#PreBillingAdjustments#MIN#.js	'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.separator {',
'  display: flex;',
'  align-items: center;',
'  text-align: center;',
'  margin: 10px;',
'}',
'',
'.separator::before,',
'.separator::after {',
'  content: '''';',
'  flex: 1;',
'  border-bottom: 1px solid #000;',
'}',
'',
'.separator:not(:empty)::before {',
'  margin-right: .45em;',
'}',
'',
'.separator:not(:empty)::after {',
'  margin-left: .45em;',
'}'))
,p_step_template=>wwv_flow_imp.id(43509017152533052)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd:js-dialog-class-t-Drawer--xl'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(299009394346207273)
,p_plug_name=>'Bill Adjustments'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent2:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(308408320642310814)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30860925462108228)
,p_plug_name=>'Hours Adjustment'
,p_parent_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(308380830428310798)
,p_plug_display_sequence=>90
,p_location=>null
,p_plug_source=>'<div class="separator"><b>OR</b></div>'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':WIP_LINE_COUNT = 1 and :P4_HOURS_COUNT > 0'
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(308050374029615178)
,p_plug_name=>'Transfer and Split'
,p_region_name=>'ProjectSplit'
,p_parent_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(308408320642310814)
,p_plug_display_sequence=>81
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'XXGPMS_PROJECT_SPLIT'
,p_include_rowid_column=>true
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Project Split'
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
 p_id=>wwv_flow_imp.id(301148749700470761)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(308051083769615185)
,p_name=>'SESSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SESSION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_default_type=>'SQL_QUERY'
,p_default_expression=>'select V(''SESSION'') from dual'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(308051185934615186)
,p_name=>'PROJECT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'&P0_PROJECT_LABEL. Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(308051363815615187)
,p_name=>'TASK_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Task Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>25
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(308051458067615188)
,p_name=>'QUANTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
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
 p_id=>wwv_flow_imp.id(308051527487615189)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(308051647520615190)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(308051038441615184)
,p_internal_uid=>19314372302026029
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>true
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_FIELD'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(309064288942044892)
,p_interactive_grid_id=>wwv_flow_imp.id(308051038441615184)
,p_static_id=>'127193'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(309064422700044892)
,p_report_id=>wwv_flow_imp.id(309064288942044892)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(301455960347097517)
,p_view_id=>wwv_flow_imp.id(309064422700044892)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(301148749700470761)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(309064963740044899)
,p_view_id=>wwv_flow_imp.id(309064422700044892)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(308051083769615185)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(309065288100044905)
,p_view_id=>wwv_flow_imp.id(309064422700044892)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(308051185934615186)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(309065853237044907)
,p_view_id=>wwv_flow_imp.id(309064422700044892)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(308051363815615187)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(309066295187044909)
,p_view_id=>wwv_flow_imp.id(309064422700044892)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(308051458067615188)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(309066822082044911)
,p_view_id=>wwv_flow_imp.id(309064422700044892)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(308051527487615189)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(299010391173207283)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_button_name=>'WIP_Adjust'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(308468966713310861)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Adjustments'
,p_button_position=>'DELETE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30860789148108226)
,p_name=>'P4_HOURS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Hours'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_display_when=>':WIP_LINE_COUNT = 1 and :P4_HOURS_COUNT > 0'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30860888482108227)
,p_name=>'P4_HOURS_NON_BILLABLE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Non-Billable'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_display_when=>':WIP_LINE_COUNT = 1 and :P4_HOURS_COUNT > 0'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30861456281108233)
,p_name=>'P4_HOURS_COUNT'
,p_item_sequence=>20
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38968361949064404)
,p_name=>'P4_SUCCESS_MESSAGE'
,p_item_sequence=>30
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38968824873064409)
,p_name=>'P4_CANCEL'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Cancel'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:margin-top-lg'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38969563348064416)
,p_name=>'P4_EXPENDITURE_TYPE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Expenditure Type'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EXPENDITURE_TYPE_NAME d, EXPENDITURE_TYPE_NAME r',
'FROM XXGPMS_EXP_TYPES',
'WHERE SESSION_ID = V(''APP_SESSION'')',
'AND   UPPER(EXPENDITURE_TYPE_NAME) NOT IN (SELECT UPPER(EXPENDITURE_TYPE_NAME)',
'FROM XXGPMS_PROJECT_COSTS ',
'WHERE SESSION_ID = V(''APP_SESSION'')',
'AND   EXPENDITURE_ITEM_ID = TRIM(BOTH ''-'' FROM :WIP_EXPIDS)',
')',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- SELECT --'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>':WIP_LINE_COUNT = 1 and :P4_HOURS_COUNT > 0'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(299009544354207274)
,p_name=>'EVENT_ADJ_PCT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Discount'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'left'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(299009748894207276)
,p_name=>'WIP_SEL_AMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'WIP Amount'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>5
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(299010009242207279)
,p_name=>'WIP_EXPIDS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(299010282765207282)
,p_name=>'WIP_PROJECT_NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(299011801142207297)
,p_name=>'WIP_MODAL_FLAG'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(299012317695207302)
,p_name=>'EVENT_ADJ_AMT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Amount to Bill'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301148548923470759)
,p_name=>'WIP_ERROR_FLAG'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301849691615468857)
,p_name=>'WIP_TRX_SPLT'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_item_default=>'Transfer & Split'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(308467687356310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(308049131991615165)
,p_name=>'WIP_BILLABLE_FLAG'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Billable'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Yes'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(308049183985615166)
,p_name=>'WIP_HOLD'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Hold'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Once;O,Until Released;Y,Release Hold;N,Bill Only;BO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- SELECT --'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(308049335332615167)
,p_name=>'WIP_JUSTIFICATION_CODE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Justification'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Client Satisfaction;Client Satisfaction,Billing Error;Billing Error,B.I.S.S.;B.I.S.S.,We do not pay for summer associates;We do not pay for summer associates'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- SELECT --'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(308468185507310861)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(308049441911615168)
,p_name=>'WIP_JUSTIFICATION_TEXT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>150
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(308468185507310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(308049741704615171)
,p_name=>'WIP_LINE_COUNT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Total Lines'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(308049810461615172)
,p_name=>'WIP_HOURS_COUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_prompt=>'Total Quantity'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(308467865097310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333146066262127962)
,p_name=>'P4_CURRENCY'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(333146297523127964)
,p_name=>'WIP_SEL_AMOUNT_COPY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(299009394346207273)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(32485960664979956)
,p_validation_name=>'Justification is needed for Write Up/Down'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (to_number(:EVENT_ADJ_PCT, ''999G999G999G999G990D000'')  <>0 ',
'  or to_number(:EVENT_ADJ_AMT, ''999G999G999G999G990D000'') <> 0',
'  or to_number(:P4_HOURS, ''999G999G999G999G990D000'') <> 0)',
'then',
'  if coalesce(:WIP_JUSTIFICATION_CODE,:WIP_JUSTIFICATION_TEXT,''~!~'') = ''~!~''',
'  then',
'    return ''Justification is needed if Write Up/Down is performed!'';',
'  end if;',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_imp.id(299010391173207283)
,p_associated_item=>wwv_flow_imp.id(308049335332615167)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(299010761894207286)
,p_name=>'WIP_AdjustClick'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(299010391173207283)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301148664829470760)
,p_event_id=>wwv_flow_imp.id(299010761894207286)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Validations'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// var ig_len, ig_project_number, ig_project_exists, ig_project_len, ig_qty;',
'',
'// var ig$ = apex.region("ProjectSplit").widget();',
'',
'// var model = ig$.interactiveGrid("getViews", "grid").model;',
'',
'// var ig_errflag = ''N'';',
'',
'',
'',
'// ig_project_number = 0;',
'// ig_project_len = 0;',
'// ig_project_exists = 0;',
'// ig_qty = 0;',
'',
'// model.forEach(function(igrec) {',
'//    ig_project_number = igrec[model.getFieldKey("PROJECT_NUMBER")];',
'//    ig_qty += Number(igrec[model.getFieldKey("QUANTITY")]);',
'      ',
'//    ig_project_len = ig_project_number.length;',
'   ',
'//    if (ig_project_len > 0) {',
'//        ig_project_exists = 1;',
'    ',
'//    }',
'  ',
'//    //apex.message.alert(igrec[model.getFieldKey("PROJECT_NUMBER")]);',
'// });',
'',
'',
'',
'',
'',
'if ($v("EVENT_ADJ_AMT") != 0  && $v("EVENT_ADJ_PCT") != 0 ){',
'       ig_errflag = ''Y'';',
'       apex.message.alert( "Adjustment Amount and Adjustment Percentage cannot be specified at the same time" );',
'       apex.da.cancel(); ',
'}',
'',
'',
'// if ($v("EVENT_ADJ_AMT") != 0  && ig_project_exists == 1 ){',
'//        ig_errflag = ''Y'';',
'//        apex.message.alert( "Adjustment Amount and Transfers cannot be specified at the same time" );',
'//        apex.da.cancel(); ',
'// }',
'',
'// if ($v("EVENT_ADJ_PCT") != 0  && ig_project_exists == 1 ){',
'//        ig_errflag = ''Y'';',
'//        apex.message.alert( "Adjustment Percentage and Transfers cannot be specified at the same time" );',
'//        apex.da.cancel(); ',
'// }',
'',
'// if (ig_project_exists == 1 & $v("WIP_HOURS_COUNT") != ig_qty) {',
'//        ig_errflag = ''Y'';',
'//        apex.message.alert( "Mismatch between Expenditure Quantity and Transfer Quantity" );',
'//        apex.da.cancel(); ',
'// }',
'',
'apex.item( "WIP_ERROR_FLAG" ).setValue (''N'');',
'',
'// if (ig_errflag == ''N'') {',
'// apex.region( "ProjectSplit" ).widget().interactiveGrid("getActions"). invoke("save");',
'// }',
'',
'// Justification Validations by EK',
'',
'var amt_pct = apex.item(''EVENT_ADJ_PCT'').getValue();',
'var amt = apex.item(''EVENT_ADJ_AMT'').getValue();',
'var hours = apex.item(''P4_HOURS'').getValue();',
'var justification_code = apex.item(''WIP_JUSTIFICATION_CODE'').getValue();',
'var justification_txt = apex.item(''WIP_JUSTIFICATION_TEXT'').getValue();',
'',
'if (amt_pct >0 || amt > 0||hours > 0){',
'    if (!justification_code){',
'        if(!justification_txt){',
'            apex.message.clearErrors();',
'            // apex.message.alert( ''Justification is needed if Write Up/Down is performed!'');',
'            apex.message.showErrors([',
'            {',
'               type:       "error",',
'               location:   [ "page", "inline" ],',
'               pageItem:   "WIP_JUSTIFICATION_CODE",',
'               message:    "Justification is needed if Write Up/Down is performed!",',
'               unsafe:     false',
'            }]) ',
'             apex.da.cancel(); ',
'        }',
'    }',
'}',
'',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16678710463673431)
,p_event_id=>wwv_flow_imp.id(299010761894207286)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Progress Bar Start'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.clearErrors();',
'setTimer();',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(299010781767207287)
,p_event_id=>wwv_flow_imp.id(299010761894207286)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Code to call the Package'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  V_status number := 0;',
'  V_RESPONSE CLOB;',
'begin',
'xx_gpms.WIP_DEBUG (2, 50000, ''Cancel Flag ''||:P4_CANCEL, '''');',
'xx_gpms.WIP_DEBUG (2, 50001, ''Exp Type ''||:P4_EXPENDITURE_TYPE, '''');',
'xx_gpms.WIP_DEBUG (2, 50002,  ''Hours ''||:P4_HOURS, '''');',
'if (:WIP_ERROR_FLAG = ''N'') then',
'  IF :P4_CANCEL = ''Y'' and :P4_EXPENDITURE_TYPE is null',
'  THEN',
'    XX_GPMS.PERFORM_ADJUST_PROJECT_COSTS(P_EXPENDITURE_ITEM_ID => :WIP_EXPIDS,',
'                      P_ADJUSTMENT_TYPE_CODE => ''REVERSE'',',
'                      P_JUSTIFICATION => :WIP_JUSTIFICATION_CODE||CASE  WHEN :WIP_JUSTIFICATION_TEXT IS NOT NULL THEN '': ''||:WIP_JUSTIFICATION_TEXT END,',
'                      P_RESPONSE => V_RESPONSE,',
'                      P_RESPONSE_CODE => V_STATUS);',
'    IF V_STATUS IN (200,201)',
'    THEN',
'      :P4_SUCCESS_MESSAGE := V_RESPONSE;',
'     ELSE',
'        apex_error.add_error (',
'          p_message          => v_response,',
'          p_display_location => apex_error.c_inline_in_notification );',
'    END IF;  ',
'  ELSIF :P4_EXPENDITURE_TYPE IS NOT NULL AND NVL(:P4_CANCEL,''N'') = ''N''',
'  THEN',
'    XX_GPMS.PERFORM_ADJUST_PROJECT_COSTS(P_EXPENDITURE_ITEM_ID => :WIP_EXPIDS,',
'                      P_ADJUSTMENT_TYPE_CODE => ''TRANSFER'',',
'                      P_EXPENDITURE_TYPE => :P4_EXPENDITURE_TYPE,',
'                      P_JUSTIFICATION => :WIP_JUSTIFICATION_CODE||CASE  WHEN :WIP_JUSTIFICATION_TEXT IS NOT NULL THEN '': ''||:WIP_JUSTIFICATION_TEXT END,',
'                      P_RESPONSE => V_RESPONSE,',
'                      P_RESPONSE_CODE => V_STATUS);',
'    IF V_STATUS IN (200,201)',
'    THEN',
'      :P4_SUCCESS_MESSAGE := V_RESPONSE;',
'     ELSE',
'        apex_error.add_error (',
'          p_message          => v_response,',
'          p_display_location => apex_error.c_inline_in_notification );',
'    END IF;                     ',
'  ELSIF :P4_EXPENDITURE_TYPE IS NULL AND NVL(:P4_CANCEL,''N'') = ''N''',
'  THEN',
'    IF :P4_HOURS IS NULL',
'    THEN ',
'      V_status := XX_GPMS.WIP_TAG_ADJUSTMENT (:WIP_EXPIDS',
'      ,:WIP_PROJECT_NUMBER,:EVENT_ADJ_PCT, :EVENT_ADJ_AMT',
'      , :WIP_SEL_AMOUNT_COPY',
'      ,:WIP_BILLABLE_FLAG',
'      ,:WIP_JUSTIFICATION_CODE||CASE  WHEN :WIP_JUSTIFICATION_TEXT IS NOT NULL THEN '': ''||:WIP_JUSTIFICATION_TEXT END);',
'      if v_status = 0 ',
'      then',
'        :P4_SUCCESS_MESSAGE := ''Success'';',
'      end if;  ',
'    ELSE',
'      XX_GPMS.WIP_ADJUST_HOURS(:WIP_EXPIDS,:P4_HOURS,',
'      :WIP_JUSTIFICATION_CODE||CASE  WHEN :WIP_JUSTIFICATION_TEXT IS NOT NULL THEN '': ''||:WIP_JUSTIFICATION_TEXT END,V_STATUS,V_RESPONSE);',
'      if V_STATUS IN (200,201)',
'      then',
'        :P4_SUCCESS_MESSAGE := V_RESPONSE;',
'      ELSE',
'        apex_error.add_error (',
'          p_message          => v_response,',
'          p_display_location => apex_error.c_inline_in_notification );',
'      end if;  ',
'    END IF;    ',
'  END IF;  ',
'end if;',
'end;',
''))
,p_attribute_02=>'WIP_EXPIDS,EVENT_ADJ_PCT,WIP_PROJECT_NUMBER,EVENT_ADJ_AMT,WIP_SEL_AMOUNT,WIP_ERROR_FLAG,WIP_BILLABLE_FLAG,WIP_JUSTIFICATION_CODE,WIP_JUSTIFICATION_TEXT,P4_HOURS,P4_CANCEL,P4_EXPENDITURE_TYPE'
,p_attribute_03=>'P4_SUCCESS_MESSAGE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(299011024315207289)
,p_event_id=>wwv_flow_imp.id(299010761894207286)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Close Dialog and Progress Bar End'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i,',
'i = "Y";',
'apex.item( "WIP_MODAL_FLAG" ).setValue (i);',
'if ($v("WIP_ERROR_FLAG") == ''N'') {',
'apex.navigation.dialog.close(true);',
'apex.page.submit(''NEW'');',
'}',
'',
'endTimer();',
'',
''))
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P4_SUCCESS_MESSAGE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(333145888360127960)
,p_name=>'Format the Numbers as per the currency'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333146588531127967)
,p_event_id=>wwv_flow_imp.id(333145888360127960)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':WIP_SEL_AMOUNT_COPY := :WIP_SEL_AMOUNT;'
,p_attribute_02=>'WIP_SEL_AMOUNT_COPY,WIP_SEL_AMOUNT'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(333146022432127961)
,p_event_id=>wwv_flow_imp.id(333145888360127960)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'WIP_SEL_AMOUNT,WIP_SEL_AMOUNT_COPY'
,p_attribute_01=>'$("#WIP_SEL_AMOUNT").val(currencyFormatter(Number($("#WIP_SEL_AMOUNT").val()),apex.item("P4_CURRENCY").getValue()));'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30861094018108229)
,p_name=>'When Entered Hours calculate Non Billable Hours'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_HOURS'
,p_condition_element=>'P4_HOURS'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38968460889064405)
,p_event_id=>wwv_flow_imp.id(30861094018108229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'WIP_HOLD,WIP_BILLABLE_FLAG,EVENT_ADJ_AMT,EVENT_ADJ_PCT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38968532383064406)
,p_event_id=>wwv_flow_imp.id(30861094018108229)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'WIP_HOLD,WIP_BILLABLE_FLAG,EVENT_ADJ_AMT,EVENT_ADJ_PCT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30861760467108236)
,p_event_id=>wwv_flow_imp.id(30861094018108229)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Validations'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var total_hours = Number(apex.item(''WIP_HOURS_COUNT'').getValue());',
'var entered_hours = Number(apex.item(''P4_HOURS'').getValue());',
'var amount = apex.item(''EVENT_ADJ_AMT'').getValue();',
'var discount = apex.item(''EVENT_ADJ_PCT'').getValue();',
'apex.message.clearErrors();',
'if (entered_hours > total_hours){',
'     apex.message.clearErrors();',
'     apex.message.showErrors([',
'    {',
'        type:       "error",',
'        location:   [ "page", "inline" ],',
'        pageItem:   "P4_HOURS",',
'        message:    "Entered Hours cannot be greater than the total hours!",',
'        unsafe:     false',
'    }',
']);',
'apex.da.cancel();',
'}',
'else if (((amount && amount > 0 || discount && discount > 0) && (entered_hours && entered_hours > 0))){',
'    apex.message.clearErrors();',
'     apex.message.showErrors([',
'    {',
'        type:       "error",',
'        location:   [ "page"],',
'        pageItem:   "P4_HOURS",',
'        message:    "Enter either Amount or Hours!",',
'        unsafe:     false',
'    }',
'    ]);',
'    // apex.item(''P4_HOURS'').setValue(""); ',
'    // apex.item(''EVENT_ADJ_AMT'').setValue(""); ',
'    // apex.item(''EVENT_ADJ_PCT'').setValue(""); ',
'    apex.da.cancel();',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30861199921108230)
,p_event_id=>wwv_flow_imp.id(30861094018108229)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_HOURS_NON_BILLABLE'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':WIP_HOURS_COUNT - :P4_HOURS'
,p_attribute_07=>'WIP_HOURS_COUNT,P4_HOURS'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38968916505064410)
,p_name=>'When Clicked on Cancel'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_CANCEL'
,p_condition_element=>'P4_CANCEL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38969073363064411)
,p_event_id=>wwv_flow_imp.id(38968916505064410)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_HOURS,EVENT_ADJ_AMT,EVENT_ADJ_PCT,WIP_BILLABLE_FLAG,WIP_HOLD'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38969186756064412)
,p_event_id=>wwv_flow_imp.id(38968916505064410)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_HOURS,EVENT_ADJ_AMT,EVENT_ADJ_PCT,WIP_BILLABLE_FLAG,WIP_HOLD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38969643744064417)
,p_name=>'When Selected'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_EXPENDITURE_TYPE'
,p_condition_element=>'P4_EXPENDITURE_TYPE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38969705053064418)
,p_event_id=>wwv_flow_imp.id(38969643744064417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'WIP_HOLD,WIP_BILLABLE_FLAG,EVENT_ADJ_AMT,EVENT_ADJ_PCT,P4_HOURS,P4_CANCEL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38969813785064419)
,p_event_id=>wwv_flow_imp.id(38969643744064417)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'WIP_HOLD,WIP_BILLABLE_FLAG,EVENT_ADJ_AMT,EVENT_ADJ_PCT,P4_HOURS,P4_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(308051674770615191)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(308050374029615178)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Project Split - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>280081948523427797
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(18887119776046227)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Percentage_for_the_progress'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select percentage,message',
'into   :P0_PROGRESS_BAR2, :P0_PROGRESS_MESSAGE',
'from   progress_bar_entries',
'where  module = ''WIP_ADJUSTMENT''',
'and    seq = :P0_PROGRESS_SEQ',
'order  by seq;',
'exception',
' when others then',
'   :P0_PROGRESS_BAR2 := 99;',
'   :P0_PROGRESS_MESSAGE := ''Processing..'';',
'end;',
'',
'apex_json.open_object;',
'apex_json.write(''percent'', :P0_PROGRESS_BAR2);',
'apex_json.write(''message'', :P0_PROGRESS_MESSAGE);',
'apex_json.close_object;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>18887119776046227
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- SELECT PERCENTAGE, MESSAGE',
'-- INTO  :P2_PROGRESS_BAR2,:P2_PROGRESS_MESSAGE',
'-- FROM (',
'-- SELECT * ',
'-- FROM  PROGRESS_ENTRIES',
'-- ORDER BY CREATED_DATE DESC)',
'-- WHERE ROWNUM = 1;',
''))
);
wwv_flow_imp.component_end;
end;
/
