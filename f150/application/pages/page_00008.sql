prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
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
 p_id=>8
,p_name=>'Find and Replace Narrative'
,p_alias=>'FIND-REPLACE-NARRATIVE'
,p_page_mode=>'MODAL'
,p_step_title=>'Find and Replace Narrative'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(346846196945176931)
,p_plug_name=>'Find and Replace Narrative'
,p_region_name=>'find_replace'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(287999883159786523)
,p_plug_name=>'Spell Checker Results'
,p_region_name=>'spell_check_region'
,p_parent_plug_id=>wwv_flow_imp.id(346846196945176931)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EXP_ITEM_ID,ERROR_WORD,NARRATIVE,ID,',
'''''ADD_TO_DICTIONARY,',
''''' IGNORE',
'FROM SPELL_CHECKER_DTL SCD',
'WHERE NOT EXISTS (SELECT 1 ',
'FROM SPELL_CHECK_EXCEPTIONS SCE',
'WHERE 1=1',
'AND (DTL_ID = SCD.ID',
'AND   EXCEPTION_TYPE = ''I'')',
'OR (SCE.DTL_ID = SCD.ID',
'AND EXCEPTION_TYPE = ''P''',
'AND USER_EMAIL = :P8_SAAS_USER)',
'OR (SCE.DTL_ID = SCD.ID',
'AND EXCEPTION_TYPE = ''D''));',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P8_SAAS_USER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Spell Checker Results'
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
 p_id=>wwv_flow_imp.id(48935825600931943)
,p_name=>'EXP_ITEM_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXP_ITEM_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Exp Item Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(48935934949931944)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(288003088827786555)
,p_name=>'ERROR_WORD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ERROR_WORD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Error Word'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(288003295806786557)
,p_name=>'SUGGESTED'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Suggested Words'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_04=>'Y'
,p_attribute_05=>'N'
,p_attribute_08=>'120'
,p_item_width=>30
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT val D, VAL R from SPELL_CHECKER_DTL, xmltable(''/root/e/text()'' passing XMLTYPE(''<root><e>''',
'  || REPLACE(Suggested_Words,'','',''</e><e>'')',
'  || ''</e></root>'') columns val VARCHAR2(50) path ''/'' )',
'WHERE 1=1--EXP_ITEM_ID = :EXP_ITEM_ID',
'AND   UPPER(TRIM(ERROR_WORD)) = UPPER(TRIM(:ERROR_WORD))',
''))
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_null_text=>'-- SELECT --'
,p_lov_cascade_parent_items=>'ID,EXP_ITEM_ID,ERROR_WORD'
,p_ajax_items_to_submit=>'ID,EXP_ITEM_ID,ERROR_WORD'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290908022434637517)
,p_name=>'NARRATIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NARRATIVE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Narrative'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(290911488447637552)
,p_name=>'ADD_TO_DICTIONARY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ADD_TO_DICTIONARY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Add'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:apex.event.trigger(document, ''buttonPressed'', [{P2_EXP_ID:''&ID.''}]);void(0);'
,p_link_text=>'<span class="fa fa-database-plus" aria-hidden="true"></span>'
,p_link_attributes=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
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
,p_include_in_export=>false
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(291504312814021861)
,p_name=>'IGNORE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IGNORE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ignore'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:javascript:apex.event.trigger(document, ''buttonClicked'', [{P2_EXP_ID:''&ID.''}]);void(0);'
,p_link_text=>'<span aria-hidden="true" class="fa fa-ban"></span>'
,p_link_attributes=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
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
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(288002913266786553)
,p_internal_uid=>261108873389202266
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>'Click on "Spell Check" button to get the results!!'
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
'return config; ',
'}  '))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(290503291553878607)
,p_interactive_grid_id=>wwv_flow_imp.id(288002913266786553)
,p_static_id=>'492148'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(290503498782878607)
,p_report_id=>wwv_flow_imp.id(290503291553878607)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(38062517494890640)
,p_view_id=>wwv_flow_imp.id(290503498782878607)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(48935825600931943)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(38063918375890644)
,p_view_id=>wwv_flow_imp.id(290503498782878607)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(48935934949931944)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290504973639878619)
,p_view_id=>wwv_flow_imp.id(290503498782878607)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(288003088827786555)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(290508893544915386)
,p_view_id=>wwv_flow_imp.id(290503498782878607)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(288003295806786557)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>149
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(291115945507984250)
,p_view_id=>wwv_flow_imp.id(290503498782878607)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(290908022434637517)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(291199764936208427)
,p_view_id=>wwv_flow_imp.id(290503498782878607)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(290911488447637552)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>59
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(292002348994981211)
,p_view_id=>wwv_flow_imp.id(290503498782878607)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(291504312814021861)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(288002628209786550)
,p_plug_name=>'Find and Replace sub Region'
,p_parent_plug_id=>wwv_flow_imp.id(346846196945176931)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294395967304717101)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38064881611816355)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(288002628209786550)
,p_button_name=>'P8_SEARCH_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_image_alt=>'Find'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38065244507816355)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(288002628209786550)
,p_button_name=>'P8_REPLACE_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_image_alt=>'Replace'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38064152050816354)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(287999883159786523)
,p_button_name=>'SPELL_CHECK'
,p_button_static_id=>'SPELL_CHECK'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_image_alt=>'Spell Check'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38063781104816354)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(287999883159786523)
,p_button_name=>'REPLACE_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_image_alt=>'Replace All'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(38063397671816352)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(287999883159786523)
,p_button_name=>'VIEW_DICTIONARY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_image_alt=>'View Dictionary'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5::'
,p_icon_css_classes=>'fa-book'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38059176259816325)
,p_name=>'P8_SPELL_RECORDS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(346846196945176931)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38065722659816355)
,p_name=>'P8_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(288002628209786550)
,p_prompt=>'Find'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38066111797816356)
,p_name=>'P8_REPLACE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(288002628209786550)
,p_prompt=>'Replace'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37772279102699927)
,p_name=>'Click on Spell Check Button'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(38064152050816354)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37772368668699928)
,p_event_id=>wwv_flow_imp.id(37772279102699927)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	var grid_model = apex.region("ProjectCosts").widget().interactiveGrid("getViews", "grid").model;',
'	var records = grid_model.getTotalRecords();',
'	var narrative, expenditure_item_id;',
'	var wrongWords = { ''words'': [] };',
'	var wrongWordsJSON;',
'	$s("P2_SPELL_RECORDS", "");',
'',
'	if (records > 0) {',
'		$.get(''#APP_IMAGES#en_US.aff'', function (affData) {',
'			$.get(''#APP_IMAGES#en_US.dic'', function (wordsData) {',
'				var dictionary = new Typo("en_US", affData, wordsData);',
'				grid_model.forEach(function (record, index, id) {',
'					narrative = grid_model.getValue(record, "NARRATIVE_BILLING_OVERFLOW");',
'					expenditure_item_id = grid_model.getValue(record, "EXPENDITURE_ITEM_ID");',
'					var split_array = narrative.split(" ");',
'					for (j = 0; j < split_array.length; j++) {',
'						if (!(dictionary.check(split_array[j]))) {',
'							//alert (''Error word :''+split_array[j]+ '' at index ''+index+'' \n Suggested: ''+dictionary.suggest(split_array[j]));',
'							wrongWords.words.push({',
'								"EXPENDITURE_ITEM_ID": expenditure_item_id,',
'                                "narrative": narrative,',
'								"Error_Word": split_array[j],',
'								"Suggested_Words": dictionary.suggest(split_array[j])',
'							});',
'                           // alert(wrongWords.length);',
'						}',
'					}',
'				});',
'				wrongWordsJSON = JSON.stringify(wrongWords);',
'				apex.item(''P2_SPELL_RECORDS'').setValue(wrongWordsJSON);',
'				apex.server.process(''Insert_spellcheck_table'', {',
'					pageItems: ''#P2_SPELL_RECORDS''',
'				},',
'					{',
'						dataType: ''text'', success: function () {',
'							apex.region("spell_check_region").refresh();',
'                            apex.message.showPageSuccess( ''Spell Check Complete!!'');',
'						}',
'					})',
'			});',
'		});',
'',
'	};'))
);
wwv_flow_imp.component_end;
end;
/
