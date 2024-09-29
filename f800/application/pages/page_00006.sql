prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
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
 p_id=>6
,p_name=>'Fee Allocation'
,p_alias=>'FEE-ALLOCATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Fee Allocation'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/// Not working when moved into JS File',
'',
'$(".is-aggregate .a-GV-rowLabel").text("Total");',
'// Set the Value of Write Down % Total',
'// var tot_fees = $($(".is-aggregate td")[3]).text();',
'// var tot_write_down = $($(".is-aggregate td")[4]).text();',
'// var realizedamt = $($(".is-aggregate td")[6]).text();',
'// var tot_percent = ((tot_fees - realizedamt) / tot_fees * 100).toFixed(2);',
'// $($(".is-aggregate td")[5]).text(tot_percent);',
'',
'$(".a-MediaBlock").hide();',
'var i_selector = $(''#FeeAllocation tr .dummy'');',
'//var i_selector = $(''#FeeAllocation tr td'');',
'var i_currency = ''&G_CURRENCY.'';',
'for (i = 0; i < i_selector.length; i++) {',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML), i_currency);',
'}',
'',
'init_page6();'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50884249642902313)
,p_plug_name=>'Container'
,p_region_name=>'container'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(308408320642310814)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30662143718267113)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_imp.id(50884249642902313)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(308380830428310798)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51080577911522294)
,p_plug_name=>'Fee Allocation'
,p_region_name=>'FeeAllocation'
,p_parent_plug_id=>wwv_flow_imp.id(50884249642902313)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(308406348131310813)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT C001 PERSON_NAME,',
'    --    C002 JOB_NAME,',
'       C002 LINES,',
'       C003 HOURS,',
'       C004 FEES,',
'       C005 ADJUSTMENT,',
'       C006 OLD_ADJUSTMENT,',
'       C007 WRITE_DOWN_PCT,',
'       C008 FEE_ALLOCATION,',
'       C009 STANDARD_BILL_RATE_AMT,',
'       C008/DECODE(C009,0,1,NULL,1,C009)*100 C010,',
'       C011 OLD_FEE_ALLOCATION,',
'       C012 OLD_WRITE_DOWN_PCT,',
'       C013 SESSION_ID,',
'       SEQ_ID',
'FROM APEX_COLLECTIONS',
'WHERE COLLECTION_NAME = ''PERSON_ADJUSTMENTS'';'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Fee Allocation'
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
 p_id=>wwv_flow_imp.id(29657487432000231)
,p_name=>'C010'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C010'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Realization %'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51082058975522309)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Seq Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51082115280522310)
,p_name=>'PERSON_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PERSON_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Person Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.defaultGridColumnOptions = {',
'        noStretch: true',
'    };',
'    return config;',
'}   '))
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51082345881522312)
,p_name=>'LINES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINES'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Lines'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51082493608522313)
,p_name=>'HOURS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HOURS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Hours'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_format_mask=>'999G999G999G999G990D00'
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51082560823522314)
,p_name=>'FEES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FEES'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Fees@ Agreement'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'is-readonly  dummy'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>false
,p_filter_is_required=>false
,p_static_id=>'fees_agreement'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51083049156522319)
,p_name=>'STANDARD_BILL_RATE_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STANDARD_BILL_RATE_AMT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51083737317522326)
,p_name=>'ADJUSTMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ADJUSTMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Write Down (-Up)'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'dummy'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51083842650522327)
,p_name=>'OLD_ADJUSTMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OLD_ADJUSTMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Old Adjustment'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51083999989522328)
,p_name=>'WRITE_DOWN_PCT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WRITE_DOWN_PCT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Write Down %'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51084164263522330)
,p_name=>'FEE_ALLOCATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FEE_ALLOCATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Fee Allocation'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'dummy'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51084256905522331)
,p_name=>'OLD_FEE_ALLOCATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OLD_FEE_ALLOCATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51084339722522332)
,p_name=>'OLD_WRITE_DOWN_PCT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OLD_WRITE_DOWN_PCT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(51315585753303992)
,p_name=>'SESSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SESSION_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(51080638305522295)
,p_internal_uid=>10201735304344311
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>true
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
' config.defaultGridViewOptions = { ',
'     footer: false ',
'     }; ',
'',
'return config; ',
'}  ',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(51118479636710486)
,p_interactive_grid_id=>wwv_flow_imp.id(51080638305522295)
,p_static_id=>'102396'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(51118646877710486)
,p_report_id=>wwv_flow_imp.id(51118479636710486)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(30067472199202208)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(29657487432000231)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51130717941710517)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(51082058975522309)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51140463963730697)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(51082115280522310)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51142257544730703)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(51082345881522312)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>53
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51143108769730706)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(51082493608522313)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51144037462730712)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(51082560823522314)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51148581001730728)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(51083049156522319)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51228073170284556)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(51083737317522326)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51228997216284560)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(51083842650522327)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51229845839284562)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(51083999989522328)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51268931280528653)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(51084164263522330)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51290007265594207)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(51084256905522331)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51295989046656686)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(51084339722522332)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51333322426037266)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(51315585753303992)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(40879227973177985)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(51083999989522328)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(40880929197180607)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(51082560823522314)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(40885607480178426)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(51084164263522330)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(40890030998185139)
,p_view_id=>wwv_flow_imp.id(51118646877710486)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(51083737317522326)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51314976446303986)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(50884249642902313)
,p_button_name=>'CLEAR'
,p_button_static_id=>'CLR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(308469095164310861)
,p_button_image_alt=>'Clear'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-eraser'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(51079936365522288)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(50884249642902313)
,p_button_name=>'CALCULATE'
,p_button_static_id=>'CALC'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(308469095164310861)
,p_button_image_alt=>'Calculate'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calculator'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(50884165969902312)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(50884249642902313)
,p_button_name=>'CREATE_ADJUSTMENTS'
,p_button_static_id=>'CREATE_ADJ'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(308468966713310861)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Adjustments'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P6_COLL_CHANGED = ''Y'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-adjust'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23039639334582516)
,p_name=>'P6_ON_LOAD'
,p_item_sequence=>60
,p_item_default=>'1'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31847446900186633)
,p_name=>'P6_JUSTIFICATION_CODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(30662143718267113)
,p_prompt=>'Justification'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Client Satisfaction;Client Satisfaction,Billing Error;Billing Error,B.I.S.S.;B.I.S.S.,We do not pay for summer associates;We do not pay for summer associates'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- SELECT --'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(308468080743310861)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31847663400188087)
,p_name=>'P6_JUSTIFICATION_TEXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(30662143718267113)
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>150
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(308468080743310861)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41119505101014740)
,p_name=>'P6_PROJECT_NUMBER'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41119526326014741)
,p_name=>'P6_AGREEMENT_NUMBER'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(51316903428304006)
,p_name=>'P6_COLL_CHANGED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(50884249642902313)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(32462694226157168)
,p_validation_name=>'Justification is needed for Write Up/Down'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if coalesce(:P6_JUSTIFICATION_CODE,:P6_JUSTIFICATION_TEXT,''~!~'') = ''~!~''',
'  then',
'    return ''Justification is needed if Write Up/Down is performed!'';',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P6_COLL_CHANGED'
,p_validation_condition2=>'Y'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(31847446900186633)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51315804601303995)
,p_name=>'Check if IG has changed'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(50884165969902312)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51316087872303997)
,p_event_id=>wwv_flow_imp.id(51315804601303995)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'CREATE_ADJUSTMENTS'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51316526316304002)
,p_name=>'Change of Values'
,p_event_sequence=>20
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(51080577911522294)
,p_triggering_element=>'ADJUSTMENT,WRITE_DOWN_PCT,FEE_ALLOCATION'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51316637960304003)
,p_event_id=>wwv_flow_imp.id(51316526316304002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item("CALC").show();',
'// apex.item("CLR").show();',
'apex.item("CREATE_ADJ").hide();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(51317199705304008)
,p_name=>'After Refresh of Region'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(51080577911522294)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51317252155304009)
,p_event_id=>wwv_flow_imp.id(51317199705304008)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(".a-MediaBlock").hide();'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51083487705522323)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(51080577911522294)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fee Allocation - Save Interactive Grid Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_STATUS NUMBER;',
'    V_EXP_ID VARCHAR2(32767);',
'BEGIN',
'    SELECT ''-''',
'           ||',
'           LISTAGG(EXPENDITURE_ITEM_ID, ''-'')',
'           || ''-''',
'    INTO V_EXP_ID',
'    FROM XXGPMS_PROJECT_COSTS',
'    WHERE PERSON_NAME = :PERSON_NAME;',
'',
'    V_STATUS := XX_GPMS.WIP_TAG_ADJUSTMENT(V_EXP_ID, ',
'    :WIP_PROJECT_NUMBER, ',
'    NULL, ',
'    TO_NUMBER(:FEES, ''999G999G999G999G990D00'') +',
'    TO_NUMBER(:ADJUSTMENT, ''999G999G999G999G990D00''), ',
'    TO_NUMBER(:FEES, ''999G999G999G999G990D00''));',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(50884165969902312)
,p_process_when_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
,p_only_for_changed_rows=>'N'
,p_internal_uid=>23113761458334929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51315421243303991)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Adjustments'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
' V_ACTUAL_FEE_ALLOC NUMBER;',
' V_EXP_ID VARCHAR2(32767);',
' V_STATUS NUMBER;',
' V_FINAL_EXP_ID varchar2(4000);',
'BEGIN ',
'FOR I IN (SELECT * FROM APEX_COLLECTIONS',
'WHERE COLLECTION_NAME = ''PERSON_ADJUSTMENTS''',
'AND  C013 = V(''SESSION''))',
'LOOP',
'',
' -- GET THE ACTUAL SUM OF REALIZED AMOUNT FOR THAT PERSON',
'   SELECT SUM(REALIZED_BILL_RATE_AMT)',
'   INTO   V_ACTUAL_FEE_ALLOC',
'   FROM   XXGPMS_PROJECT_COSTS',
'   WHERE  PERSON_NAME = I.C001',
'   AND    SESSION_ID = I.C013',
'   AND    LOWER(WIP_CATEGORY) = ''labor'';',
'',
' -- COMPARE IT WITH THE NEW REALIZED AMOUNT SUM',
' IF I.C009 <> V_ACTUAL_FEE_ALLOC THEN',
'   SELECT ''-''',
'           ||',
'           LISTAGG(DISTINCT EXPENDITURE_ITEM_ID, ''-'')',
'           || ''-''',
'    INTO V_EXP_ID',
'    FROM XXGPMS_PROJECT_COSTS',
'    WHERE PERSON_NAME = I.C001',
'    AND    SESSION_ID = I.C013',
'    AND    LOWER(WIP_CATEGORY) = ''labor'';',
'',
'    V_STATUS := XX_GPMS.WIP_TAG_ADJUSTMENT(V_EXP_ID,',
'    :WIP_PROJECT_NUMBER, ',
'    NULL, ',
'    I.C004-I.C005, ',
'    I.C004,',
'    ''Y'',',
'    :P6_JUSTIFICATION_CODE||case when :P6_JUSTIFICATION_TEXT is not null then '': ''||:P6_JUSTIFICATION_TEXT end ',
'    );',
' END IF;',
' V_FINAL_EXP_ID := V_FINAL_EXP_ID||''-''||V_EXP_ID;',
'END LOOP; ',
':P0_CUMULATIVE_EXP_ID := V_FINAL_EXP_ID;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(50884165969902312)
,p_internal_uid=>23345694996116597
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51315332490303990)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear the Collection'
,p_process_sql_clob=>'APEX_COLLECTION.DELETE_COLLECTION(''PERSON_ADJUSTMENTS'');'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CLEAR,CREATE_ADJUSTMENTS'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>23345606243116596
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51083517776522324)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(51080577911522294)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calculate New Values'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'--6 -- NEW_ADJ --7 -- OLD_ADJ',
'-- 8 --NEW_WRITE_DOWN -- 13 -- WRITE_DOWN_PCT',
'-- 9 -- ALLOCATION -- 12 -- OLD_ALLOC',
' V_NEW_ADJUSTMENT NUMBER;',
' --V_ADJUSTMENT NUMBER := TO_NUMBER(:ADJUSTMENT);',
'BEGIN ',
'IF :OLD_ADJUSTMENT <> :ADJUSTMENT THEN',
' APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''5'',',
'        p_attr_value => :ADJUSTMENT);',
' APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''6'',',
'        p_attr_value => :ADJUSTMENT);',
' APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''8'',',
'        p_attr_value => :FEES -:ADJUSTMENT);    ',
'APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''11'',',
'        p_attr_value => :FEES -:ADJUSTMENT);               ',
' APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''7'',',
'        p_attr_value => (:FEES- (:FEES-:ADJUSTMENT))/(CASE NVL(:FEES,0) WHEN 0 THEN 1 ELSE :FEES END)*100);        ',
' APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''12'',',
'        p_attr_value => (:FEES- (:FEES-:ADJUSTMENT))/(CASE NVL(:FEES,0) WHEN 0 THEN 1 ELSE :FEES END)*100);                ',
'ELSIF :OLD_FEE_ALLOCATION <> :FEE_ALLOCATION THEN',
'  APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''8'',',
'        p_attr_value => :FEE_ALLOCATION);',
'   APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''11'',',
'        p_attr_value => :FEE_ALLOCATION); ',
'     APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''5'',',
'        p_attr_value => :FEES-:FEE_ALLOCATION);  ',
'    APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''6'',',
'        p_attr_value => :FEES-:FEE_ALLOCATION);      ',
'     APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''7'',',
'        p_attr_value => (:FEES- :FEE_ALLOCATION)/(CASE NVL(:FEES,0) WHEN 0 THEN 1 ELSE :FEES END)*100);  ',
'     APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''12'',',
'        p_attr_value => (:FEES- :FEE_ALLOCATION)/(CASE NVL(:FEES,0) WHEN 0 THEN 1 ELSE :FEES END)*100);             ',
'ELSIF :OLD_WRITE_DOWN_PCT <> :WRITE_DOWN_PCT THEN',
'APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''7'',',
'        p_attr_value => :WRITE_DOWN_PCT);',
'APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''12'',',
'        p_attr_value => :WRITE_DOWN_PCT);',
'        V_NEW_ADJUSTMENT := :FEES-(:FEES*(:WRITE_DOWN_PCT/100));',
'APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''5'',',
'        p_attr_value => :FEES*(:WRITE_DOWN_PCT/100));',
'APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''6'',',
'        p_attr_value => :FEES*(:WRITE_DOWN_PCT/100));        ',
'APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''8'',',
'        p_attr_value => V_NEW_ADJUSTMENT);   ',
'APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (',
'        p_collection_name => ''PERSON_ADJUSTMENTS'',',
'        p_seq => :SEQ_ID,',
'        p_attr_number => ''11'',',
'        p_attr_value => V_NEW_ADJUSTMENT);         ',
'END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(51079936365522288)
,p_internal_uid=>23113791529334930
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(50884361533902314)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog on SAVE'
,p_attribute_01=>'P0_CUMULATIVE_EXP_ID'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(50884165969902312)
,p_internal_uid=>22914635286714920
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(51080470166522293)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Collection from Query'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'V_QUERY VARCHAR2(32767);',
'BEGIN',
'--APEX_COLLECTION.DELETE_COLLECTION(P_COLLECTION_NAME => ''PERSON_ADJUSTMENTS'');',
'IF NOT APEX_COLLECTION.COLLECTION_EXISTS(''PERSON_ADJUSTMENTS'') ',
'THEN',
'  IF  :P6_ON_LOAD = 1 ',
'  THEN',
'   APEX_COLLECTION.DELETE_COLLECTION(P_COLLECTION_NAME => ''PERSON_ADJUSTMENTS'');',
'  END IF; ',
'    V_QUERY := q''#SELECT PERSON_NAME,',
'   COUNT(*)                    LINES,',
'   SUM(QUANTITY)               HOURS,',
'   SUM(PROJECT_BILL_RATE_AMT)  FEES,',
'   SUM(PROJECT_BILL_RATE_AMT) -   SUM(REALIZED_BILL_RATE_AMT)     ADJUSTMENT,',
'   SUM(PROJECT_BILL_RATE_AMT) -   SUM(REALIZED_BILL_RATE_AMT)     OLD_ADJUSTMENT,',
'   ROUND((SUM(PROJECT_BILL_RATE_AMT) - SUM(REALIZED_BILL_RATE_AMT))/DECODE(SUM(PROJECT_BILL_RATE_AMT),0,1,NULL,1,SUM(PROJECT_BILL_RATE_AMT))*100,2)    WRITE_DOWN_PCT,',
'   TRUNC(SUM(REALIZED_BILL_RATE_AMT),2) FEE_ALLOCATION,',
'   SUM(STANDARD_BILL_RATE_AMT) STANDARD_BILL_RATE_AMT,',
'   TRUNC(SUM(REALIZED_BILL_RATE_AMT)/DECODE(SUM(STANDARD_BILL_RATE_AMT),0,1,NULL,1,SUM(STANDARD_BILL_RATE_AMT))*100,2)       REALIZATION_PCT,',
'   SUM(REALIZED_BILL_RATE_AMT) OLD_FEE_ALLOCATION,',
'   TRUNC((SUM(PROJECT_BILL_RATE_AMT) - SUM(REALIZED_BILL_RATE_AMT))/DECODE(SUM(PROJECT_BILL_RATE_AMT),0,1,NULL,1,SUM(PROJECT_BILL_RATE_AMT))*100,2)    OLD_WRITE_DOWN_PCT,',
'   V(''SESSION'') SESSION_ID',
'FROM XXGPMS_PROJECT_COSTS',
'WHERE SESSION_ID = V(''SESSION'')',
'AND   PROJECT_NUMBER = COALESCE(''#''||:P6_PROJECT_NUMBER||q''#'',project_number)',
'and   contract_number = nvl(''#''||:P6_AGREEMENT_NUMBER||q''#'',contract_number)',
'and  lower(wip_category) = ''labor''',
'GROUP BY PERSON_NAME#'';',
'    APEX_COLLECTION.CREATE_COLLECTION_FROM_QUERY(P_COLLECTION_NAME => ''PERSON_ADJUSTMENTS''',
'    , P_QUERY => V_QUERY, P_GENERATE_MD5 =>',
'    ''YES'');',
'',
'    :P6_ON_LOAD := 0;',
'',
'ELSE',
'  IF(APEX_COLLECTION.COLLECTION_HAS_CHANGED (',
'    p_collection_name => ''PERSON_ADJUSTMENTS''))',
'    THEN',
'      :P6_COLL_CHANGED := ''Y'';',
'  ELSE',
'    :P6_COLL_CHANGED := ''N'';    ',
'  END IF; ',
'  :P6_ON_LOAD := 0;   ',
'END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>23110743919334899
);
wwv_flow_imp.component_end;
end;
/
