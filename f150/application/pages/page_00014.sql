prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
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
 p_id=>14
,p_name=>'Transfer and Split'
,p_alias=>'TRANSFER-AND-SPLIT'
,p_page_mode=>'MODAL'
,p_step_title=>'Transfer and Split'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(29524154028939355)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(310888108932889181)
,p_plug_name=>'Transfer and Split'
,p_region_name=>'ProjectSplit'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'XXGPMS_PROJECT_SPLIT'
,p_query_where=>'SESSION_ID = V(''APP_SESSION'')'
,p_include_rowid_column=>true
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P14_ACTION_SELECTION,P14_ACTUAL_PROJECT_NUMBER,P14_ACTUAL_TASK_NUMBER,P14_WIP_HOURS_COUNT,P14_WIP_PROJECT_NUMBER'
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
 p_id=>wwv_flow_imp.id(4224894765455661)
,p_name=>'CREATION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATION_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(4224840703455660)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(4224728524455659)
,p_name=>'LAST_UPDATE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(4224623455455658)
,p_name=>'LAST_UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(4224541567455657)
,p_name=>'ACTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Action'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P14_ACTION_SELECTION'
,p_duplicate_value=>true
,p_include_in_export=>false
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2132782622777239)
,p_name=>'TASK_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Task Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
,p_default_type=>'FUNCTION_BODY'
,p_default_language=>'PLSQL'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P14_ACTION_SELECTION = ''S'' and :P14_WIP_LINE_COUNT = 1 ',
'then',
'  return :P14_ACTUAL_TASK_NUMBER;',
'end if;  '))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'EXPRESSION'
,p_readonly_condition=>':P14_ACTION_SELECTION = ''S'''
,p_readonly_condition2=>'PLSQL'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15081218082063449)
,p_name=>'PERCENTAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PERCENTAGE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Percentage'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_02=>'100'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
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
,p_readonly_condition_type=>'EXPRESSION'
,p_readonly_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P14_ACTION_SELECTION = ''S'' and :P14_PROJECTS_COUNT > 1)',
'or ',
'(:P14_ACTION_SELECTION = ''T'')'))
,p_readonly_condition2=>'PLSQL'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(303986484603744764)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(310888818672889188)
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
 p_id=>wwv_flow_imp.id(310888920837889189)
,p_name=>'PROJECT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'&P0_PROJECT_LABEL. Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'FUNCTION_BODY'
,p_default_language=>'PLSQL'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P14_ACTION_SELECTION = ''S'' and :P14_PROJECTS_COUNT = 1 ',
'then',
'  return :P14_ACTUAL_PROJECT_NUMBER;',
'end if;  '))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'EXPRESSION'
,p_readonly_condition=>':P14_ACTION_SELECTION = ''S'' '
,p_readonly_condition2=>'PLSQL'
,p_readonly_for_each_row=>false
,p_column_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'       DISTINCT PROJECT_NUMBER D, PROJECT_NUMBER R',
'      FROM',
'        XXGPMS_PROJECTS',
'      WHERE 1=1',
'      AND   (',
'          (:P14_ACTION_SELECTION = ''S'' AND PROJECT_NUMBER = :P14_ACTUAL_PROJECT_NUMBER)',
'          or (:P14_ACTION_SELECTION in (''T'',''ST''))',
'    --   or (:P14_ACTION_SELECTION = ''T'' and PROJECT_NUMBER <> :P14_ACTUAL_PROJECT_NUMBER and :P14_PROJECTS_COUNT =1 )',
'    --   or (:P14_ACTION_SELECTION = ''T'' and :P14_PROJECTS_COUNT > 1 AND PROJECT_NUMBER NOT IN (',
'    --       SELECT REGEXP_SUBSTR(:P14_WIP_PROJECT_NUMBER,''[^-]+'',1,LEVEL)',
'    --       FROM DUAL',
'    --       CONNECT BY LEVEL<=REGEXP_COUNT(:P14_WIP_PROJECT_NUMBER,''[^-]+'',1))',
'    --   )',
'    --   or (:P14_ACTION_SELECTION = ''ST'' AND PROJECT_NUMBER NOT IN (',
'    --       SELECT REGEXP_SUBSTR(:P14_WIP_PROJECT_NUMBER,''[^-]+'',1,LEVEL)',
'    --       FROM DUAL',
'    --       CONNECT BY LEVEL<=REGEXP_COUNT(:P14_WIP_PROJECT_NUMBER,''[^-]+'',1))',
'    --   )',
'        )',
'        ORDER BY 1'))
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(310889192970889191)
,p_name=>'QUANTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY'
,p_data_type=>'NUMBER'
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
,p_default_type=>'FUNCTION_BODY'
,p_default_language=>'PLSQL'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P14_ACTION_SELECTION = ''T''',
'then',
'  return :P14_WIP_HOURS_COUNT;',
'end if;  '))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'EXPRESSION'
,p_readonly_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P14_ACTION_SELECTION = ''S'' and (:P14_WIP_LINE_COUNT > 1 or :P14_PROJECTS_COUNT > 1))',
'or',
'(:P14_ACTION_SELECTION = ''S'' and :P14_WIP_EXPIDS_COUNT > 1) ',
'or ',
'(:P14_ACTION_SELECTION = ''T'')',
'or ',
'(:P14_ACTION_SELECTION = ''ST'' and :P14_WIP_EXPIDS_COUNT > 1 )'))
,p_readonly_condition2=>'PLSQL'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(310889262390889192)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(310889382423889193)
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
 p_id=>wwv_flow_imp.id(310888773344889187)
,p_internal_uid=>324873636468482884
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(311902023845318895)
,p_interactive_grid_id=>wwv_flow_imp.id(310888773344889187)
,p_static_id=>'127193'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(311902157603318895)
,p_report_id=>wwv_flow_imp.id(311902023845318895)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4443906134703092)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(4224894765455661)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4444802677703101)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(4224840703455660)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4445728577703104)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(4224728524455659)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4446566209703106)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(4224623455455658)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4447532495703108)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(4224541567455657)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7934974897835389)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(2132782622777239)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(16866210722178797)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(15081218082063449)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(304293695250371520)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(303986484603744764)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(311902698643318902)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(310888818672889188)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(311903023003318908)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(310888920837889189)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(311904030090318912)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(310889192970889191)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(311904556985318914)
,p_view_id=>wwv_flow_imp.id(311902157603318895)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(310889262390889192)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>58.39099999999999
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4225526031455667)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(16874860769514519)
,p_branch_name=>'Redirect to Same Page'
,p_branch_action=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4226500877455677)
,p_name=>'P14_WIP_SEL_AMOUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_prompt=>'WIP Amount'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4226363921455676)
,p_name=>'P14_WIP_EXPIDS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4226347292455675)
,p_name=>'P14_WIP_LINE_COUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_prompt=>'Total Lines'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4226199464455674)
,p_name=>'P14_WIP_HOURS_COUNT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_prompt=>'Total Hours'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4226159898455673)
,p_name=>'P14_WIP_PROJECT_NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4225964343455672)
,p_name=>'P14_CURRENCY'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4225615398455668)
,p_name=>'P14_ACTION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P14_WIP_LINE_COUNT > 1 ',
'then',
'  return ''Transfer'';',
'end if;  '))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4223846396455650)
,p_name=>'P14_ACTUAL_PROJECT_NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4223579696455648)
,p_name=>'P14_WIP_TASK_NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4223536277455647)
,p_name=>'P14_ACTUAL_TASK_NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2132176842777233)
,p_name=>'P14_JOB_ALREADY_EXECUTED'
,p_item_sequence=>50
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3839370732736520)
,p_name=>'P14_JUSTIFICATION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Justification'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>150
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(294483322383717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15081099025063448)
,p_name=>'P14_ACTION_SELECTION'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_prompt=>'Action'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Split;S,Transfer;T,Split & Transfer;ST'
,p_field_template=>wwv_flow_imp.id(294483322383717164)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'3'
,p_attribute_02=>'REDIRECT_SET_VALUE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16874119480514511)
,p_name=>'P14_PROJECTS_COUNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_prompt=>'Projects Selected'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16874727348514517)
,p_name=>'P14_SUCCESS_MESSAGE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16874793973514518)
,p_name=>'P14_WIP_EXPIDS_COUNT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16874965326514520)
,p_name=>'P14_ERROR_MESSAGE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16875115237514521)
,p_name=>'P14_ALL_SELECTED_PROJECTS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(310888108932889181)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(4224205229455654)
,p_name=>'When Project is Selected'
,p_event_sequence=>10
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(310888108932889181)
,p_triggering_element=>'PROJECT_NUMBER,TASK_NUMBER,QUANTITY'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'PROJECT_NUMBER'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4224117047455653)
,p_event_id=>wwv_flow_imp.id(4224205229455654)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'xx_gpms.wip_debug(3,20000,''P14_WIP_LINE_COUNT ''||:P14_WIP_LINE_COUNT,'''');',
'xx_gpms.wip_debug(3,20000,''P14_ACTUAL_PROJECT_NUMBER ''||:P14_ACTUAL_PROJECT_NUMBER,'''');',
'xx_gpms.wip_debug(3,20000,''P14_ACTUAL_TASK_NUMBER ''||:P14_ACTUAL_TASK_NUMBER,'''');',
'xx_gpms.wip_debug(3,20000,''P14_WIP_HOURS_COUNT ''||:P14_WIP_HOURS_COUNT,'''');',
'xx_gpms.wip_debug(3,20000,''PROJECT_NUMBER ''||:PROJECT_NUMBER,'''');',
'xx_gpms.wip_debug(3,20000,''TASK_NUMBER ''||:TASK_NUMBER,'''');',
'xx_gpms.wip_debug(3,20000,''QUANTITY ''||:QUANTITY,'''');',
'',
'IF :P14_WIP_LINE_COUNT > 1 ',
'THEN ',
'  :ACTION := ''TRANSFER'';',
'ELSE',
'  IF trim(upper(:PROJECT_NUMBER)) <> trim(upper(:P14_ACTUAL_PROJECT_NUMBER))',
'  THEN    ',
'    IF :P14_WIP_HOURS_COUNT = :QUANTITY',
'    THEN',
'      :ACTION := ''TRANSFER'';',
'    ELSIF :P14_WIP_HOURS_COUNT <> :QUANTITY',
'    THEN',
'      :ACTION  := ''MULTI_SPLIT_TRANS'';',
'    END IF;',
'  ELSE',
'    IF :P14_WIP_HOURS_COUNT <> :QUANTITY AND :P14_ACTUAL_TASK_NUMBER <> :TASK_NUMBER',
'    THEN',
'      :ACTION := ''MULTI_SPLIT_TRANS'';',
'    ELSIF :P14_WIP_HOURS_COUNT <> :QUANTITY AND :P14_ACTUAL_TASK_NUMBER = :TASK_NUMBER  ',
'    THEN',
'      :ACTION := ''SPLIT'';',
'    ELSE',
'      :ACTION := ''TRANSFER'';  ',
'    END IF;',
'  END IF;  ',
'END IF;',
''))
,p_attribute_02=>'PROJECT_NUMBER,P14_WIP_PROJECT_NUMBER,P14_ACTUAL_PROJECT_NUMBER,P14_WIP_TASK_NUMBER,P14_ACTUAL_TASK_NUMBER,TASK_NUMBER,QUANTITY'
,p_attribute_03=>'ACTION'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(4860593311091605)
,p_name=>'Validate the Quantity & Percentage Entered'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(4225526031455667)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4860720365091606)
,p_event_id=>wwv_flow_imp.id(4860593311091605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var quantity = 0;',
'var percentage = 0;',
'var grid_model = apex.region("ProjectSplit").widget().interactiveGrid("getViews","grid").model;',
'grid_model.forEach(function(record,index,id){',
'    // if (!(grid_model.getValue(record,"QUANTITY"))||',
'    //    !(grid_model.getValue(record,"TASK_NUMBER"))||',
'    //    !(grid_model.getValue(record,"MATTER_NUMBER"))){',
'    //         apex.message.clearErrors();',
'    //         apex.message.showErrors([',
'    //      {',
'    //     type:       "error",',
'    //     location:   "page",',
'    //     message:    "Quantity or Task Number or Matter Number Cannot be empty to perform Split or Transfer",',
'    //     unsafe:     false',
'    //      }',
'    //     ]);',
'',
'    // }',
'    // else{',
'    quantity = Number(quantity) + Number(grid_model.getValue(record,"QUANTITY") ? grid_model.getValue(record,"QUANTITY") :0);',
'    percentage = Number(percentage) + Number(grid_model.getValue(record,"PERCENTAGE") ? grid_model.getValue(record,"PERCENTAGE") :0)',
'',
'    // }',
'}',
')',
'',
'if (!(apex.item(''P14_WIP_LINE_COUNT'').getValue())){',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'    {',
'        type:       "error",',
'        location:   "page",',
'        message:    "Please select a source line to perform Split or Transfer!",',
'        unsafe:     false',
'    }',
']);',
'}',
'else{',
'   if (!(apex.item(''P14_JUSTIFICATION'').getValue()))',
'   {',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'    {',
'        type:       "error",',
'        location:   ["page","inline"],',
'        pageItem:   "P14_JUSTIFICATION",',
'        message:    "Justification cannot be Empty!",',
'        unsafe:     false',
'    }',
']);',
'}',
'else if (quantity == 0 && percentage == 0){',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'    {',
'        type:       "error",',
'        location:   ["page"],',
'        message:    "Either Quantity or Percentage should be added!",',
'        unsafe:     false',
'    }]);',
'}',
'else if (quantity != 0 && percentage != 0){',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'    {',
'        type:       "error",',
'        location:   ["page"],',
'        message:    "Enter only either Quantity or Percentage!",',
'        unsafe:     false',
'    }]);',
'}',
'else if (quantity > apex.item(''P14_WIP_HOURS_COUNT'').getValue()){',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'    {',
'        type:       "error",',
'        location:   ["page"],',
'        message:    "Quantity cannot be greater than the total hours!",',
'        unsafe:     false',
'    }]);',
'}',
'else if (apex.item(''P14_ACTION_SELECTION'').getValue() == ''ST'' && ',
'            (quantity != apex.item(''P14_WIP_HOURS_COUNT'').getValue() && quantity)',
'            )',
'{',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'    {',
'        type:       "error",',
'        location:   ["page"],',
'        message:    "Quantity should sum up to the total hours for Split and Transfer",',
'        unsafe:     false',
'    }]);',
'}',
'else if (apex.item(''P14_ACTION_SELECTION'').getValue() == ''ST'' && ',
'            (percentage != 100 && percentage)',
'            )',
'{',
'    apex.message.clearErrors();',
'    apex.message.showErrors([',
'    {',
'        type:       "error",',
'        location:   ["page"],',
'        message:    "Percentage total should be 100 for Split and Transfer",',
'        unsafe:     false',
'    }]);',
'}',
'else{',
'    apex.message.clearErrors();',
'    apex.page.submit(''SAVE'');',
'    console.warn = () => {};',
'',
'    }',
'}',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15081270855063450)
,p_name=>'Validating Quantity Based on Action Selected'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(310888108932889181)
,p_triggering_element=>'QUANTITY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15081415876063451)
,p_event_id=>wwv_flow_imp.id(15081270855063450)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var action = apex.item(''P14_ACTION_SELECTION'').getValue();',
'if (action == ''S''){',
'    console.log(apex.item(''P14_WIP_HOURS_COUNT'').getValue());',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16874224948514512)
,p_name=>'On Page Load hide IG buttons'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16874302100514513)
,p_event_id=>wwv_flow_imp.id(16874224948514512)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(310888108932889181)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var actions = apex.region("ProjectSplit").call("getActions");',
'var selected_action = apex.item(''P14_ACTION_SELECTION'').getValue();',
'    // alert(selected_action);',
'if (selected_action == ''T'' ||selected_action == ''S'' ){',
'    // alert(''Hiding'');',
'   apex.region("ProjectSplit").call("getActions").hide("selection-add-row");',
'   apex.region("ProjectSplit").call("getActions").hide("row-add-row");',
'   apex.region("ProjectSplit").call("getActions").hide("row-duplicate");',
'   apex.region("ProjectSplit").call("getActions").hide("row-delete");',
'}',
'',
'// $(''[data-action="selection-add-row"]'').hide();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2132264131777234)
,p_name=>'Loading Projects'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'nvl(:P14_JOB_ALREADY_EXECUTED,''N'') = ''N''',
'and 1=2'))
,p_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2132491630777236)
,p_event_id=>wwv_flow_imp.id(2132264131777234)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setTimer();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2132426016777235)
,p_event_id=>wwv_flow_imp.id(2132264131777234)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if NVL(:P14_JOB_ALREADY_EXECUTED,''N'') = ''N''',
'THEN',
'begin',
'APEX_AUTOMATION.EXECUTE (',
'    p_application_id  => :APP_ID,',
'    p_static_id       => ''get-all-projects'' ',
'    );',
'  :P14_JOB_ALREADY_EXECUTED := ''Y'';    ',
'end;    ',
'END IF;'))
,p_attribute_02=>'P14_JOB_ALREADY_EXECUTED'
,p_attribute_03=>'P14_JOB_ALREADY_EXECUTED'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2132569581777237)
,p_event_id=>wwv_flow_imp.id(2132264131777234)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'endTimer();'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4860873072091608)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear the Project Split Lines'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from xxgpms_project_split ',
'where  session_id = v(''APP_SESSION'');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(4225526031455667)
,p_internal_uid=>18845736195685305
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4225339559455665)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(310888108932889181)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Load the GRID data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(4225526031455667)
,p_internal_uid=>9759523564138032
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(16874019831514510)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update the Action'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'update XXGPMS_PROJECT_SPLIT',
'set    ACTION = decode(:P14_ACTION_SELECTION,''S'',''SPLIT'',''T'',''TRANSFER'',''ST'',''MULTI_SPLIT_TRANS'')',
'where  SESSION_ID = V(''APP_SESSION'');',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(4225526031455667)
,p_internal_uid=>30858882955108207
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4225014446455662)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Identify the Action'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_count number;',
'begin  ',
'if :P14_WIP_LINE_COUNT > 1 ',
'then',
'  :P14_ACTION := ''Transfer'';',
'else',
'    -- Check if there are multiple Projects Selected ',
'    select count(*)',
'    into   v_count',
'    from   xxgpms_project_split ',
'    where  session_id = v(''APP_SESSION'')',
'    group  by project_number',
'    having count(*)>1;',
'    --  If there are multiple projects, then check if the quantity is entered',
'    if v_count >1 ',
'    then',
'      null;',
'    end if;',
'',
'',
'end if;',
'end;  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>9759848677138035
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4225403679455666)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Call REST'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  V_RESPONSE VARCHAR2(4000);',
'  V_RESPONSE_CODE NUMBER;',
'BEGIN',
'--   for i in (select * from xxgpms_project_split ',
'--             where session_id = v(''APP_SESSION''))',
'--   loop',
'  :P14_WIP_EXPIDS := TRIM(BOTH ''-'' FROM :P14_WIP_EXPIDS);',
'   XX_GPMS.PERFORM_SPLIT_TRANSFER(',
'   P_EXPENDITURE_ITEM_ID => :P14_WIP_EXPIDS,',
'   P_JUSTIFICATION => :P14_JUSTIFICATION,',
'   P_RESPONSE      => V_RESPONSE,',
'   P_RESPONSE_CODE => V_RESPONSE_CODE,',
'   P_SOURCE_PROJECT => :P14_WIP_PROJECT_NUMBER,',
'   P_ACTION => :P14_ACTION_SELECTION,',
'   P_TOTAL_HOURS => :P14_WIP_HOURS_COUNT',
'   );',
'   xx_gpms.wip_debug(3,19000,''After REST Call ''||v_response||'' ''||V_RESPONSE_CODE,'''');',
'  if v_response_code IN (200,201)',
'  then',
'    -- apex_error.add_error (',
'    -- p_message          => v_response,',
'    -- p_display_location => apex_error.c_inline_in_notification );',
'    -- exit;',
'--   else',
'    -- apex_application.g_print_success_message:= v_response;  ',
'       xx_gpms.wip_debug(3,19001,''After REST Call'','''');',
'    :P14_SUCCESS_MESSAGE := V_RESPONSE;',
'  ELSE',
'  xx_gpms.wip_debug(3,19002,''After REST Call'','''');',
'    if v_response is not null ',
'    then',
'      apex_error.add_error (',
'      p_message          => v_response,',
'      p_display_location => apex_error.c_inline_in_notification );',
'    end if;',
'  end if;  ',
'--   end loop; ',
'END;   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(4225526031455667)
,p_process_success_message=>'&P14_SUCCESS_MESSAGE.'
,p_internal_uid=>9759459444138031
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2131616031777227)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_EXECUTION_CHAIN'
,p_process_name=>'Call Projects REST'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'IGNORE'
,p_attribute_09=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RUN_JOBS'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>16116479155370924
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4223959989455651)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get the Actual Project'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  V_COUNT NUMBER;',
'  V_PROJECT_NUMBER VARCHAR2(1000);',
'BEGIN',
'',
'BEGIN',
'  select count(distinct column_value) ',
'  into :P14_PROJECTS_COUNT',
'  from table(',
'     select apex_string.split(:P14_WIP_PROJECT_NUMBER,''~'')',
'     from dual);',
'END;     ',
'',
'  SELECT REGEXP_COUNT(PR,''[^~]+'',1)',
'  INTO   V_COUNT',
'  FROM',
'    (SELECT LTRIM(:P14_WIP_PROJECT_NUMBER,''~'') PR',
'     FROM DUAL);  ',
'    --  :P14_PROJECTS_COUNT := v_count;',
'  IF :P14_PROJECTS_COUNT = 1 ',
'  THEN',
'    SELECT REGEXP_SUBSTR(PR,''[^~]+'',1,1)',
'    INTO   :P14_ACTUAL_PROJECT_NUMBER',
'    FROM',
'      (SELECT LTRIM(:P14_WIP_PROJECT_NUMBER,''~'') PR',
'       FROM DUAL);    ',
'  END IF;  ',
'END;  ',
'',
'BEGIN',
'  select count(distinct column_value) ',
'  into :P14_PROJECTS_COUNT',
'  from table(',
'     select apex_string.split(:P14_WIP_PROJECT_NUMBER,''~'')',
'     from dual);',
'END;     ',
'',
'DECLARE',
'  V_COUNT NUMBER;',
'  V_TASK_NUMBER VARCHAR2(1000);',
'BEGIN',
'--   SELECT REGEXP_COUNT(PR,''[^-]+'',1)',
'--   INTO   V_COUNT',
'--   FROM',
'--     (SELECT LTRIM(:P14_WIP_TASK_NUMBER,''-'') PR',
'--      FROM DUAL);  ',
'',
'  select count(distinct column_value) ',
'  into V_COUNT',
'--   into :P14_WIP_LINE_COUNT',
'  from table(',
'     select apex_string.split(:P14_WIP_TASK_NUMBER,''~'')',
'     from dual);',
'',
'  select count(column_value) ',
'--   into V_COUNT',
'  into :P14_WIP_EXPIDS_COUNT',
'  from table(',
'     select apex_string.split(:P14_WIP_TASK_NUMBER,''~'')',
'     from dual);',
'',
'  IF V_COUNT =1 ',
'  THEN',
'    SELECT REGEXP_SUBSTR(PR,''[^~]+'',1,1)',
'    INTO   :P14_ACTUAL_TASK_NUMBER',
'    FROM',
'      (SELECT LTRIM(:P14_WIP_TASK_NUMBER,''~'') PR',
'       FROM DUAL);',
'  END IF;  ',
'END;  ',
'',
'-- ',
'DELETE FROM XXGPMS_PROJECT_SPLIT ',
'WHERE SESSION_ID = V(''APP_SESSION'');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9760903134138046
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(16873788377514508)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Setting NULL Values'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P0_WIP_AMOUNT is null ',
'then',
'  :P0_WIP_AMOUNT := :P14_WIP_SEL_AMOUNT;',
'end if;  ',
'',
'if :P0_WIP_HOURS is null ',
'then',
'  :P0_WIP_HOURS := :P14_WIP_HOURS_COUNT;',
'end if;  ',
'',
'if :P0_WIP_LINES is null ',
'then',
'  :P0_WIP_LINES := :P14_WIP_LINE_COUNT;',
'end if;  ',
'',
'if :P0_WIP_AMOUNT is not null and :P14_WIP_SEL_AMOUNT is null ',
'then',
'  :P14_WIP_SEL_AMOUNT := :P0_WIP_AMOUNT;',
'end if;  ',
'',
'if :P0_WIP_HOURS is not null and :P14_WIP_HOURS_COUNT is null ',
'then',
'  :P14_WIP_HOURS_COUNT := :P0_WIP_HOURS;',
'end if;  ',
'',
'if :P0_WIP_LINES is not null and :P14_WIP_LINE_COUNT is null  ',
'then',
'  :P14_WIP_LINE_COUNT := :P0_WIP_LINES;',
'end if;  '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>30858651501108205
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2132048164777232)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Execute the Automation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if NVL(:P14_JOB_ALREADY_EXECUTED,''N'') = ''N''',
'THEN',
'begin',
'APEX_AUTOMATION.EXECUTE (',
'    p_application_id  => :APP_ID,',
'    p_static_id       => ''get-all-projects'' ',
'    );',
'  :P14_JOB_ALREADY_EXECUTED := ''Y'';    ',
'end;    ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>16116911288370929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4126953956831889)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Percentage_for_the_progress'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select percentage,message',
'into   :P0_PROGRESS_BAR2, :P0_PROGRESS_MESSAGE',
'from   progress_bar_entries',
'where  module = ''TRANSFER_SPLIT''',
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
,p_internal_uid=>18111817080425586
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2131676030777228)
,p_process_sequence=>10
,p_parent_process_id=>wwv_flow_imp.id(2131616031777227)
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'New'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'XX_GPMS'
,p_attribute_04=>'GET_ALL_MATTERS'
,p_internal_uid=>16116539154370925
);
wwv_flow_imp.component_end;
end;
/
