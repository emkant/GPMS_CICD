prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'GPMS Narrative Billing'
,p_alias=>'PBA'
,p_step_title=>'Review and Edit WIP'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message = ''"DELETE_CONFIRM_MSG"'';',
'var actualSelectedRecords = { ''expids'': [] };',
'',
'',
'function validateEmail(emailAdress) {',
'    let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;',
'    if (emailAdress.match(regexEmail)) {',
'        return true;',
'    } else {',
'        return false;',
'    }',
'}',
'',
'async function hideCol(){ ',
'  let gridView = apex.region("ProjectCosts").call("getViews").grid;',
'    gridView.view$.grid("hideColumn", "RAW_COST_RATE");',
'    gridView.view$.grid("hideColumn", "TRANSACTION_COST");',
'    gridView.view$.grid("hideColumn", "NON_LABOUR_RESOURCE_NAME");',
'    gridView.view$.grid("hideColumn", "PROJECT_CURRENCY_CODE");',
'',
'}',
'',
'async function viewCol(){ ',
'  let gridView = apex.region("ProjectCosts").call("getViews").grid;',
'    gridView.view$.grid("showColumn", "RAW_COST_RATE");',
'    gridView.view$.grid("showColumn", "TRANSACTION_COST");',
'    gridView.view$.grid("showColumn", "NON_LABOUR_RESOURCE_NAME");',
'    gridView.view$.grid("showColumn", "PROJECT_CURRENCY_CODE");',
'',
'',
'',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'init_page2();',
'',
'apex.jQuery(function() {',
'  apex.theme42.util.configAPEXMsgs({',
'    autoDismiss: true,',
'    duration: 8000  // duration is optional (Default is 3000 milliseconds)',
'  });',
'});',
'',
'hideCol();',
'',
'// $("#ProjectCosts .t-Region-headerItems--title").append($("#P2_REPORT_SELECTION"));'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.ui-dialog',
'{',
'    width: 950px!important;',
'    overflow: hidden;',
'}',
'',
'.t-BadgeList-wrap',
'{',
'    height: -webkit-fill-available;',
'}',
'',
'/* .t-PageBody{',
'    font-family: "Oracle Sans",-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Oxygen,Ubuntu,Cantarell,"Fira Sans","Droid Sans","Helvetica Neue",sans-serif;',
'} */',
'',
'.apex-item-option .u-radio{',
'    font-size: small !important;',
'}',
'',
'#ProjectCosts .a-GV-w-hdr{',
'    overflow-x: auto !important;',
'}',
'',
'.t-AVPList-label',
'{',
'    width: auto!important;',
'}',
'',
'.totalParent{',
'    display: inline-grid;',
'    border: 1px solid white;',
'    flex-flow: row;',
'    width: 25px;',
'    height: 25px;',
'    border-radius: 50%;',
'    margin-left: 10px;',
'    color: white;',
'    background-color: #676363;',
'}',
'',
'.linkedProjects{',
'    display: flex;',
'    justify-content: center;',
'    align-items: center;',
'}'))
,p_step_template=>wwv_flow_imp.id(294381461312717094)
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4226800401455680)
,p_plug_name=>'Review WIP Details Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>150
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21728131049658027)
,p_plug_name=>'Select the type of Report'
,p_parent_plug_id=>wwv_flow_imp.id(4226800401455680)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:t-ButtonRegion--noBorder:margin-bottom-md'
,p_region_attributes=>'style="box-shadow:none"'
,p_plug_template=>wwv_flow_imp.id(294396995483717102)
,p_plug_display_sequence=>160
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(295455358557053551)
,p_plug_name=>'WIP Detail'
,p_region_name=>'ProjectCosts'
,p_parent_plug_id=>wwv_flow_imp.id(4226800401455680)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294406416430717109)
,p_plug_display_sequence=>170
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  PROJECT_ID,',
'       PROJECT_NUMBER,',
'       BILLABLE_FLAG,',
'       TASK_ID,',
'       TASK_NUMBER,',
'       PROJECT_STATUS_CODE,',
'       PROJECT_NAME,',
'       EXPENDITURE_ITEM_ID,',
'       EXPENDITURE_ITEM_DATE,',
'       REVENUE_RECOGNIZED_FLAG,',
'       BILL_HOLD_FLAG,',
'       QUANTITY,',
'       PROJFUNC_RAW_COST,',
'       RAW_COST_RATE,',
'       PROJFUNC_BURDENED_COST,',
'       BURDEN_COST_RATE,',
'       INVOICED_FLAG,',
'       REVENUE_HOLD_FLAG,',
'       ACCT_CURRENCY_CODE,',
'       ACCT_RAW_COST,',
'       ACCT_BURDENED_COST,',
'       TASK_BILLABLE_FLAG,',
'       TASK_START_DATE,',
'       TASK_COMPLETION_DATE,',
'       PROJECT_START_DATE,',
'       TASK_NAME,',
'       SESSION_ID,',
'       EXTERNAL_BILL_RATE,',
'       INTERNAL_COMMENT,',
'       NARRATIVE_BILLING_OVERFLOW,',
'       TOTAL_AMOUNT,',
'       EXPENDITURE_COMMENT EXPENDITURE_COMMENT,',
'       NVL(EXPENDITURE_COMMENT,NARRATIVE_BILLING_OVERFLOW) EXPENDITURE_COMMENT_TASK,',
'       INITCAP(UNIT_OF_MEASURE) UNIT_OF_MEASURE,',
'       FIRST_NAME,',
'       LAST_NAME,',
'       PERSON_NAME,',
'       EXPENDITURE_TYPE_NAME,',
'       EXPENDITURE_CATEGORY_NAME,',
'       PROJECT_BILL_RATE_ATTR,',
'       REALIZED_BILL_RATE_ATTR,',
'       STANDARD_BILL_RATE_ATTR,',
'       EVENT_ATTR,',
'       PROJECT_BILL_RATE_AMT,',
'       REALIZED_BILL_RATE_AMT,',
'       STANDARD_BILL_RATE_AMT,       ',
'       BU_NAME,',
'       BU_ID,',
'       JOB_NAME,',
'       JOB_ID,',
'       SYSTEM_LINKAGE_FUNCTION,',
'       CST_INVOICE_SUBMITTED_COUNT,',
'       ORIG_TRANSACTION_REFERENCE,',
'       DOCUMENT_NAME,',
'       DOC_ENTRY_NAME,',
'       CREATION_DATE,',
'       CREATED_BY,',
'       LAST_UPDATE_DATE,',
'       LAST_UPDATED_BY,',
'       CONTRACT_NUMBER,',
'       LINE_NUMBER,',
'       BILLING_INSTRUCTIONS,',
'       DRAFT_INVOICE_NUMBER,',
'       INVOICE_STATUS_CODE,',
'       TRANSFER_STATUS_CODE,',
'       event_ATTR EVENT_AT,',
'       nlr_org_id,',
'       WIP_CATEGORY,',
'       RAW_COST_RATE * QUANTITY TRANSACTION_COST,',
'       NON_LABOUR_RESOURCE_NAME,',
'       PROJECT_CURRENCY_CODE,',
'       TOP_TASK_NUMBER,',
'       DESCRIPTION,',
'       BILL_SET_NUM,',
'       TRANSACTION_SOURCE',
'    --    case when ((PROJECT_BILL_RATE_ATTR = 0 or REALIZED_BILL_RATE_ATTR = 0) --and BILLABLE_FLAG = ''Y''',
'    --    )',
'    --    then ''highlightRow''',
'    --    end as highlight_row ',
'  from XXGPMS_PROJECT_COSTS',
' where SESSION_ID = V(''SESSION'')',
' AND NVL(DRAFT_INVOICE_NUMBER,-999) = NVL(:P2_DRAFT_NUMBER,NVL(DRAFT_INVOICE_NUMBER,-999))',
' and  project_number = COALESCE(:P2_PROJECT_NUMBER,project_number)',
' and  WIP_CATEGORY = NVL(:P2_REPORT_SELECTION,WIP_CATEGORY)',
'--  and  ((:P2_REPORT_SELECTION = ''F'' and  person_name is not null and nlr_org_id is null) or ',
'--  (:P2_REPORT_SELECTION = ''SC'' and nlr_org_id is not null) or',
'--  (:P2_REPORT_SELECTION = ''HC'' and person_name is null and nlr_org_id is null) or',
'--  (:P2_REPORT_SELECTION is null)',
'--  )',
'--  and  contract_number = NVL(:P2_AGREEMENT_NUMBER,contract_number)'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P2_DRAFT_NUMBER,P2_AGREEMENT_NUMBER,P2_PROJECT_NUMBER,P2_REPORT_SELECTION'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'WIP Detail'
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
,p_plug_customized=>'1'
,p_plug_customized_name=>'Public Report'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(4226978786455682)
,p_name=>'EXPENDITURE_COMMENT_TASK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_COMMENT_TASK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Expenditure Comment'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>770
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(4861150082091611)
,p_name=>'TRANSACTION_SOURCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANSACTION_SOURCE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Transaction Source'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>780
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(9054153403988813)
,p_name=>'TOP_TASK_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOP_TASK_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Top Task Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>740
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(15670696920406514)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>750
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(15670766706406515)
,p_name=>'BILL_SET_NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILL_SET_NUM'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Bill Set Num'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>760
,p_value_alignment=>'RIGHT'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(21728471091658031)
,p_name=>'NLR_ORG_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NLR_ORG_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nlr Org Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>690
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(21728720145658033)
,p_name=>'WIP_CATEGORY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WIP_CATEGORY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'WIP Category'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>700
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(21729327906658039)
,p_name=>'NON_LABOUR_RESOURCE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NON_LABOUR_RESOURCE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Non Labour Resource Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>710
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_imp.id(21729389478658040)
,p_name=>'PROJECT_CURRENCY_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_CURRENCY_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Project Currency Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>720
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_imp.id(27134923802421046)
,p_name=>'TRANSACTION_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANSACTION_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Transaction Cost'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>730
,p_value_alignment=>'RIGHT'
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(37332503212710313)
,p_name=>'DRAFT_INVOICE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRAFT_INVOICE_NUMBER'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Draft Invoice Number'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>650
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(37332550744710314)
,p_name=>'INVOICE_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INVOICE_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Draft Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>660
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(37332685586710315)
,p_name=>'TRANSFER_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANSFER_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Transfer Status Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>670
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(37770341953699908)
,p_name=>'EVENT_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_AT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Additional Reviewer'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>680
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(79469459384090602)
,p_name=>'CONTRACT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CONTRACT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Agreement'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>620
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(79469620323090603)
,p_name=>'LINE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINE_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Line Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>630
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>500
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
 p_id=>wwv_flow_imp.id(79469645387090604)
,p_name=>'BILLING_INSTRUCTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILLING_INSTRUCTIONS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Billing Instructions'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>640
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_imp.id(285023020034613561)
,p_name=>'STANDARD_BILL_RATE_ATTR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STANDARD_BILL_RATE_ATTR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Standard Rate'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>24
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_imp.id(285023182058613562)
,p_name=>'PROJECT_BILL_RATE_ATTR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_BILL_RATE_ATTR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Agreement Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>340
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>24
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_imp.id(285023289671613563)
,p_name=>'REALIZED_BILL_RATE_ATTR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REALIZED_BILL_RATE_ATTR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Real. Rate'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_imp.id(285027056059613601)
,p_name=>'PROJECT_BILL_RATE_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_BILL_RATE_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Agreement Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>360
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>24
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
 p_id=>wwv_flow_imp.id(285027158260613602)
,p_name=>'STANDARD_BILL_RATE_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STANDARD_BILL_RATE_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Standard Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>370
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>24
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
 p_id=>wwv_flow_imp.id(285027250905613603)
,p_name=>'REALIZED_BILL_RATE_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REALIZED_BILL_RATE_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Fee Allocation'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>380
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>24
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
 p_id=>wwv_flow_imp.id(285027353158613604)
,p_name=>'EXTERNAL_BILL_RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXTERNAL_BILL_RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>390
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(287980819975240472)
,p_name=>'JOB_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOB_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Title'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_imp.id(287982276599240486)
,p_name=>'SYSTEM_LINKAGE_FUNCTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SYSTEM_LINKAGE_FUNCTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(294119390519181151)
,p_name=>'NARRATIVE_BILLING_OVERFLOW'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NARRATIVE_BILLING_OVERFLOW'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Invoice Narrative'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(294211947160415300)
,p_name=>'INTERNAL_COMMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INTERNAL_COMMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Internal Comments'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(295456059322053558)
,p_name=>'TASK_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Task Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_item_width=>11
,p_is_required=>false
,p_max_length=>25
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'TASK_NUMBER'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295456395151053562)
,p_name=>'EXPENDITURE_ITEM_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_ITEM_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Expenditure Item Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(295456514845053563)
,p_name=>'REVENUE_RECOGNIZED_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REVENUE_RECOGNIZED_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rev Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(295456569809053564)
,p_name=>'BILL_HOLD_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILL_HOLD_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Billable Hold'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(295456675067053565)
,p_name=>'QUANTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'FM9999990.0'
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
 p_id=>wwv_flow_imp.id(295456793376053566)
,p_name=>'PROJFUNC_RAW_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJFUNC_RAW_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295456875320053567)
,p_name=>'RAW_COST_RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RAW_COST_RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Raw Cost Rate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295456992785053568)
,p_name=>'PROJFUNC_BURDENED_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJFUNC_BURDENED_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295457152007053569)
,p_name=>'BURDEN_COST_RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BURDEN_COST_RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295457208608053570)
,p_name=>'INVOICED_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INVOICED_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Inv Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(295457322358053571)
,p_name=>'REVENUE_HOLD_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REVENUE_HOLD_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295457421130053572)
,p_name=>'ACCT_CURRENCY_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCT_CURRENCY_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Currency'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(295457500883053573)
,p_name=>'ACCT_RAW_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCT_RAW_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295457609480053574)
,p_name=>'ACCT_BURDENED_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCT_BURDENED_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295457750804053575)
,p_name=>'BILLABLE_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILLABLE_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Billable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
,p_readonly_condition_type=>'EXPRESSION'
,p_readonly_condition=>'UPPER(:CLIENT) != ''DEV'''
,p_readonly_condition2=>'PLSQL'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295457792537053576)
,p_name=>'TASK_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_START_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295457955339053577)
,p_name=>'TASK_COMPLETION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_COMPLETION_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295458127602053579)
,p_name=>'TASK_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Task Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>250
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
 p_id=>wwv_flow_imp.id(295458192857053580)
,p_name=>'SESSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SESSION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Session Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295477670006097055)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295477823619097056)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295478052143097058)
,p_name=>'EXPENDITURE_ITEM_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_ITEM_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Expenditure Item Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295479386143097072)
,p_name=>'EXPENDITURE_COMMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_COMMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Expenditure Comment'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_imp.id(295479543740097073)
,p_name=>'UNIT_OF_MEASURE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT_OF_MEASURE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'UOM'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295479635898097074)
,p_name=>'PERSON_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PERSON_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Person Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_imp.id(295479678053097075)
,p_name=>'EXPENDITURE_TYPE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_TYPE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Expenditure Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>240
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
 p_id=>wwv_flow_imp.id(295479826908097076)
,p_name=>'EXPENDITURE_CATEGORY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_CATEGORY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Expenditure Category'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>320
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>240
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
 p_id=>wwv_flow_imp.id(312559914672379163)
,p_name=>'EXP_ITEM_KEY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_ATTR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Expenditure Item Key'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_item_width=>20
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(319009390953126959)
,p_name=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'&P0_PROJECT_LABEL. Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>410
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
 p_id=>wwv_flow_imp.id(319009491236126960)
,p_name=>'PROJECT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'&P0_PROJECT_LABEL. Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>420
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
,p_static_id=>'PROJECT_NUMBER'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(319009542321126961)
,p_name=>'TASK_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Task ID'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>430
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
 p_id=>wwv_flow_imp.id(319009694866126962)
,p_name=>'PROJECT_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'&P0_PROJECT_LABEL. Status Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>440
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
 p_id=>wwv_flow_imp.id(319009802237126963)
,p_name=>'PROJECT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'&P0_PROJECT_LABEL.  Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(319009805372126964)
,p_name=>'TASK_BILLABLE_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_BILLABLE_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Task Billable Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>460
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(319009938775126965)
,p_name=>'PROJECT_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_START_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'&P0_PROJECT_LABEL. Start Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>470
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(319010084476126966)
,p_name=>'TOTAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL_AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>480
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
 p_id=>wwv_flow_imp.id(319010185308126967)
,p_name=>'FIRST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FIRST_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'First Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>490
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(319010302550126968)
,p_name=>'LAST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Last Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>500
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(319010340560126969)
,p_name=>'BU_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BU_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bu Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>510
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_imp.id(319010411017126970)
,p_name=>'BU_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BU_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Bu Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>520
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
 p_id=>wwv_flow_imp.id(319010555730126971)
,p_name=>'JOB_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOB_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Job Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>530
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
 p_id=>wwv_flow_imp.id(319010645323126972)
,p_name=>'CST_INVOICE_SUBMITTED_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CST_INVOICE_SUBMITTED_COUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cst Invoice Submitted Count'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>540
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
 p_id=>wwv_flow_imp.id(319010773854126973)
,p_name=>'ORIG_TRANSACTION_REFERENCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORIG_TRANSACTION_REFERENCE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Orig Transaction Reference'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>550
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(319010859909126974)
,p_name=>'DOCUMENT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Document Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>560
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(319010999123126975)
,p_name=>'DOC_ENTRY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_ENTRY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Doc Entry Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>570
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(319011040555126976)
,p_name=>'CREATION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATION_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Creation Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>580
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(319011163022126977)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>590
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(319011276273126978)
,p_name=>'LAST_UPDATE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Last Update Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>600
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(319011332633126979)
,p_name=>'LAST_UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Last Updated By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>610
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(295455518098053553)
,p_internal_uid=>11351658452218603
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'XLSX'
,p_enable_mail_download=>false
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'  options.defaultGridViewOptions = {',
'      pagination: {',
'          loadMore: true',
'      }',
'  };',
'  return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(295461857915087116)
,p_interactive_grid_id=>wwv_flow_imp.id(295455518098053553)
,p_static_id=>'102191'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(295461893207087117)
,p_report_id=>wwv_flow_imp.id(295461857915087116)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(13980424662493820)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(4226978786455682)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>359
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8040783821883220)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>76
,p_column_id=>wwv_flow_imp.id(4861150082091611)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(14040708163534015)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9054153403988813)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15861905227543822)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(15670696920406514)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>204
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15864643921655060)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>75
,p_column_id=>wwv_flow_imp.id(15670766706406515)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(22133983593266009)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>72
,p_column_id=>wwv_flow_imp.id(21728471091658031)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(22150147715679155)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>73
,p_column_id=>wwv_flow_imp.id(21728720145658033)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(22537170920294532)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(21729327906658039)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(22540400036503055)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(21729389478658040)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(22654950021298595)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>74
,p_column_id=>wwv_flow_imp.id(27134923802421046)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36306547559972828)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(79469459384090602)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36386619342270886)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(79469620323090603)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36413707414628425)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>70
,p_column_id=>wwv_flow_imp.id(79469645387090604)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37711123429038416)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(37332503212710313)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37712028408038423)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(37332550744710314)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37712907559038426)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>71
,p_column_id=>wwv_flow_imp.id(37332685586710315)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37965915270873384)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(37770341953699908)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(284104248777840389)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(295479543740097073)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(284104772480850232)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(295479635898097074)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(284105403512850234)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(295479678053097075)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(284105833541850235)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(295479826908097076)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(285033467758148350)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(285023020034613561)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(285034672982178454)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(285023182058613562)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(285035117611184680)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(285023289671613563)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(285534161560193332)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(285027056059613601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(285534616386226037)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(285027158260613602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(285535928702230805)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(285027250905613603)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(285537094437285991)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(285027353158613604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(289062444686007816)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(287980819975240472)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>117
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(289176461144365739)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(287982276599240486)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(294124706021187329)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(294211947160415300)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(294125178947187333)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(294119390519181151)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>287
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(294167208173403249)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(295479386143097072)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>335
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295462420965087124)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(295456059322053558)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295462934880087132)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(295456395151053562)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>179
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295463393652087136)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(295456514845053563)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295463883207087138)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(295456569809053564)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295464418299087139)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(295456675067053565)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295464865835087142)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(295456793376053566)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295465427446087143)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(295456875320053567)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295465848964087145)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(295456992785053568)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295466355142087147)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(295457152007053569)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295466856839087148)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(295457208608053570)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295467330442087150)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(295457322358053571)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295467770245087152)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(295457421130053572)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295468327004087153)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(295457500883053573)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295468857530087155)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(295457609480053574)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295469265717087157)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(295457750804053575)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295469822802087158)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(295457792537053576)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295470352615087160)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(295457955339053577)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295470849940087162)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(295458127602053579)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>182
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295471321678087163)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(295458192857053580)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295502564109456778)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(295477670006097055)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295511293074490645)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(295478052143097058)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>164
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313489658368438792)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(312559914672379163)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319015388845130943)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(319009390953126959)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319016299055130946)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(319009491236126960)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>145
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319017131096130948)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(319009542321126961)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>164
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319018060242130950)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(319009694866126962)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319018905972130952)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(319009802237126963)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>152
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319019840836130955)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(319009805372126964)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319020740610130956)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(319009938775126965)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319021607009130959)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>56
,p_column_id=>wwv_flow_imp.id(319010084476126966)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319022548088130961)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>57
,p_column_id=>wwv_flow_imp.id(319010185308126967)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319023438603130963)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>58
,p_column_id=>wwv_flow_imp.id(319010302550126968)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319024395965130965)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>59
,p_column_id=>wwv_flow_imp.id(319010340560126969)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319025301890130967)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>60
,p_column_id=>wwv_flow_imp.id(319010411017126970)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319026104994130969)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>61
,p_column_id=>wwv_flow_imp.id(319010555730126971)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319027095071130971)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>62
,p_column_id=>wwv_flow_imp.id(319010645323126972)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319027997355130973)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>63
,p_column_id=>wwv_flow_imp.id(319010773854126973)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319028899661130975)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>64
,p_column_id=>wwv_flow_imp.id(319010859909126974)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319029753698130977)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>65
,p_column_id=>wwv_flow_imp.id(319010999123126975)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319030587901130980)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>66
,p_column_id=>wwv_flow_imp.id(319011040555126976)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319031431280130982)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>67
,p_column_id=>wwv_flow_imp.id(319011163022126977)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319032325453130984)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>68
,p_column_id=>wwv_flow_imp.id(319011276273126978)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(319033283784130986)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_display_seq=>69
,p_column_id=>wwv_flow_imp.id(319011332633126979)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(274754500069003303)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_execution_seq=>10
,p_name=>'Non-Billable'
,p_background_color=>'#FADFE5'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(295457750804053575)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'N'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(274752173780995460)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(285027158260613602)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(274753364189996124)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(285027056059613601)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(274754549362997297)
,p_view_id=>wwv_flow_imp.id(295461893207087117)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(285027250905613603)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(313942898617497407)
,p_interactive_grid_id=>wwv_flow_imp.id(295455518098053553)
,p_name=>'Simplified'
,p_static_id=>'99406'
,p_type=>'ALTERNATIVE'
,p_default_view=>'GRID'
,p_authorization_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(313942933909497408)
,p_report_id=>wwv_flow_imp.id(313942898617497407)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(32521748865944306)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9054153403988813)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(34342945929954113)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(15670696920406514)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>204
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(34345684624065351)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>74
,p_column_id=>wwv_flow_imp.id(15670766706406515)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(40615024295676300)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>71
,p_column_id=>wwv_flow_imp.id(21728471091658031)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(40631188418089446)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>72
,p_column_id=>wwv_flow_imp.id(21728720145658033)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(41018211622704823)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(21729327906658039)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(41021440738913346)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(21729389478658040)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(41135990723708886)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>73
,p_column_id=>wwv_flow_imp.id(27134923802421046)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(54787588262383119)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(79469459384090602)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(54867660044681177)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(79469620323090603)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(54894748117038716)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>69
,p_column_id=>wwv_flow_imp.id(79469645387090604)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56192164131448707)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(37332503212710313)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56193069110448714)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(37332550744710314)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56193948261448717)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>70
,p_column_id=>wwv_flow_imp.id(37332685586710315)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(56446955973283675)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(37770341953699908)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(302585289480250680)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(295479543740097073)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(302585813183260523)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(295479635898097074)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(302586444215260525)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(295479678053097075)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(302586874244260526)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(295479826908097076)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(303514508460558641)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(285023020034613561)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(303515713684588745)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(285023182058613562)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(303516158313594971)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(285023289671613563)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(304015202262603623)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(285027056059613601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(304015657088636328)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(285027158260613602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(304016969404641096)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(285027250905613603)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(304018135139696282)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(285027353158613604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(307543485388418107)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(287980819975240472)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>117
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(307657501846776030)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(287982276599240486)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(312605746723597620)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(294211947160415300)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(312606219649597624)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(294119390519181151)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>287
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(312648248875813540)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(295479386143097072)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>335
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313943461667497415)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(295456059322053558)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313943975582497423)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(295456395151053562)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>179
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313944434354497427)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(295456514845053563)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313944923909497429)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(295456569809053564)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313945459001497430)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(295456675067053565)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313945906537497433)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(295456793376053566)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313946468148497434)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(295456875320053567)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313946889666497436)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(295456992785053568)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313947395844497438)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(295457152007053569)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313947897541497439)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(295457208608053570)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313948371144497441)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(295457322358053571)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313948810947497443)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(295457421130053572)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313949367706497444)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(295457500883053573)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313949898232497446)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(295457609480053574)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313950306419497448)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(295457750804053575)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313950863504497449)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(295457792537053576)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313951393317497451)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(295457955339053577)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313951890642497453)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(295458127602053579)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>182
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313952362380497454)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(295458192857053580)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313983604811867069)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(295477670006097055)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313992333776900936)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(295478052143097058)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>164
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(331970699070849083)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(312559914672379163)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337496429547541234)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(319009390953126959)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337497339757541237)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(319009491236126960)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>145
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337498171798541239)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(319009542321126961)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>164
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337499100944541241)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(319009694866126962)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337499946674541243)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(319009802237126963)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>152
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337500881538541246)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(319009805372126964)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337501781312541247)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(319009938775126965)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337502647711541250)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(319010084476126966)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337503588790541252)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>56
,p_column_id=>wwv_flow_imp.id(319010185308126967)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337504479305541254)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>57
,p_column_id=>wwv_flow_imp.id(319010302550126968)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337505436667541256)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>58
,p_column_id=>wwv_flow_imp.id(319010340560126969)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337506342592541258)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>59
,p_column_id=>wwv_flow_imp.id(319010411017126970)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337507145696541260)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>60
,p_column_id=>wwv_flow_imp.id(319010555730126971)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337508135773541262)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>61
,p_column_id=>wwv_flow_imp.id(319010645323126972)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337509038057541264)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>62
,p_column_id=>wwv_flow_imp.id(319010773854126973)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337509940363541266)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>63
,p_column_id=>wwv_flow_imp.id(319010859909126974)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337510794400541268)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>64
,p_column_id=>wwv_flow_imp.id(319010999123126975)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337511628603541271)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>65
,p_column_id=>wwv_flow_imp.id(319011040555126976)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337512471982541273)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>66
,p_column_id=>wwv_flow_imp.id(319011163022126977)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337513366155541275)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>67
,p_column_id=>wwv_flow_imp.id(319011276273126978)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(337514324486541277)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_display_seq=>68
,p_column_id=>wwv_flow_imp.id(319011332633126979)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(293235540771413594)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_execution_seq=>10
,p_name=>'Non-Billable'
,p_background_color=>'#FADFE5'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(295457750804053575)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'N'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(293233214483405751)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(285027158260613602)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(293234404892406415)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(285027056059613601)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(293235590065407588)
,p_view_id=>wwv_flow_imp.id(313942933909497408)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(285027250905613603)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(324103416220945436)
,p_interactive_grid_id=>wwv_flow_imp.id(295455518098053553)
,p_name=>'By Task'
,p_static_id=>'101606'
,p_type=>'ALTERNATIVE'
,p_default_view=>'GRID'
,p_authorization_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(324103451512945437)
,p_report_id=>wwv_flow_imp.id(324103416220945436)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(13984747306593691)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(4226978786455682)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>276
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(42682266469392335)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9054153403988813)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44503463533402142)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(15670696920406514)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>204
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(44506202227513380)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>75
,p_column_id=>wwv_flow_imp.id(15670766706406515)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(50775541899124329)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>72
,p_column_id=>wwv_flow_imp.id(21728471091658031)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(50791706021537475)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>73
,p_column_id=>wwv_flow_imp.id(21728720145658033)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51178729226152852)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(21729327906658039)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51181958342361375)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(21729389478658040)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51296508327156915)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>74
,p_column_id=>wwv_flow_imp.id(27134923802421046)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(64948105865831148)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(79469459384090602)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(65028177648129206)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(79469620323090603)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(65055265720486745)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>70
,p_column_id=>wwv_flow_imp.id(79469645387090604)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(66352681734896736)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(37332503212710313)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(66353586713896743)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(37332550744710314)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(66354465864896746)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>71
,p_column_id=>wwv_flow_imp.id(37332685586710315)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(66607473576731704)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(37770341953699908)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(312745807083698709)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(295479543740097073)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(312746330786708552)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(295479635898097074)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(312746961818708554)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(295479678053097075)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(312747391847708555)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(295479826908097076)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313675026064006670)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(285023020034613561)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313676231288036774)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(285023182058613562)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(313676675917043000)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(285023289671613563)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314175719866051652)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(285027056059613601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314176174692084357)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(285027158260613602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314177487008089125)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(285027250905613603)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314178652743144311)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(285027353158613604)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(317704002991866136)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(287980819975240472)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(317818019450224059)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(287982276599240486)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(322766264327045649)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(294211947160415300)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(322766737253045653)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(294119390519181151)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>287
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(322808766479261569)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(295479386143097072)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>335
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324103979270945444)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(295456059322053558)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324104493185945452)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(295456395151053562)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>179
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324104951957945456)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(295456514845053563)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324105441512945458)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(295456569809053564)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324105976604945459)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(295456675067053565)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324106424140945462)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(295456793376053566)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324106985751945463)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(295456875320053567)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324107407269945465)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(295456992785053568)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324107913447945467)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(295457152007053569)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324108415144945468)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(295457208608053570)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324108888747945470)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(295457322358053571)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324109328550945472)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(295457421130053572)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324109885309945473)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(295457500883053573)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324110415835945475)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(295457609480053574)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324110824022945477)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(295457750804053575)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324111381107945478)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(295457792537053576)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324111910920945480)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(295457955339053577)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324112408245945482)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(295458127602053579)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>182
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324112879983945483)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(295458192857053580)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324144122415315098)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(295477670006097055)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(324152851380348965)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(295478052143097058)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>164
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(342131216674297112)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(312559914672379163)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347656947150989263)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(319009390953126959)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347657857360989266)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(319009491236126960)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>145
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347658689401989268)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(319009542321126961)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>164
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347659618547989270)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(319009694866126962)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347660464277989272)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(319009802237126963)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>152
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347661399141989275)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(319009805372126964)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347662298915989276)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(319009938775126965)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347663165314989279)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>56
,p_column_id=>wwv_flow_imp.id(319010084476126966)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347664106393989281)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>57
,p_column_id=>wwv_flow_imp.id(319010185308126967)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347664996908989283)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>58
,p_column_id=>wwv_flow_imp.id(319010302550126968)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347665954270989285)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>59
,p_column_id=>wwv_flow_imp.id(319010340560126969)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347666860195989287)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>60
,p_column_id=>wwv_flow_imp.id(319010411017126970)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347667663299989289)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>61
,p_column_id=>wwv_flow_imp.id(319010555730126971)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347668653376989291)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>62
,p_column_id=>wwv_flow_imp.id(319010645323126972)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347669555660989293)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>63
,p_column_id=>wwv_flow_imp.id(319010773854126973)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347670457966989295)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>64
,p_column_id=>wwv_flow_imp.id(319010859909126974)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347671312003989297)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>65
,p_column_id=>wwv_flow_imp.id(319010999123126975)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347672146206989300)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>66
,p_column_id=>wwv_flow_imp.id(319011040555126976)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347672989585989302)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>67
,p_column_id=>wwv_flow_imp.id(319011163022126977)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347673883758989304)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>68
,p_column_id=>wwv_flow_imp.id(319011276273126978)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(347674842089989306)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_display_seq=>69
,p_column_id=>wwv_flow_imp.id(319011332633126979)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(303396058374861623)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_execution_seq=>10
,p_name=>'Non-Billable'
,p_background_color=>'#FADFE5'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(295457750804053575)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'N'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(303393732086853780)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(285027158260613602)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(303394922495854444)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(285027056059613601)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(303396107668855617)
,p_view_id=>wwv_flow_imp.id(324103451512945437)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(285027250905613603)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(335681333723944902)
,p_plug_name=>'Find and Replace Narrative'
,p_region_name=>'find_replace'
,p_parent_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_region_css_classes=>'changeWidth'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs:margin-top-none:margin-bottom-none:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_imp.id(294415908052717114)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(276835019938554494)
,p_plug_name=>'Spell Checker Results'
,p_region_name=>'spell_check_region'
,p_parent_plug_id=>wwv_flow_imp.id(335681333723944902)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EXP_ITEM_ID,ERROR_WORD,NARRATIVE,ID,',
'''''ADD_TO_DICTIONARY,',
''''' IGNORE,',
''''' REMOVE',
'FROM SPELL_CHECKER_DTL SCD',
'WHERE NOT EXISTS (SELECT 1 ',
'FROM SPELL_CHECK_EXCEPTIONS SCE',
'WHERE 1=1',
'AND (DTL_ID = SCD.ID',
'AND   EXCEPTION_TYPE = ''I'')',
'OR (SCE.DTL_ID = SCD.ID',
'AND EXCEPTION_TYPE = ''P''',
'AND USER_EMAIL = :P2_SAAS_USER)',
'OR (1=1--SCE.DTL_ID = SCD.ID',
'AND EXCEPTION_TYPE = ''D''',
'AND INSTR(SCD.NARRATIVE,SCE.WORD)>0));',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P2_SAAS_USER'
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
 p_id=>wwv_flow_imp.id(37770962379699914)
,p_name=>'EXP_ITEM_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXP_ITEM_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Exp Item Id'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(37771071728699915)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(41326803962208490)
,p_name=>'REMOVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMOVE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Global Dictionary'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'wrap-cols'
,p_link_target=>'javascript:javascript:apex.event.trigger(document, ''removeButtonClicked'', [{P2_EXP_ID:''&ID.''}]);void(0);'
,p_link_text=>'<span aria-hidden="true" class="fa fa-globe fam-plus fam-is-success"></span>'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(276838225606554526)
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
 p_id=>wwv_flow_imp.id(276838432585554528)
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
,p_item_width=>30
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT val D, VAL R from SPELL_CHECKER_DTL, xmltable(''/root/e/text()'' passing XMLTYPE(''<root><e>''',
'  || REPLACE(Suggested_Words,'','',''</e><e>'')',
'  || ''</e></root>'') columns val VARCHAR2(50) path ''/'' )',
'WHERE EXP_ITEM_ID = :EXP_ITEM_ID',
'AND   UPPER(TRIM(ERROR_WORD)) = UPPER(TRIM(:ERROR_WORD))',
'ORDER BY 1',
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
 p_id=>wwv_flow_imp.id(279743159213405488)
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
 p_id=>wwv_flow_imp.id(279746625226405523)
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
,p_link_text=>'<span aria-hidden="true" class="fa fa-database-x fam-plus fam-is-success"></span>'
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
 p_id=>wwv_flow_imp.id(280339449592789832)
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
,p_link_text=>'<span aria-hidden="true" class="fa fa-ban fam-information fam-is-warning"></span>'
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
 p_id=>wwv_flow_imp.id(276838050045554524)
,p_internal_uid=>46714330750681138
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>true
,p_requires_filter=>false
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_imp.id(279338428332646578)
,p_interactive_grid_id=>wwv_flow_imp.id(276838050045554524)
,p_static_id=>'492148'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>1000
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(279338635561646578)
,p_report_id=>wwv_flow_imp.id(279338428332646578)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(26897654273658611)
,p_view_id=>wwv_flow_imp.id(279338635561646578)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(37770962379699914)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(26899055154658615)
,p_view_id=>wwv_flow_imp.id(279338635561646578)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(37771071728699915)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(41424152760692462)
,p_view_id=>wwv_flow_imp.id(279338635561646578)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(41326803962208490)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(279340110418646590)
,p_view_id=>wwv_flow_imp.id(279338635561646578)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(276838225606554526)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(279344030323683357)
,p_view_id=>wwv_flow_imp.id(279338635561646578)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(276838432585554528)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(279951082286752221)
,p_view_id=>wwv_flow_imp.id(279338635561646578)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(279743159213405488)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>231
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(280034901714976398)
,p_view_id=>wwv_flow_imp.id(279338635561646578)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(279746625226405523)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>59
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(280837485773749182)
,p_view_id=>wwv_flow_imp.id(279338635561646578)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(280339449592789832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(276837764988554521)
,p_plug_name=>'Find and Replace sub Region'
,p_parent_plug_id=>wwv_flow_imp.id(335681333723944902)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294395967304717101)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(295458260805053581)
,p_plug_name=>'Fixed Fees and Adjustments'
,p_region_name=>'ProjectEvents'
,p_parent_plug_id=>wwv_flow_imp.id(4226800401455680)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294406416430717109)
,p_plug_display_sequence=>190
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PROJECT_ID,',
'       PROJECT_NUMBER,',
'       PROJECT_STATUS_CODE,',
'       PROJECT_NAME,',
'       EVENT_ID,',
'       EVENT_NUM,',
'       EVENT_TYPE_CODE,',
'       BILL_TRNS_AMOUNT,',
'       BILL_TRNS_CURRENCY_CODE,',
'       BILL_HOLD_FLAG,',
'       REVENUE_HOLD_FLAG,',
'       INVOICE_CURRENCY_CODE,',
'       TASK_BILLABLE_FLAG,',
'       TASK_START_DATE,',
'       TASK_COMPLETION_DATE,',
'       TASK_NUMBER,',
'       INVOICEDSTATUS,',
'       TASK_NAME,',
'       PROJECT_START_DATE,',
'       EVNT_COMPLETION_DATE,',
'       SESSION_ID,',
'       EVENT_DESC,',
'       EVENT_INTERNAL_COMMENT,',
'       CONTRACT_NUMBER,',
'       CONTRACT_LINE_NUMBER,',
'       BUSINESS_UNIT_NAME,',
'       ORGANIZATION_NAME,',
'       CONTRACT_TYPE_NAME,',
'       EVENT_TYPE_NAME,',
'       FUSION_FLAG,',
'       EVNT_INVOICE_SUBMITTED_COUNT,',
'       COMMITTEE_APPROVAL_REQUIRED,',
'       CREATION_DATE,',
'       CREATED_BY,',
'       LAST_UPDATE_DATE,',
'       LAST_UPDATED_BY,',
'       WIP_EVENT_TAG,',
'       DRAFT_INVOICE_NUMBER,',
'       INVOICE_STATUS_CODE,',
'       TRANSFER_STATUS_CODE,',
'       WIP_CATEGORY,',
'       EXPENDITURE_TYPE,',
'       BILL_SET_NUM',
'  from XXGPMS_PROJECT_EVENTS',
' where SESSION_ID = V(''APP_SESSION'')',
' and   contract_number = NVL(:P2_AGREEMENT_NUMBER,CONTRACT_NUMBER)',
' and   project_number = NVL(:P2_PROJECT_NUMBER,project_number)',
' AND NVL(DRAFT_INVOICE_NUMBER,-999) = NVL(:P2_DRAFT_NUMBER,NVL(DRAFT_INVOICE_NUMBER,-999))',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P2_PROJECT_NUMBER,P2_AGREEMENT_NUMBER,P2_DRAFT_NUMBER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(2694331713079738)
,p_name=>'BILL_SET_NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILL_SET_NUM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Bill Set Num'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>470
,p_value_alignment=>'RIGHT'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15671216670406520)
,p_name=>'EXPENDITURE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Expenditure Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>460
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_imp.id(27133192185421029)
,p_name=>'WIP_CATEGORY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WIP_CATEGORY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'WIP Category'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(37768422401699888)
,p_name=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Project Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(37768520273699889)
,p_name=>'PROJECT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'&P0_PROJECT_LABEL. Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_imp.id(37768574854699890)
,p_name=>'PROJECT_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Project Status Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(37768697480699891)
,p_name=>'PROJECT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Project Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(37768833781699892)
,p_name=>'EVENT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Event Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>290
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
 p_id=>wwv_flow_imp.id(37768887000699893)
,p_name=>'PROJECT_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_START_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Project Start Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'CENTER'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(37768959369699894)
,p_name=>'BUSINESS_UNIT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BUSINESS_UNIT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Business Unit Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_imp.id(37769060312699895)
,p_name=>'ORGANIZATION_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORGANIZATION_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Organization Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>320
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(37769192949699896)
,p_name=>'CONTRACT_TYPE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CONTRACT_TYPE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Contract Type Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>330
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(37769327336699897)
,p_name=>'EVENT_TYPE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_TYPE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Event Type Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>340
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(37769438654699898)
,p_name=>'FUSION_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FUSION_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fusion Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>350
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_imp.id(37769490649699899)
,p_name=>'EVNT_INVOICE_SUBMITTED_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVNT_INVOICE_SUBMITTED_COUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Evnt Invoice Submitted Count'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>360
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
 p_id=>wwv_flow_imp.id(37769546199699900)
,p_name=>'COMMITTEE_APPROVAL_REQUIRED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMITTEE_APPROVAL_REQUIRED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Committee Approval Required'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1
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
 p_id=>wwv_flow_imp.id(37769701841699901)
,p_name=>'CREATION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATION_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Creation Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>380
,p_value_alignment=>'CENTER'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(37769771626699902)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(37769926316699903)
,p_name=>'LAST_UPDATE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Last Update Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>400
,p_value_alignment=>'CENTER'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(37770016629699904)
,p_name=>'LAST_UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Last Updated By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>410
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(37770120398699905)
,p_name=>'DRAFT_INVOICE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRAFT_INVOICE_NUMBER'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Draft Invoice Number'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>420
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
 p_id=>wwv_flow_imp.id(37770234620699906)
,p_name=>'INVOICE_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INVOICE_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Invoice Status Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>430
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(37770287257699907)
,p_name=>'TRANSFER_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANSFER_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Transfer Status Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>440
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(286623457670252159)
,p_name=>'CONTRACT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CONTRACT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Agreement'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(286623561534252160)
,p_name=>'CONTRACT_LINE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CONTRACT_LINE_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(286624127763252166)
,p_name=>'EVNT_ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(287164473688877070)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(287164536734877071)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(294120571250181163)
,p_name=>'EVENT_INTERNAL_COMMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_INTERNAL_COMMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Internal Comment'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(294120680333181164)
,p_name=>'EVENT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(295459065349053589)
,p_name=>'EVENT_NUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_NUM'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Event Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295459170149053590)
,p_name=>'EVENT_TYPE_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_TYPE_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295459311109053591)
,p_name=>'BILL_TRNS_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILL_TRNS_AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'FML999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(295459378059053592)
,p_name=>'BILL_TRNS_CURRENCY_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILL_TRNS_CURRENCY_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Currency'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(295459553312053593)
,p_name=>'BILL_HOLD_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILL_HOLD_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bill Hold Flag'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(295459639793053594)
,p_name=>'REVENUE_HOLD_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REVENUE_HOLD_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Revenue Hold Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(295459711278053595)
,p_name=>'INVOICE_CURRENCY_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INVOICE_CURRENCY_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Invoice Currency Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(295459832197053596)
,p_name=>'TASK_BILLABLE_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_BILLABLE_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Billable'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(295459923301053597)
,p_name=>'TASK_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_START_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295460009373053598)
,p_name=>'TASK_COMPLETION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_COMPLETION_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(295460094151053599)
,p_name=>'TASK_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Task Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(295460201944053600)
,p_name=>'INVOICEDSTATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INVOICEDSTATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Invoiced Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(295477276351097051)
,p_name=>'TASK_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Task Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(295477496317097053)
,p_name=>'EVNT_COMPLETION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVNT_COMPLETION_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(295477652153097054)
,p_name=>'SESSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SESSION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Session Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(312559661299379160)
,p_name=>'WIP_EVENT_TAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WIP_EVENT_TAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Expenditure Item Key'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>64
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(295458483243053583)
,p_internal_uid=>11354623597218633
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>true
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(295483252155106909)
,p_interactive_grid_id=>wwv_flow_imp.id(295458483243053583)
,p_static_id=>'185038'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(295483357939106909)
,p_report_id=>wwv_flow_imp.id(295483252155106909)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5090615305239153)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(2694331713079738)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(15886675862525454)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(15671216670406520)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37774938867701601)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(37768422401699888)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37776294168701605)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(37768520273699889)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37777681793701610)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(37768574854699890)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37779067341701614)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(37768697480699891)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>247
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37780511427701617)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(37768833781699892)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37781893754701620)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(37768887000699893)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37783308701701623)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(37768959369699894)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>269
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37784734599701626)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(37769060312699895)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>286
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37786071468701629)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(37769192949699896)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>276
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37787537738701632)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(37769327336699897)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>183
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37788875731701636)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(37769438654699898)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37790247357701640)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(37769490649699899)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>197
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37791699816701643)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(37769546199699900)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>202
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37793091753701647)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(37769701841699901)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37794487670701651)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(37769771626699902)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37795931575701654)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(37769926316699903)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37797335852701657)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(37770016629699904)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37798692330701660)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(37770120398699905)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37800089315701663)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(37770234620699906)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37801482816701666)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(37770287257699907)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>185
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(40909739840810348)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(27133192185421029)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(286628784015260485)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(286623457670252159)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(286629234258260489)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(286623561534252160)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(293255569360490111)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(287164473688877070)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(294186440256865720)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(294120571250181163)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>330
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(294186868438865722)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(294120680333181164)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>342
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295483814184106911)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(295459065349053589)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295484354546106913)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(295459170149053590)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295484782782106914)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(295459311109053591)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295485325207106916)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(295459378059053592)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295485826051106918)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(295459553312053593)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295486310568106919)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(295459639793053594)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295486851437106921)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(295459711278053595)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>147
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295487289600106922)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(295459832197053596)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295487809339106924)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(295459923301053597)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110.303
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295488270407106925)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(295460009373053598)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145.303
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295488815938106927)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(295460094151053599)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295489285036106928)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(295460201944053600)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295489786458106930)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(295477276351097051)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>167
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295490310802106931)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(295477496317097053)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(295490802992106933)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(295477652153097054)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>152
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(312566074052180096)
,p_view_id=>wwv_flow_imp.id(295483357939106909)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(312559661299379160)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6502866609171640)
,p_plug_name=>'Review and Edit WIP'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useRegionTitle:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(294432830406717122)
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6502951789171641)
,p_plug_name=>'Review WIP Details'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useRegionTitle'
,p_plug_template=>wwv_flow_imp.id(294432830406717122)
,p_plug_display_sequence=>140
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9055770686988829)
,p_plug_name=>'Billing &P0_PROJECT_LABEL.s<span class="totalParent"><span class="linkedProjects">&P2_LINKED_PROJECTS_COUNT.</span></span>'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(294406416430717109)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'        PROJECT_NAME,',
'        BU_NAME,',
'        LEGAL_ENTITY_NAME,',
'        CURRENCY_CODE,',
'        CUSTOMER_NAME,',
'        NVL(RETAINER_BALANCE,',
'        0) RETAINER_BALANCE,',
'        CONTRACT_ID ,',
'        CONTRACT_NUMBER,',
'        PROJECT_NUMBER,',
'        EBILL_MATTER_ID,',
'        TAX_REGISTRATION_TYPE,',
'        TAX_REGISTRATION_NUMBER,',
'        TAX_REGISTRATION_COUNTRY,',
'        CONTRACT_OFFICE,',
'        ORGANIZATION_NAME,',
'        BILL_CUSTOMER_NAME,',
'        BILL_CUSTOMER_ACCT,',
'        BILL_CUSTOMER_SITE,',
'        CLIENT_NUMBER',
'      FROM',
'        XXGPMS_PROJECT_CONTRACT',
'      WHERE',
'        CONTRACT_NUMBER = NVL(:P2_AGREEMENT_NUMBER,CONTRACT_NUMBER)',
'      AND PROJECT_NUMBER = NVL(:P2_PROJECT_NUMBER,PROJECT_NUMBER)',
'      AND SESSION_ID = V(''APP_SESSION'')  '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P2_AGREEMENT_NUMBER,P2_PROJECT_NUMBER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Billing &P0_PROJECT_LABEL.s<span class="totalParent"><span class="linkedProjects">&P2_LINKED_PROJECTS_COUNT.</span></span>'
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
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(15669665657406504)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'EMMANUEL.KANT@FRONTERACONSULTING.NET'
,p_internal_uid=>15669665657406504
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15669773393406505)
,p_db_column_name=>'PROJECT_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'&P0_PROJECT_LABEL.  Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15670590777406513)
,p_db_column_name=>'PROJECT_NUMBER'
,p_display_order=>20
,p_column_identifier=>'I'
,p_column_label=>'&P0_PROJECT_LABEL.  Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15669895873406506)
,p_db_column_name=>'BU_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Business Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15669931510406507)
,p_db_column_name=>'LEGAL_ENTITY_NAME'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Legal Entity Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15670098023406508)
,p_db_column_name=>'CURRENCY_CODE'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Currency Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15670112502406509)
,p_db_column_name=>'CUSTOMER_NAME'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Customer Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'UPPER(:CLIENT) = ''MAPLES'''
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15670243291406510)
,p_db_column_name=>'RETAINER_BALANCE'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Retainer Balance'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15670376920406511)
,p_db_column_name=>'CONTRACT_ID'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Contract Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15670439735406512)
,p_db_column_name=>'CONTRACT_NUMBER'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Contract Number'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15670881258406516)
,p_db_column_name=>'EBILL_MATTER_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Ebilling Matter ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15670955258406517)
,p_db_column_name=>'TAX_REGISTRATION_TYPE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Tax Registration Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15671034298406518)
,p_db_column_name=>'TAX_REGISTRATION_NUMBER'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Tax Registration Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15671122187406519)
,p_db_column_name=>'TAX_REGISTRATION_COUNTRY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Tax Registration Country'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15671465763406522)
,p_db_column_name=>'ORGANIZATION_NAME'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Organization'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15671577005406523)
,p_db_column_name=>'BILL_CUSTOMER_NAME'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Bill Customer Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15671602756406524)
,p_db_column_name=>'BILL_CUSTOMER_ACCT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Bill Customer Account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15671724710406525)
,p_db_column_name=>'BILL_CUSTOMER_SITE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Bill Customer Site'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15672473623406532)
,p_db_column_name=>'CONTRACT_OFFICE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Contract Office'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'UPPER(:CLIENT)= ''MAPLES'''
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15672586713406533)
,p_db_column_name=>'CLIENT_NUMBER'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Client Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'UPPER(:CLIENT) != ''MAPLES'''
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(15701003852586952)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'157011'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'PROJECT_NUMBER:PROJECT_NAME:BU_NAME:CONTRACT_OFFICE:ORGANIZATION_NAME:CUSTOMER_NAME:BILL_CUSTOMER_NAME:BILL_CUSTOMER_ACCT:BILL_CUSTOMER_SITE:EBILL_MATTER_ID:TAX_REGISTRATION_COUNTRY:TAX_REGISTRATION_NUMBER:TAX_REGISTRATION_TYPE:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26558255826945606)
,p_plug_name=>'Fees'
,p_region_name=>'Fees'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294406416430717109)
,p_plug_display_sequence=>180
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PROJECT_ID,',
'       PROJECT_NUMBER,',
'       BILLABLE_FLAG,',
'       TASK_ID,',
'       TASK_NUMBER,',
'       PROJECT_STATUS_CODE,',
'       PROJECT_NAME,',
'       EXPENDITURE_ITEM_ID,',
'       EXPENDITURE_ITEM_DATE,',
'       REVENUE_RECOGNIZED_FLAG,',
'       BILL_HOLD_FLAG,',
'       QUANTITY,',
'       PROJFUNC_RAW_COST,',
'       RAW_COST_RATE,',
'       PROJFUNC_BURDENED_COST,',
'       BURDEN_COST_RATE,',
'       INVOICED_FLAG,',
'       REVENUE_HOLD_FLAG,',
'       ACCT_CURRENCY_CODE,',
'       ACCT_RAW_COST,',
'       ACCT_BURDENED_COST,',
'       TASK_BILLABLE_FLAG,',
'       TASK_START_DATE,',
'       TASK_COMPLETION_DATE,',
'       PROJECT_START_DATE,',
'       TASK_NAME,',
'       SESSION_ID,',
'       EXTERNAL_BILL_RATE,',
'       INTERNAL_COMMENT,',
'       NARRATIVE_BILLING_OVERFLOW,',
'       TOTAL_AMOUNT,',
'       EXPENDITURE_COMMENT,',
'       UNIT_OF_MEASURE,',
'       FIRST_NAME,',
'       LAST_NAME,',
'       PERSON_NAME,',
'       EXPENDITURE_TYPE_NAME,',
'       EXPENDITURE_CATEGORY_NAME,',
'       PROJECT_BILL_RATE_ATTR,',
'       REALIZED_BILL_RATE_ATTR,',
'       STANDARD_BILL_RATE_ATTR,',
'       EVENT_ATTR,',
'       PROJECT_BILL_RATE_AMT,',
'       REALIZED_BILL_RATE_AMT,',
'       STANDARD_BILL_RATE_AMT,       ',
'       BU_NAME,',
'       BU_ID,',
'       JOB_NAME,',
'       JOB_ID,',
'       SYSTEM_LINKAGE_FUNCTION,',
'       CST_INVOICE_SUBMITTED_COUNT,',
'       ORIG_TRANSACTION_REFERENCE,',
'       DOCUMENT_NAME,',
'       DOC_ENTRY_NAME,',
'       CREATION_DATE,',
'       CREATED_BY,',
'       LAST_UPDATE_DATE,',
'       LAST_UPDATED_BY,',
'       CONTRACT_NUMBER,',
'       LINE_NUMBER,',
'       BILLING_INSTRUCTIONS,',
'       DRAFT_INVOICE_NUMBER,',
'       INVOICE_STATUS_CODE,',
'       TRANSFER_STATUS_CODE,',
'       event_ATTR EVENT_AT,',
'       nlr_org_id',
'  from XXGPMS_PROJECT_COSTS',
' where SESSION_ID = V(''SESSION'')',
' AND NVL(DRAFT_INVOICE_NUMBER,-999) = NVL(:P2_DRAFT_NUMBER,NVL(DRAFT_INVOICE_NUMBER,-999))',
' and  project_number = COALESCE(:P2_PROJECT_NUMBER,project_number)',
' and  ((:P2_REPORT_SELECTION = ''F'' and  person_name is not null and nlr_org_id is null) or ',
' (:P2_REPORT_SELECTION = ''SC'' and nlr_org_id is not null) or',
' (:P2_REPORT_SELECTION = ''HC'' and person_name is null and nlr_org_id is null) or',
' (:P2_REPORT_SELECTION is null)',
' )',
'--  and  contract_number = NVL(:P2_AGREEMENT_NUMBER,contract_number)'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P2_DRAFT_NUMBER,P2_AGREEMENT_NUMBER,P2_PROJECT_NUMBER,P2_REPORT_SELECTION'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Fees'
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
,p_plug_customized=>'1'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(21725173123657998)
,p_name=>'PROJECT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'&P0_PROJECT_LABEL. Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>410
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
 p_id=>wwv_flow_imp.id(21725331933657999)
,p_name=>'TASK_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Task Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>420
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
 p_id=>wwv_flow_imp.id(21725369447658000)
,p_name=>'PROJECT_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'&P0_PROJECT_LABEL. Status Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>430
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
 p_id=>wwv_flow_imp.id(21725552405658001)
,p_name=>'PROJECT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'&P0_PROJECT_LABEL.  Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>440
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21725641257658002)
,p_name=>'TASK_BILLABLE_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_BILLABLE_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Task Billable Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(21725755799658003)
,p_name=>'PROJECT_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_START_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'&P0_PROJECT_LABEL. Start Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>460
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(21725803972658004)
,p_name=>'TOTAL_AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL_AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>470
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
 p_id=>wwv_flow_imp.id(21725935773658005)
,p_name=>'FIRST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FIRST_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'First Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>480
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21725985614658006)
,p_name=>'LAST_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Last Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>490
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21726078661658007)
,p_name=>'BU_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BU_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Bu Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>500
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_imp.id(21726236042658008)
,p_name=>'BU_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BU_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Bu Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>510
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
 p_id=>wwv_flow_imp.id(21726284176658009)
,p_name=>'JOB_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOB_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Job Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>520
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
 p_id=>wwv_flow_imp.id(21726434241658010)
,p_name=>'CST_INVOICE_SUBMITTED_COUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CST_INVOICE_SUBMITTED_COUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cst Invoice Submitted Count'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>530
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
 p_id=>wwv_flow_imp.id(21726535840658011)
,p_name=>'ORIG_TRANSACTION_REFERENCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORIG_TRANSACTION_REFERENCE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Orig Transaction Reference'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>540
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21726569099658012)
,p_name=>'DOCUMENT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Document Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>550
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21726703965658013)
,p_name=>'DOC_ENTRY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_ENTRY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Doc Entry Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>560
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21726767080658014)
,p_name=>'CREATION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATION_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Creation Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>570
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(21726927377658015)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>580
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21727024975658016)
,p_name=>'LAST_UPDATE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Last Update Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>590
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(21727083418658017)
,p_name=>'LAST_UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Last Updated By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>600
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21727258669658018)
,p_name=>'CONTRACT_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CONTRACT_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Agreement'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>610
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21727359294658019)
,p_name=>'LINE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINE_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Line Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>620
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21727421527658020)
,p_name=>'BILLING_INSTRUCTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILLING_INSTRUCTIONS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Billing Instructions'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>630
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_imp.id(21727479346658021)
,p_name=>'DRAFT_INVOICE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRAFT_INVOICE_NUMBER'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Draft Invoice Number'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>640
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(21727633840658022)
,p_name=>'INVOICE_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INVOICE_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Draft Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>650
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(21727751609658023)
,p_name=>'TRANSFER_STATUS_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANSFER_STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Transfer Status Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>660
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(21727790016658024)
,p_name=>'EVENT_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_AT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Additional Reviewer'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>670
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(21728021721658026)
,p_name=>'NLR_ORG_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NLR_ORG_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nlr Org Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>680
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_static_id=>'NLR_ORG_ID'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26558425538945608)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26558464455945609)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26558634921945610)
,p_name=>'EXPENDITURE_ITEM_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_ITEM_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Expenditure Item Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26558697032945611)
,p_name=>'TASK_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Task Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_item_width=>11
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
 p_id=>wwv_flow_imp.id(26558831157945612)
,p_name=>'TASK_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Task Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>250
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
 p_id=>wwv_flow_imp.id(26558882715945613)
,p_name=>'EXP_ITEM_KEY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EVENT_ATTR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Expenditure Item Key'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_item_width=>20
,p_is_required=>false
,p_max_length=>100
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
 p_id=>wwv_flow_imp.id(26559019532945614)
,p_name=>'EXPENDITURE_ITEM_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_ITEM_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Expenditure Item Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(26559115089945615)
,p_name=>'QUANTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'FM9999990.0'
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
 p_id=>wwv_flow_imp.id(26559213641945616)
,p_name=>'RAW_COST_RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RAW_COST_RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26559301540945617)
,p_name=>'PROJFUNC_RAW_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJFUNC_RAW_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26559388205945618)
,p_name=>'BURDEN_COST_RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BURDEN_COST_RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26559526042945619)
,p_name=>'PROJFUNC_BURDENED_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJFUNC_BURDENED_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26559575123945620)
,p_name=>'BILL_HOLD_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILL_HOLD_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Billable Hold'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(26559749764945621)
,p_name=>'INVOICED_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INVOICED_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Inv Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(26559834490945622)
,p_name=>'REVENUE_RECOGNIZED_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REVENUE_RECOGNIZED_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rev Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(26559943672945623)
,p_name=>'REVENUE_HOLD_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REVENUE_HOLD_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26560022232945624)
,p_name=>'ACCT_CURRENCY_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCT_CURRENCY_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Currency'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(26560067603945625)
,p_name=>'ACCT_RAW_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCT_RAW_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26560251138945626)
,p_name=>'ACCT_BURDENED_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCT_BURDENED_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26560317726945627)
,p_name=>'BILLABLE_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILLABLE_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Billable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(26560452087945628)
,p_name=>'INTERNAL_COMMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INTERNAL_COMMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Internal Comments'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(26560509853945629)
,p_name=>'NARRATIVE_BILLING_OVERFLOW'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NARRATIVE_BILLING_OVERFLOW'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Invoice Narrative'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(26560570092945630)
,p_name=>'TASK_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_START_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26560760080945631)
,p_name=>'TASK_COMPLETION_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_COMPLETION_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26560853121945632)
,p_name=>'SESSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SESSION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Session Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26560884442945633)
,p_name=>'PERSON_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PERSON_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Person Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_imp.id(26561043677945634)
,p_name=>'JOB_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOB_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Title'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_imp.id(26561129656945635)
,p_name=>'EXPENDITURE_COMMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_COMMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26561249115945636)
,p_name=>'UNIT_OF_MEASURE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT_OF_MEASURE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'UOM'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(26561317251945637)
,p_name=>'EXPENDITURE_TYPE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_TYPE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Expenditure Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>240
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
 p_id=>wwv_flow_imp.id(26561442351945638)
,p_name=>'EXPENDITURE_CATEGORY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXPENDITURE_CATEGORY_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Expenditure Category'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>240
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
 p_id=>wwv_flow_imp.id(26561500839945639)
,p_name=>'STANDARD_BILL_RATE_ATTR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STANDARD_BILL_RATE_ATTR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Standard Rate'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>24
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_imp.id(26561606397945640)
,p_name=>'PROJECT_BILL_RATE_ATTR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_BILL_RATE_ATTR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Agreement Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>330
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>24
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_imp.id(26561711979945641)
,p_name=>'REALIZED_BILL_RATE_ATTR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REALIZED_BILL_RATE_ATTR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Real. Rate'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>340
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_imp.id(26561803960945642)
,p_name=>'PROJECT_BILL_RATE_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_BILL_RATE_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Agreement Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>350
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>24
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
 p_id=>wwv_flow_imp.id(26561903381945643)
,p_name=>'STANDARD_BILL_RATE_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STANDARD_BILL_RATE_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Standard Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>360
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>24
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
 p_id=>wwv_flow_imp.id(26562020377945644)
,p_name=>'REALIZED_BILL_RATE_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REALIZED_BILL_RATE_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Fee Allocation'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>370
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>24
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
 p_id=>wwv_flow_imp.id(26562130164945645)
,p_name=>'EXTERNAL_BILL_RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EXTERNAL_BILL_RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>380
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26562207200945646)
,p_name=>'SYSTEM_LINKAGE_FUNCTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SYSTEM_LINKAGE_FUNCTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
,p_value_alignment=>'LEFT'
,p_attribute_02=>'VALUE'
,p_attribute_05=>'PLAIN'
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
 p_id=>wwv_flow_imp.id(26562286198945647)
,p_name=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'&P0_PROJECT_LABEL. Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>400
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(26558330594945607)
,p_internal_uid=>12573467471351910
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>true
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'XLSX'
,p_enable_mail_download=>false
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(21731136476662951)
,p_interactive_grid_id=>wwv_flow_imp.id(26558330594945607)
,p_static_id=>'77463'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(21731283140662952)
,p_report_id=>wwv_flow_imp.id(21731136476662951)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21731792051662959)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(26558425538945608)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21733100130662968)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(26558634921945610)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21734027856662971)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(26558697032945611)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21734905995662974)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(26558831157945612)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21735816195662977)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(26558882715945613)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21736683106662980)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(26559019532945614)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21737607640662982)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(26559115089945615)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21738775410662985)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(26559213641945616)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21739697734662988)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(26559301540945617)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21740620187662990)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(26559388205945618)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21741512211662993)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(26559526042945619)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21742436453662996)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(26559575123945620)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21743327339662998)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(26559749764945621)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21744213644663001)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(26559834490945622)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21745128598663003)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(26559943672945623)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21746057737663006)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(26560022232945624)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21746890979663008)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(26560067603945625)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21747859631663011)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(26560251138945626)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21748680250663013)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(26560317726945627)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21749568946663016)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(26560452087945628)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21750465128663019)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(26560509853945629)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21751371299663021)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(26560570092945630)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21752305564663024)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(26560760080945631)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21753245933663026)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(26560853121945632)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21754061010663029)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(26560884442945633)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21754881906663032)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(26561043677945634)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21755858110663034)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(26561129656945635)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21756665506663037)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(26561249115945636)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21757582023663039)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(26561317251945637)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21758518626663042)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(26561442351945638)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21759403846663045)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(26561500839945639)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21760320067663047)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(26561606397945640)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21761192191663050)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(26561711979945641)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21762149237663052)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(26561803960945642)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21762965071663055)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(26561903381945643)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21763919763663058)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(26562020377945644)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21764821456663060)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(26562130164945645)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21765701091663063)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(26562207200945646)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21766622104663066)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(26562286198945647)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21767557602663068)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(21725173123657998)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21768438774663072)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(21725331933657999)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21769347819663074)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(21725369447658000)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21770211385663077)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(21725552405658001)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21771066249663079)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(21725641257658002)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21772029716663082)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(21725755799658003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21772951736663085)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(21725803972658004)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21773811662663088)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(21725935773658005)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21774691992663090)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(21725985614658006)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21775644295663093)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(21726078661658007)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21776543134663096)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(21726236042658008)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21777383301663099)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(21726284176658009)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21778328257663101)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(21726434241658010)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21779195446663104)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(21726535840658011)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21780156368663107)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(21726569099658012)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21781015720663109)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(21726703965658013)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21781888004663112)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>56
,p_column_id=>wwv_flow_imp.id(21726767080658014)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21782775301663115)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>57
,p_column_id=>wwv_flow_imp.id(21726927377658015)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21783738859663117)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>58
,p_column_id=>wwv_flow_imp.id(21727024975658016)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21784572384663120)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>59
,p_column_id=>wwv_flow_imp.id(21727083418658017)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21785481360663122)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>60
,p_column_id=>wwv_flow_imp.id(21727258669658018)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21786388309663125)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>61
,p_column_id=>wwv_flow_imp.id(21727359294658019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21787595219663128)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>62
,p_column_id=>wwv_flow_imp.id(21727421527658020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21788390833663130)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>63
,p_column_id=>wwv_flow_imp.id(21727479346658021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21789310647663133)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>64
,p_column_id=>wwv_flow_imp.id(21727633840658022)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21790224267663135)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>65
,p_column_id=>wwv_flow_imp.id(21727751609658023)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(21791161107663138)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>66
,p_column_id=>wwv_flow_imp.id(21727790016658024)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(22124119881453688)
,p_view_id=>wwv_flow_imp.id(21731283140662952)
,p_display_seq=>67
,p_column_id=>wwv_flow_imp.id(21728021721658026)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(182378174571203424)
,p_name=>'Billing Instructions'
,p_region_name=>'billing'
,p_template=>wwv_flow_imp.id(294423457518717117)
,p_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  DISTINCT REPLACE(BILLING_INSTRUCTIONS,'':'',''; '') COMMENT_TEXT,',
'NULL ATTRIBUTE_1,',
'NULL ATTRIBUTE_2,',
'NULL ATTRIBUTE_3,',
'NULL ATTRIBUTE_4,',
'NULL USER_NAME,',
'NULL COMMENT_DATE,',
'NULL ACTIONS,',
'NULL USER_ICON',
'FROM XXGPMS_PROJECT_COSTS ',
'WHERE SESSION_ID = V(''SESSION'')',
'and PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'and contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'and billing_instructions is not null',
'order by REPLACE(BILLING_INSTRUCTIONS,'':'',''; '')'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2_AGREEMENT_NUMBER'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(294457265513717151)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Special Instructions'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  DISTINCT REPLACE(BILLING_INSTRUCTIONS,'':'',''; '') COMMENT_TEXT,',
'--COLUMN_VALUE COMMENT_TEXT,',
'NULL ATTRIBUTE_1,',
'NULL ATTRIBUTE_2,',
'NULL ATTRIBUTE_3,',
'NULL ATTRIBUTE_4,',
'NULL USER_NAME,',
'NULL COMMENT_DATE,',
'NULL ACTIONS,',
'NULL USER_ICON',
'FROM TABLE(APEX_STRING.SPLIT((',
'SELECT DISTINCT BILLING_INSTRUCTIONS',
'FROM   XXGPMS_PROJECT_COSTS ',
'WHERE SESSION_ID = V(''SESSION'')),'':''))',
'ORDER BY 1;'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(79470324378090610)
,p_query_column_id=>1
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>10
,p_column_heading=>'Comment Text'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(79470414556090611)
,p_query_column_id=>2
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>20
,p_column_heading=>'Attribute 1'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(79470536256090612)
,p_query_column_id=>3
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>30
,p_column_heading=>'Attribute 2'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(79470601041090613)
,p_query_column_id=>4
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>40
,p_column_heading=>'Attribute 3'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(79470691694090614)
,p_query_column_id=>5
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>50
,p_column_heading=>'Attribute 4'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(79470742552090615)
,p_query_column_id=>6
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'User Name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(79470854694090616)
,p_query_column_id=>7
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>70
,p_column_heading=>'Comment Date'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(79470991179090617)
,p_query_column_id=>8
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>80
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(79471040755090618)
,p_query_column_id=>9
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>90
,p_column_heading=>'User Icon'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(281264383984476611)
,p_plug_name=>'Charts'
,p_region_name=>'chart_parent'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26950721042941598)
,p_plug_name=>'Costs by Projects'
,p_region_name=>'Costsbyprojects'
,p_parent_plug_id=>wwv_flow_imp.id(281264383984476611)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(294396995483717102)
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(26950815479941599)
,p_region_id=>wwv_flow_imp.id(26950721042941598)
,p_chart_type=>'bar'
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(26950881738941600)
,p_chart_id=>wwv_flow_imp.id(26950815479941599)
,p_seq=>10
,p_name=>'ResourceProjectCost'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(project_bill_rate_amt) pbra,',
'project_number',
'from  XXGPMS_PROJECT_COSTS',
' where  SESSION_ID = V(''SESSION'')',
' --and PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'and contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'-- and  lower(wip_category) = ''labor''',
'group by project_number;',
''))
,p_ajax_items_to_submit=>'P2_AGREEMENT_NUMBER,P2_PROJECT_NUMBER'
,p_items_value_column_name=>'PBRA'
,p_items_label_column_name=>'PROJECT_NUMBER'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(26558068545945605)
,p_chart_id=>wwv_flow_imp.id(26950815479941599)
,p_seq=>20
,p_name=>'ResourceRealizedCost'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(realized_bill_rate_amt) rbra,',
'project_number',
'from  XXGPMS_PROJECT_COSTS',
' where  SESSION_ID = V(''SESSION'')',
' --and PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'and contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'-- and  lower(wip_category) = ''labor''',
'group by project_number;',
''))
,p_ajax_items_to_submit=>'P2_AGREEMENT_NUMBER,P2_PROJECT_NUMBER'
,p_items_value_column_name=>'RBRA'
,p_items_label_column_name=>'PROJECT_NUMBER'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(26951196820941603)
,p_chart_id=>wwv_flow_imp.id(26950815479941599)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(26951158244941602)
,p_chart_id=>wwv_flow_imp.id(26950815479941599)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(280338074776789818)
,p_plug_name=>'Costs by Employee'
,p_region_name=>'ResourceMetrics1'
,p_parent_plug_id=>wwv_flow_imp.id(281264383984476611)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(294396995483717102)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
end;
/
begin
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(280338129157789819)
,p_region_id=>wwv_flow_imp.id(280338074776789818)
,p_chart_type=>'bar'
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(280338288521789820)
,p_chart_id=>wwv_flow_imp.id(280338129157789819)
,p_static_id=>'proj_costs'
,p_seq=>10
,p_name=>'ResourceProjectCost'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(person_name,''Unassigned'') PERSON_NAME,amt',
'from(',
'select',
'       nvl(trim(PERSON_NAME),''Unassigned'') person_name,',
'       sum(PROJECT_BILL_RATE_AMT) amt',
'  from XXGPMS_PROJECT_COSTS',
' where  SESSION_ID = V(''SESSION'')',
' and PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'and contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'and  lower(wip_category) = ''labor''',
'group by trim(person_name))'))
,p_ajax_items_to_submit=>'P2_AGREEMENT_NUMBER,P2_PROJECT_NUMBER'
,p_items_value_column_name=>'AMT'
,p_items_label_column_name=>'PERSON_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_PERSON_NAME,P7_AGREEMENT_NUMBER,P7_PROJECT_NUMBER:&PERSON_NAME.,&P2_AGREEMENT_NUMBER.,&P2_PROJECT_NUMBER.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(280338413348789821)
,p_chart_id=>wwv_flow_imp.id(280338129157789819)
,p_seq=>20
,p_name=>'ResourceRealizedCost'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(person_name,''Unassigned''),amt',
'from(select',
'       nvl(trim(PERSON_NAME),''Unassigned'') person_name,',
'       sum(REALIZED_BILL_RATE_AMT) amt',
'  from XXGPMS_PROJECT_COSTS',
' where  SESSION_ID = V(''SESSION'')',
' and PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'and contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'and  lower(wip_category) = ''labor''',
'group by trim(person_name))'))
,p_ajax_items_to_submit=>'P2_AGREEMENT_NUMBER,P2_PROJECT_NUMBER'
,p_items_value_column_name=>'AMT'
,p_items_label_column_name=>'NVL(PERSON_NAME,''UNASSIGNED'')'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(280338583225789823)
,p_chart_id=>wwv_flow_imp.id(280338129157789819)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(280338448626789822)
,p_chart_id=>wwv_flow_imp.id(280338129157789819)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(286627128443252196)
,p_plug_name=>'Costs by Timekeeper'
,p_region_name=>'ResourceMetrics'
,p_parent_plug_id=>wwv_flow_imp.id(281264383984476611)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(294396995483717102)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(286627288279252197)
,p_region_id=>wwv_flow_imp.id(286627128443252196)
,p_chart_type=>'bar'
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(286627376368252198)
,p_chart_id=>wwv_flow_imp.id(286627288279252197)
,p_seq=>10
,p_name=>'ResourceProjectCost'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(JOB_NAME,''Unassigned''),amt',
'from(',
'select',
'       nvl(trim(JOB_NAME),''Unassigned'') JOB_NAME,',
'       sum(PROJECT_BILL_RATE_AMT) amt',
'  from XXGPMS_PROJECT_COSTS',
' where  SESSION_ID = V(''SESSION'')',
' and PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'and contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'and  lower(wip_category) = ''labor''',
'group by trim(JOB_NAME))'))
,p_ajax_items_to_submit=>'P2_PROJECT_NUMBER,P2_AGREEMENT_NUMBER'
,p_items_value_column_name=>'AMT'
,p_items_label_column_name=>'NVL(JOB_NAME,''UNASSIGNED'')'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(286627672843252201)
,p_chart_id=>wwv_flow_imp.id(286627288279252197)
,p_seq=>20
,p_name=>'ResourceRealizedCost'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(job_name,''Unassigned''),amt',
'from(select',
'       nvl(trim(job_name),''Unassigned'') job_name,',
'       sum(REALIZED_BILL_RATE_AMT) amt',
'  from XXGPMS_PROJECT_COSTS',
' where  SESSION_ID = V(''SESSION'')',
' and PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'and contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'and  lower(wip_category) = ''labor''',
'group by trim(job_name))'))
,p_ajax_items_to_submit=>'P2_PROJECT_NUMBER,P2_AGREEMENT_NUMBER'
,p_items_value_column_name=>'AMT'
,p_items_label_column_name=>'NVL(JOB_NAME,''UNASSIGNED'')'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(286627585702252200)
,p_chart_id=>wwv_flow_imp.id(286627288279252197)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(286627487535252199)
,p_chart_id=>wwv_flow_imp.id(286627288279252197)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(286627754875252202)
,p_plug_name=>'Unbilled Aging'
,p_region_name=>'OverallMetrics'
,p_parent_plug_id=>wwv_flow_imp.id(281264383984476611)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(294396995483717102)
,p_plug_display_sequence=>100
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(286627845754252203)
,p_region_id=>wwv_flow_imp.id(286627754875252202)
,p_chart_type=>'bar'
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(286627960282252204)
,p_chart_id=>wwv_flow_imp.id(286627845754252203)
,p_seq=>10
,p_name=>'OverallProjectCost30'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''30'' "30",',
'       sum(PROJECT_BILL_RATE_AMT) Amount',
'from XXGPMS_PROJECT_COSTS',
'where 1 = 1',
'  and PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'  and SESSION_ID = V(''SESSION'')',
'  and expenditure_item_date between sysdate-30 and sysdate',
' -- and (invoiced_flag = ''U'' or event_attr is null)',
'--  and  lower(wip_category) = ''labor''',
'  group by 1',
''))
,p_ajax_items_to_submit=>'P2_PROJECT_NUMBER,P2_AGREEMENT_NUMBER'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'30'
,p_color=>'#5DD114'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(287179829396240091)
,p_chart_id=>wwv_flow_imp.id(286627845754252203)
,p_seq=>20
,p_name=>'OverallProjectCost60'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''60'' "60",',
'       sum(PROJECT_BILL_RATE_AMT) Amount',
'from XXGPMS_PROJECT_COSTS',
'where 1 = 1',
'  and PROJECT_NUMBER = :P2_PROJECT_NUMBER',
'  and SESSION_ID = V(''SESSION'')',
'  and expenditure_item_date between sysdate-60 and sysdate-30',
'  --and (invoiced_flag = ''U'' or event_attr is null)',
'--   and  lower(wip_category) = ''labor''',
'  group by 1'))
,p_ajax_items_to_submit=>'P2_PROJECT_NUMBER,P2_AGREEMENT_NUMBER'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'60'
,p_color=>'#B5AC07'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(287179962633240092)
,p_chart_id=>wwv_flow_imp.id(286627845754252203)
,p_seq=>30
,p_name=>'OverallProjectCost90'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''60+'' "60+",',
'       sum(PROJECT_BILL_RATE_AMT) Amount',
'from XXGPMS_PROJECT_COSTS',
'where 1 = 1',
'  and PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'  and SESSION_ID = V(''SESSION'')',
'  and expenditure_item_date < sysdate-60',
'  --and (invoiced_flag = ''U'' or event_attr is null)',
'--   and  lower(wip_category) = ''labor''',
'  group by 1'))
,p_ajax_items_to_submit=>'P2_PROJECT_NUMBER,P2_AGREEMENT_NUMBER'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'60+'
,p_color=>'#E61227'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(287180187921240094)
,p_chart_id=>wwv_flow_imp.id(286627845754252203)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(287180093743240093)
,p_chart_id=>wwv_flow_imp.id(286627845754252203)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(287980977308240473)
,p_name=>'Cost Summary'
,p_region_name=>'CostSummary'
,p_template=>wwv_flow_imp.id(294423457518717117)
,p_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff:t-Report--horizontalBorders:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH PROJEVENTS AS (',
'  SELECT',
'    SUM(BILL_TRNS_AMOUNT) AMT,',
'    WIP_CATEGORY',
'  FROM',
'    XXGPMS_PROJECT_EVENTS XPEV',
'  WHERE',
'    SESSION_ID = V(''APP_SESSION'')',
'    AND NVL(EVENT_TYPE_NAME, ''X'') <> ''WIP Adjustment''',
'    AND XPEV.PROJECT_NUMBER = NVL(:P2_PROJECT_NUMBER, XPEV.PROJECT_NUMBER)',
'    AND XPEV.CONTRACT_NUMBER = NVL(:P2_AGREEMENT_NUMBER, XPEV.CONTRACT_NUMBER)',
'  GROUP BY',
'    WIP_CATEGORY',
')',
'SELECT',
'  X.SORT_ORDER,',
'  X.TYPE,',
'  X.HOURS,',
'  X."Hourly_Fees",',
'  X."Fees"+ NVL((',
'    SELECT',
'      NVL(AMT,',
'      0)',
'    FROM',
'      PROJEVENTS',
'    WHERE',
'      LOWER(WIP_CATEGORY)=''fees''',
'      AND X.TYPE <> ''Adjusted''',
'  ), 0) "Fees",',
'  X."Costs" +NVL((',
'    SELECT',
'      NVL(SUM(AMT), 0)',
'    FROM',
'      PROJEVENTS',
'    WHERE',
'      LOWER(WIP_CATEGORY) IN (''hard costs'', ''soft costs'')',
'      AND X.TYPE <> ''Adjusted''',
'  ),',
'  0) "Costs",',
'  X."Total_Amt" + +NVL((',
'    SELECT',
'      NVL(SUM(AMT), 0)',
'    FROM',
'      PROJEVENTS',
'    WHERE',
'      X.TYPE <> ''Adjusted''',
'  ),',
'  0) "Total_Amt",',
'  X."Selected Amounts"',
'FROM',
'  (',
'    SELECT',
'      1 SORT_ORDER,',
'      ''Worked''                                                                                                          TYPE,',
' -- sum(decode(system_linkage_function,''ST'', quantity,0)) Hours,',
'      SUM(DECODE(UPPER(UNIT_OF_MEASURE), ''HOURS'', QUANTITY, 0))                                                         HOURS,',
'      SUM(DECODE(LOWER(XPC.WIP_CATEGORY), ''labor'', PROJECT_BILL_RATE_AMT, 0))                                           "Hourly_Fees",',
'      SUM(DECODE(LOWER(XPC.WIP_CATEGORY), ''fees'', PROJECT_BILL_RATE_AMT, 0))                                            "Fees",',
'      SUM(DECODE(LOWER(XPC.WIP_CATEGORY), ''hard costs'', PROJECT_BILL_RATE_AMT, ''soft costs'', PROJECT_BILL_RATE_AMT, 0))',
' -- +nvl(sum(decode(lower(projevents.wip_category),''hard costs'', projevents.amt,''soft costs'',projevents.amt,0)),0)',
'      "Costs",',
'      SUM(PROJECT_BILL_RATE_AMT)                                                                                        "Total_Amt",',
'      :R_SELECTED_AMOUNT                                                                                                "Selected Amounts"',
'    FROM',
'      XXGPMS_PROJECT_COSTS XPC',
'    WHERE',
'      1=1',
'      AND XPC.PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER, XPC.PROJECT_NUMBER)',
'      AND XPC.CONTRACT_NUMBER = NVL(:P2_AGREEMENT_NUMBER, XPC.CONTRACT_NUMBER)',
'      AND XPC.SESSION_ID = V(''SESSION'')',
' --and ((:P_UNBILLED_FLAG_T = ''Y'' AND (INVOICE_STATUS_CODE IS NULL OR UPPER(INVOICE_STATUS_CODE) = ''REJECTED''))',
' --OR (:P_UNBILLED_FLAG_T = ''N'' AND (INVOICE_STATUS_CODE IS NOT NULL OR UPPER(INVOICE_STATUS_CODE) <>''REJECTED'')))',
'    UNION',
'    SELECT',
'      2 SORT_ORDER,',
'      ''Adjusted'',',
' -- sum(decode(system_linkage_function,''ST'', project_bill_rate_amt-realized_bill_rate_amt,0)) Fees,',
' -- sum(DECODE(UPPER(UNIT_OF_MEASURE),''HOURS'',quantity,0))',
'      0 HOURS,',
'      SUM(DECODE(LOWER(WIP_CATEGORY), ''labor'', PROJECT_BILL_RATE_AMT, 0))                                               "Hourly_Fees",',
'      SUM(DECODE(LOWER(WIP_CATEGORY), ''fees'', PROJECT_BILL_RATE_AMT-REALIZED_BILL_RATE_AMT, 0))                         FEES,',
' -- sum(decode(lower(WIP_CATEGORY),''fees'', project_bill_rate_amt-realized_bill_rate_amt,0)) Fees,',
' -- sum(decode(system_linkage_function,''ER'', project_bill_rate_amt-realized_bill_rate_amt,''PJ'',project_bill_rate_amt-realized_bill_rate_amt, ''VI'',project_bill_rate_amt-realized_bill_rate_amt, 0)) "Hard Costs",',
' -- sum(decode(lower(WIP_CATEGORY),''hard costs'',project_bill_rate_amt-realized_bill_rate_amt, 0)) "Hard Costs",',
' -- sum(decode(system_linkage_function,''USG'', project_bill_rate_amt-realized_bill_rate_amt, 0)) "Soft Costs",',
' -- sum(decode(lower(WIP_CATEGORY),''soft costs'', project_bill_rate_amt-realized_bill_rate_amt, 0)) "Soft Costs",',
'      SUM(DECODE(LOWER(WIP_CATEGORY), ''hard costs'', PROJECT_BILL_RATE_AMT, ''soft costs'', PROJECT_BILL_RATE_AMT, 0))     "Costs",',
'      SUM(PROJECT_BILL_RATE_AMT-REALIZED_BILL_RATE_AMT)                                                                 "Total_Amt",',
'      :R_AMT_DIFF',
'    FROM',
'      XXGPMS_PROJECT_COSTS',
'    WHERE',
'      1= 1',
'      AND PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER, PROJECT_NUMBER)',
'      AND CONTRACT_NUMBER = NVL(:P2_AGREEMENT_NUMBER, CONTRACT_NUMBER)',
'      AND SESSION_ID = V(''SESSION'')',
'      AND PROJECT_BILL_RATE_AMT-REALIZED_BILL_RATE_AMT >0',
' --and ((:P_UNBILLED_FLAG_T = ''Y'' AND (INVOICE_STATUS_CODE IS NULL OR UPPER(INVOICE_STATUS_CODE) = ''REJECTED''))',
' --OR (:P_UNBILLED_FLAG_T = ''N'' AND (INVOICE_STATUS_CODE IS NOT NULL OR UPPER(INVOICE_STATUS_CODE) <>''REJECTED'')))',
'    UNION',
'    SELECT',
'      3 SORT_ORDER,',
'      ''Total'',',
' -- sum(decode(system_linkage_function,''ST'', quantity,0)),',
' -- sum(decode(system_linkage_function,''ST'', realized_bill_rate_amt,0)) Fees,',
' -- sum(decode(system_linkage_function,''ER'', realized_bill_rate_amt,''PJ'',realized_bill_rate_amt, ''VI'',realized_bill_rate_amt, 0)) "Hard Costs",',
' -- sum(decode(system_linkage_function,''USG'',realized_bill_rate_amt, 0)) "Soft Costs",',
'      SUM(DECODE(UPPER(UNIT_OF_MEASURE), ''HOURS'', QUANTITY, 0))                                                         HOURS,',
'      SUM(DECODE(LOWER(XPC.WIP_CATEGORY), ''labor'', PROJECT_BILL_RATE_AMT, 0))                                           "Hourly_Fees",',
'      SUM(DECODE(LOWER(XPC.WIP_CATEGORY), ''fees'', REALIZED_BILL_RATE_AMT, 0))',
' -- +nvl(sum(decode(lower(projevents.wip_category),''fees'', projevents.amt,0)),0)',
'      "Fees",',
' -- sum(decode(lower(WIP_CATEGORY),''fees'', realized_bill_rate_amt,0)) Fees,',
' -- sum(decode(lower(WIP_CATEGORY),''hard costs'',realized_bill_rate_amt, 0)) "Hard Costs",',
' -- sum(decode(lower(WIP_CATEGORY),''soft costs'', realized_bill_rate_amt, 0)) "Soft Costs",',
'      SUM(DECODE(LOWER(XPC.WIP_CATEGORY), ''hard costs'', PROJECT_BILL_RATE_AMT, ''soft costs'', PROJECT_BILL_RATE_AMT, 0))',
' -- +nvl(sum(decode(lower(projevents.wip_category),''hard costs'', projevents.amt,''soft costs'',projevents.amt,0)),0)',
'      "Costs",',
'      SUM(REALIZED_BILL_RATE_AMT)                                                                                       "Total_Amt",',
'      :R_SELECTED_ADJUSTMENT',
'    FROM',
'      XXGPMS_PROJECT_COSTS XPC',
'    WHERE',
'      1= 1',
'      AND XPC.PROJECT_NUMBER = COALESCE(:P2_PROJECT_NUMBER, XPC.PROJECT_NUMBER)',
'      AND XPC.CONTRACT_NUMBER = NVL(:P2_AGREEMENT_NUMBER, XPC.CONTRACT_NUMBER)',
'      AND SESSION_ID = V(''SESSION'')',
' --and ((:P_UNBILLED_FLAG_T = ''Y'' AND (INVOICE_STATUS_CODE IS NULL OR UPPER(INVOICE_STATUS_CODE) = ''REJECTED''))',
' --OR (:P_UNBILLED_FLAG_T = ''N'' AND (INVOICE_STATUS_CODE IS NOT NULL OR UPPER(INVOICE_STATUS_CODE) <>''REJECTED'')))order by 1',
'  )                    X',
'ORDER BY',
'  SORT_ORDER'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'R_SELECTED_AMOUNT,R_SELECTED_ADJUSTMENT,R_AMT_DIFF,P_UNBILLED_FLAG_T'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(294452312603717148)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0.00'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16676404777673408)
,p_query_column_id=>1
,p_column_alias=>'SORT_ORDER'
,p_column_display_sequence=>80
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16676549195673409)
,p_query_column_id=>2
,p_column_alias=>'TYPE'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(287981139835240475)
,p_query_column_id=>3
,p_column_alias=>'HOURS'
,p_column_display_sequence=>20
,p_column_heading=>'Hours'
,p_use_as_row_header=>'N'
,p_column_format=>'FM9999990.0'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15672179958406529)
,p_query_column_id=>4
,p_column_alias=>'Hourly_Fees'
,p_column_display_sequence=>30
,p_column_heading=>'Hourly Fees'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15672250471406530)
,p_query_column_id=>5
,p_column_alias=>'Fees'
,p_column_display_sequence=>40
,p_column_heading=>'Fees'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15672368464406531)
,p_query_column_id=>6
,p_column_alias=>'Costs'
,p_column_display_sequence=>50
,p_column_heading=>'Costs'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2694230570079737)
,p_query_column_id=>7
,p_column_alias=>'Total_Amt'
,p_column_display_sequence=>60
,p_column_heading=>'Total Amount'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(180945485633300355)
,p_query_column_id=>8
,p_column_alias=>'Selected Amounts'
,p_column_display_sequence=>70
,p_column_heading=>'Selected Amounts'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(287981794763240481)
,p_plug_name=>'SelectedAmts'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(287982630891240490)
,p_name=>'TrustBalance'
,p_region_name=>'TrustBalance'
,p_template=>wwv_flow_imp.id(294395967304717101)
,p_display_sequence=>90
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-md:margin-left-sm'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--float:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'-- NVL(to_char(TRUST_BALANCE,''999,999,999,999.99''),0) "Retainer Balance",',
'  GET_CURRENCY(:G_CURRENCY)||nvl((select to_char(sum(available),''99,99,99,999.99'') from XXGPMS_MATTER_CREDITS where session_id = V(''APP_SESSION'')',
'  ),0) "Retainer Balance",',
'--  NVL(to_char(RETAINER_BALANCE,''99,99,99,999.99''),0) "Trust Balance",',
'  GET_CURRENCY(:G_CURRENCY)||nvl((select to_char(sum(LABOR_WIP)+SUM(fees_wip)+SUM(hard_wip)+SUM(SOFT_WIP),''99,99,99,999.99'') from XXGPMS_INTERPROJECTS where session_id = V(''APP_SESSION'')',
'  ),0) "Trust Balance",',
' (select NVL(round((sum(nvl(realized_bill_rate_amt,0))*100/sum(nvl(project_bill_rate_amt,0))),0),0) || ''%''  ',
'from xxgpms_project_costs',
'where project_number = nvl(:P2_PROJECT_NUMBER,project_number)',
'and   contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'and nvl(project_bill_rate_amt,0) > 0',
'and   SESSION_ID = V(''SESSION'')) "Realised Rate"',
'from XXGPMS_PROJECT_CONTRACT',
'where project_number = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'and   contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'and SESSION_ID = V(''SESSION'')',
'UNION ALL',
'SELECT ''0'' ,''0'',''0%''',
'FROM  DUAL ',
'WHERE NOT EXISTS (SELECT 1 FROM XXGPMS_PROJECT_CONTRACT',
'where project_number = COALESCE(:P2_PROJECT_NUMBER,project_number)',
'and   contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'and SESSION_ID = V(''SESSION''));',
'',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2_TRUST_LABEL,P2_AGREEMENT_NUMBER'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(294435282410717139)
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23037836414582498)
,p_query_column_id=>1
,p_column_alias=>'Retainer Balance'
,p_column_display_sequence=>10
,p_column_heading=>'&P0_RETAINER_LABEL. Balance'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:15::'
,p_column_linktext=>'#Retainer Balance#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23037960273582499)
,p_query_column_id=>2
,p_column_alias=>'Trust Balance'
,p_column_display_sequence=>20
,p_column_heading=>'&P0_TRUST_LABEL. Balance'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:16::'
,p_column_linktext=>'#Trust Balance#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23037989829582500)
,p_query_column_id=>3
,p_column_alias=>'Realised Rate'
,p_column_display_sequence=>30
,p_column_heading=>'Realised Rate'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(294067006529021496)
,p_plug_name=>'Matter Details'
,p_region_name=>'ProjectDetails'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--hiddenOverflow:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>6
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(294520130727727109)
,p_plug_name=>'WIP Adjustment'
,p_region_name=>'wipmanagement'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(294423457518717117)
,p_plug_display_sequence=>20
,p_query_type=>'TABLE'
,p_query_table=>'AXGPMS_PROJECT'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(290579642330216443)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(276837764988554521)
,p_button_name=>'P2_SEARCH_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-31'
,p_icon_css_classes=>'fa-search'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(290580061001216444)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(276837764988554521)
,p_button_name=>'P2_REPLACE_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Replace'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-34'
,p_icon_css_classes=>'fa-arrows-h'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(284625719956681359)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_button_name=>'GET_WIP_LINES'
,p_button_static_id=>'GET_WIP_LINES'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get WIP Lines'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-13'
,p_icon_css_classes=>'fa-arrow-circle-o-right'
,p_grid_new_row=>'N'
,p_grid_column_span=>1
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(294523912491727132)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'u-color-9'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2694513304079740)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(287980977308240473)
,p_button_name=>'EDIT_BILL_LINES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit Bill Lines'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:13:P13_AGREEMENT_NUMBER,P13_PROJECT_NUMBER,P13_CURRENCY_CODE:&P2_AGREEMENT_NUMBER.,&P2_PROJECT_NUMBER.,&PRJDET_CURRENCY.'
,p_button_condition=>'UPPER(:CLIENT) != ''MAPLES'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15672868656406536)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9055770686988829)
,p_button_name=>'INVOICE_HISTORY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Invoice History'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:11::'
,p_icon_css_classes=>'fa-history'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25093071850868798)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(182378174571203424)
,p_button_name=>'OPEN_AGREEMENT'
,p_button_static_id=>'open_agreement_btn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Open Agreement'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:window.open($v("P2_DUMMY"),''_blank'');'
,p_button_execute_validations=>'N'
,p_button_css_classes=>'u-color-31'
,p_icon_css_classes=>'fa-file-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41326715288208489)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(276835019938554494)
,p_button_name=>'Help'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294483373284717164)
,p_button_image_alt=>'Help'
,p_button_position=>'EDIT'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-question'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(79471184989090619)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(281264383984476611)
,p_button_name=>'FEE_ADJUSTMENT'
,p_button_static_id=>'FEE_ADJ'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconRight:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Adjustment'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_AGREEMENT_NUMBER,P6_PROJECT_NUMBER:&P2_AGREEMENT_NUMBER.,&P2_PROJECT_NUMBER.'
,p_button_css_classes=>'u-color-9 '
,p_icon_css_classes=>'fa-sliders'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(286624426465252169)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_button_name=>'EventTag'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Tag Events'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-9'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(294120288472181160)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(295458260805053581)
,p_button_name=>'WIP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate Events'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-9'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(276836940485554513)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(276835019938554494)
,p_button_name=>'SPELL_CHECK'
,p_button_static_id=>'SPELL_CHECK'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Spell Check'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-31'
,p_icon_css_classes=>'fa-change-case'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(285024800405613578)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_button_name=>'WIPAdjustment'
,p_button_static_id=>'WIPAdjustment'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'WIP Adjustment'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-9'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(286623798576252162)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(295458260805053581)
,p_button_name=>'GenerateInvoiceBtn'
,p_button_static_id=>'GenerateInvoiceBtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate Invoice'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::INV_CONTRACT_NUMBER,INV_PROJECT_NUMBER,P3_PRJDET_AGREEMENT_NUMBER,INV_BILL_FROM_DATE,INV_BILL_THRU_DATE:&P2_AGREEMENT_NUMBER.,&P2_PROJECT_NUMBER_COPY.,&P2_AGREEMENT_NUMBER.,&P_BILL_FROM_DATE.,&P_BILL_THRU_DATE.'
,p_button_css_classes=>'u-color-9'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4226636179455678)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_button_name=>'SPLIT_TRANSFER'
,p_button_static_id=>'TransferSplit'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Transfer and Split'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-9'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23038250836582502)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(295458260805053581)
,p_button_name=>'UPDATE_INVOICE_DFFS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294484103589717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Invoice for Approval'
,p_button_position=>'EDIT'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'u-color-9'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(276839065008554534)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(276835019938554494)
,p_button_name=>'REPLACE_ALL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Replace All'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-34'
,p_icon_css_classes=>'fa-arrows-h'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(281262676255476594)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(276835019938554494)
,p_button_name=>'VIEW_DICTIONARY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'View Dictionary'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5::'
,p_button_css_classes=>'u-color-37'
,p_icon_css_classes=>'fa-book'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(290578889487211053)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_button_name=>'P2_NARRATIVE_FIND_REPLACE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find/Replace & Spell Check Narrative'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-31'
,p_icon_css_classes=>'fa-exchange'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(295478071400097059)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_button_name=>'SaveSession'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(294484232040717164)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Session'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-color-31'
,p_icon_css_classes=>'fa-save'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(294525859141727136)
,p_branch_name=>'Go To Page 1'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>3
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4223970564455652)
,p_name=>'P2_SELECTED_PROJS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4223675302455649)
,p_name=>'P2_SELECTED_TASK_NUMBERS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6502426957171635)
,p_name=>'P2_LINKED_PROJECTS_COUNT'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_item_default=>'0'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16676703262673411)
,p_name=>'P_BILL_FROM_DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_prompt=>'Bill From Date'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'STATIC'
,p_attribute_07=>'+0d'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16875324366514523)
,p_name=>'P9_EXPIDS_ST'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16875370108514524)
,p_name=>'P2_SELECTED_PROJS_ST'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16875521776514525)
,p_name=>'P2_SELECTED_TASK_NUMBERS_ST'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16875565068514526)
,p_name=>'P_SELECTED_AMOUNT_ST'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_use_cache_before_default=>'NO'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16875675016514527)
,p_name=>'P_SELECTED_COUNT_ST'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16875773004514528)
,p_name=>'P_HOURS_COUNT_ST'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21728189378658028)
,p_name=>'P2_REPORT_SELECTION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(21728131049658027)
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct wip_category d, wip_category r ',
'from   xxgpms_project_wip_category',
'where  agreement_number = nvl(:P2_AGREEMENT_NUMBER,agreement_number) ',
'and    project_number   = nvl(:P2_PROJECT_NUMBER,project_number)',
'and    session_id = :APP_SESSION',
'order  by  1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All'
,p_lov_cascade_parent_items=>'P2_AGREEMENT_NUMBER'
,p_ajax_items_to_submit=>'P2_AGREEMENT_NUMBER'
,p_ajax_optimize_refresh=>'N'
,p_tag_css_classes=>'padding-left-lg margin-top-sm'
,p_field_template=>wwv_flow_imp.id(294482824232717164)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge:t-Form-fieldContainer--boldDisplay'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'10'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23038393532582504)
,p_name=>'P2_PROJECT_NUMBER_COPY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(295458260805053581)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23425451418100898)
,p_name=>'P2_PROGRESS_SEQ'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25093218823868799)
,p_name=>'P2_CONTRACT_ID'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct contract_id ',
'from xxgpms_project_contract ',
'where project_number = nvl(:P2_PROJECT_NUMBER,project_number)',
'and   contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'fetch first row only ;'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27130221119420999)
,p_name=>'P2_SAAS_USER_1'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_source=>'select :APP_USER from dual;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27130671448421004)
,p_name=>'P2_USER_NAME'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_source=>'G_SAAS_PREFERRED_NAME'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28420451400217928)
,p_name=>'P2_DUMMY'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38404954235602396)
,p_name=>'P2_PROJECT_NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_prompt=>'&P0_PROJECT_LABEL.  Number'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct project_number d, project_number r ',
'from   xxgpms_project_costs',
'WHERE SESSION_ID = :APP_SESSION',
'order by 1',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- SELECT --'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41119568846497089)
,p_name=>'P2_URL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41264433358155688)
,p_name=>'P2_PROGRESS_BAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'PLUGIN_COM.STEFANDOBRE.PROGRESSBAR'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'floatingonbody'
,p_attribute_04=>'pb-size-small'
,p_attribute_05=>'#00A02D'
,p_attribute_06=>'onbar'
,p_attribute_07=>'underbar'
,p_attribute_08=>'pb-animated-stripes'
,p_attribute_09=>'hidden'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41287941579175501)
,p_name=>'P2_INTERVAL_ID'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41288118640175502)
,p_name=>'P2_PROGRESS_MESSAGE'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41288294427175504)
,p_name=>'P2_RECORD_ID'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41328352057208506)
,p_name=>'P2_PROJECT_LABEL'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41328519751208507)
,p_name=>'P2_TRUST_LABEL'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41510232696462488)
,p_name=>'P2_SELECTED_RECORDS'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182377356972203415)
,p_name=>'P2_CHANGE_GRAPHS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(281264383984476611)
,p_item_default=>'E'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Fee Earner;E,Title;T,Aging ;A,&P0_PROJECT_LABEL.;P'
,p_begin_on_new_line=>'N'
,p_grid_column=>1
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(294482824232717164)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup:t-Form-fieldContainer--normalDisplay'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182377809955203420)
,p_name=>'P2_AGREEMENT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_item_source_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_source=>'PROJECT_NUMBER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182377950728203421)
,p_name=>'P2_DRAFT_NUMBER'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_item_source_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_prompt=>'Draft  Invoice Number'
,p_source=>'PROJECT_NUMBER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from ',
'(SELECT DISTINCT DRAFT_INVOICE_NUMBER||'' - ''||INVOICE_STATUS_CODE, DRAFT_INVOICE_NUMBER R',
'FROM XXGPMS_PROJECT_COSTS',
'WHERE SESSION_ID = V(''SESSION'')',
'UNION ',
'SELECT DISTINCT DRAFT_INVOICE_NUMBER||'' - ''||INVOICE_STATUS_CODE, DRAFT_INVOICE_NUMBER R',
'FROM XXGPMS_PROJECT_EVENTS',
'WHERE SESSION_ID = V(''SESSION''))',
'where R is not null',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- ALL --'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(294483322383717164)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182378002253203422)
,p_name=>'PRJDET_AGREEMENT_NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(294067006529021496)
,p_prompt=>'Agreement Number:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(294482869055717164)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(182378081926203423)
,p_name=>'PRJDET_BILL_TO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(294067006529021496)
,p_prompt=>'Bill To Address:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_imp.id(294482869055717164)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(276836849320554512)
,p_name=>'P2_SPELL_RECORDS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(335681333723944902)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(279746789216405524)
,p_name=>'P2_ERR_WORD'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(279746828728405525)
,p_name=>'P2_EXP_ID'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(280335850811789796)
,p_name=>'P2_SAAS_ACCESS_URL'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(280335980595789797)
,p_name=>'P2_SAAS_ACCESS_TOKEN'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(280336039605789798)
,p_name=>'P2_SAAS_USER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_source=>'G_SAAS_USER'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(280339707225789834)
,p_name=>'P2_SAAS_PREFERRED_NAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(294067006529021496)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(281265860458476626)
,p_name=>'P2_CHART_TITLE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285022884781613559)
,p_name=>'P_UNBILLED_FLAG'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_item_default=>'Y'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285022988198613560)
,p_name=>'P_BILL_THRU_DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Bill Thru Date'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285023426601613565)
,p_name=>'P_SELECTED_AMOUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_use_cache_before_default=>'NO'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285026744301613598)
,p_name=>'P_MODAL_FLAG'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285027549737613606)
,p_name=>'P_SELECTED_ADJUSTMENT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(286624079906252165)
,p_name=>'EVENT_SEL_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(295458260805053581)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(286928733874957806)
,p_name=>'P_DIALOG_URL'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(287164199421877067)
,p_name=>'P10_JWT_BASE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(287164286516877068)
,p_name=>'P10_FUSION_USER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(287164358359877069)
,p_name=>'P_SOURCE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(287178250173240075)
,p_name=>'P_CONTRACT_URL'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(287982065431240484)
,p_name=>'R_SELECTED_AMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(287982132380240485)
,p_name=>'R_SELECTED_ADJUSTMENT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(287983102778240494)
,p_name=>'R_AMT_DIFF'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(287983110691240495)
,p_name=>'P_UNBILLED_FLAG_T'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_item_default=>'Y'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:All;N,Progress;P,Unbilled;Y'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(294482824232717164)
,p_item_template_options=>'#DEFAULT#:margin-top-lg:margin-left-none:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(290580451905216444)
,p_name=>'P2_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(276837764988554521)
,p_prompt=>'Find'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(290580828715216444)
,p_name=>'P2_REPLACE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(276837764988554521)
,p_prompt=>'Replace'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294483001973717164)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294064667579021472)
,p_name=>'R_SELECTED_COUNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(287981794763240481)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294064798078021473)
,p_name=>'R_HOURS_COUNT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294065024039021476)
,p_name=>'P_SELECTED_COUNT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294065159678021477)
,p_name=>'P_HOURS_COUNT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294067182698021497)
,p_name=>'PRJDET_PROJECT_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(294067006529021496)
,p_prompt=>'&P0_PROJECT_LABEL.:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(294482869055717164)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294067291445021498)
,p_name=>'PRJDET_BU_NAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(294067006529021496)
,p_prompt=>'Business Unit:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(294482869055717164)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294067396756021499)
,p_name=>'PRJDET_LEGAL_ENTITY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(294067006529021496)
,p_prompt=>'Legal Entity:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_imp.id(294482869055717164)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294067472082021500)
,p_name=>'PRJDET_BLANK1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(294067006529021496)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294067569925021501)
,p_name=>'PRJDET_CURRENCY'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294068061972021506)
,p_name=>'PRJDET_CUSTOMER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(294067006529021496)
,p_prompt=>'Client:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(294482869055717164)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294068292558021508)
,p_name=>'PRJDET_RETAINER_BALANCE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(294067006529021496)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294211496321415296)
,p_name=>'P10_JWT'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(294520410635727110)
,p_name=>'P2_ROWID'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_item_source_plug_id=>wwv_flow_imp.id(294520130727727109)
,p_source=>'ROWID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(295479148984097069)
,p_name=>'P9_EXPIDS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(295455358557053551)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(284625870136681360)
,p_name=>'Get_WIP_Lines_Click'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(284625719956681359)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'G_SAAS_ACCESS_TOKEN'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(294063402615021459)
,p_event_id=>wwv_flow_imp.id(284625870136681360)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P_UNBILLED_FLAG'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
' setTimer();',
'// if ($x(''P_UNBILLED_FLAG_T_0'').checked == true) {',
'//     apex.item("P_UNBILLED_FLAG").setvalue("Y");',
'//     }',
'// else {',
'//     apex.item("P_UNBILLED_FLAG").setvalue("N");',
'// }',
'',
''))
,p_server_condition_type=>'ITEM_IS_NOT_NULL'
,p_server_condition_expr1=>'G_SAAS_ACCESS_TOKEN'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37770575286699910)
,p_event_id=>wwv_flow_imp.id(284625870136681360)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'R_SELECTED_AMOUNT,R_SELECTED_ADJUSTMENT,R_AMT_DIFF'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(284626023742681362)
,p_event_id=>wwv_flow_imp.id(284625870136681360)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url     VARCHAR2(100);',
'l_retcode NUMBER;',
'v_exists  number;',
'v_contract_id number;',
'  begin',
'  if :P2_AGREEMENT_NUMBER is not null or :P2_PROJECT_NUMBER is not null',
'  then',
'    apex_debug_message.log_message(p_message=> ''EK ''||:P2_AGREEMENT_NUMBER||'' ''||:P2_PROJECT_NUMBER,P_ENABLED => TRUE, p_level=>6);',
'    /*check if data already exists for either that agreement or matter */',
'    -- select count(*)',
'    -- into   v_exists ',
'    -- from   xxgpms_project_costs ',
'    -- where  (project_number = nvl(:P2_PROJECT_NUMBER,''xyz'') or ',
'    --  contract_number = nvl(:P2_AGREEMENT_NUMBER,''xyz'')',
'    --  and  session_id = v(''session'')',
'    --  );',
'    v_exists := 0;  ',
'   -- If data not exists then do the webservice call ',
'    -- if v_exists = 0',
'    -- then ',
'      -- populates the PROJECT COSTS and PROJECT CONTRACTS and PROJECT EVENTS',
'      XX_GPMS.UPDATE_STATUS(:P2_PROJECT_NUMBER, :P2_AGREEMENT_NUMBER',
'      ,:P_UNBILLED_FLAG_T, :P_BILL_THRU_DATE',
'      ,:G_JWT_BASE --:P10_JWT_BASE',
'      ,:P_BILL_FROM_DATE',
'      );',
'      ',
'      -- If agreement number is passed as the parameter',
'      if (:p2_agreement_number is not null or :p2_project_number is not null)',
'      then',
'        :prjdet_agreement_number := :p2_agreement_number;',
'        -- loop through all the matters of that agreement and update the rates',
'        for i in',
'        ( select distinct project_id, contract_number--,project_number,task_id',
'          from   xxgpms_project_costs',
'          where  contract_number = nvl(:P2_AGREEMENT_NUMBER,contract_number)',
'          and    project_number  = nvl(:p2_project_number,project_number)',
'          and     session_id     = :APP_SESSION',
'        )',
'        loop',
'          -- CHECK IF STANDARD, REALIZED OR AGREEMENT RATE IS NULL OR 0 AND UPDATE IT',
'          -- ADDED BY EMMANUEL',
'        begin',
'          select distinct contract_id',
'          into   v_contract_id ',
'          from    xxgpms_project_contract',
'          where  contract_number = i.contract_number;',
'        exception',
'          when others then',
'            v_contract_id := null;',
'        end;      ',
'',
'         xx_gpms.populate_rates_onload(p_project_id=>i.project_id,P_CONTRACT_ID=> v_contract_id);',
'          -- END OF CODE',
'        end loop;',
'         l_retcode := xx_gpms.get_project_details',
'          (:APP_SESSION, :p2_project_number,:prjdet_project_name, :prjdet_bu_name, :prjdet_legal_entity, ',
'          :prjdet_currency, :prjdet_customer, :prjdet_retainer_balance ,:P2_CONTRACT_ID);',
'          if l_retcode <> 1',
'          then',
'            :g_currency := :prjdet_currency;',
'          end if;',
'      end if;',
'      -- DELETE SPELL CHECKER WHEN REQUERYING',
'    -- end if;  ',
'    delete from spell_checker_dtl;        ',
'    delete from spell_check; ',
'  end if;     ',
'    :P2_DUMMY := :G_SAAS_ACCESS_URL||q''#/fndSetup/faces/deeplink?objType=CONTRACT&objKey=chrId=#''||:P2_CONTRACT_ID||q''#&action=EDIT#'';',
'  end;',
'',
'--   XX_gpms.GET_ALL_MATTERS;',
'  XX_GPMS.GET_ALL_EXP_TYPES;'))
,p_attribute_02=>'P_UNBILLED_FLAG,P_BILL_THRU_DATE,P9_EXPIDS,P10_JWT_BASE,P_UNBILLED_FLAG_T,P2_AGREEMENT_NUMBER,G_JWT_BASE,P_BILL_FROM_DATE'
,p_attribute_03=>'PRJDET_PROJECT_NAME,PRJDET_BU_NAME,PRJDET_LEGAL_ENTITY,PRJDET_CURRENCY,PRJDET_CUSTOMER,G_CURRENCY,P2_AGREEMENT_NUMBER,PRJDET_AGREEMENT_NUMBER,P2_PROJECT_NUMBER,P2_CONTRACT_ID'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'ITEM_IS_NOT_NULL'
,p_server_condition_expr1=>'G_SAAS_ACCESS_TOKEN'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41216287153577789)
,p_event_id=>wwv_flow_imp.id(284625870136681360)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.clearErrors();',
'apex.message.showErrors([',
'    {',
'    type: apex.message.TYPE.ERROR,',
'    location: ["page"],',
'    message: "The requested matter does not exist!!",',
'    unsafe: false',
'  }',
']);'))
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'PRJDET_CURRENCY'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(22091464746831698)
,p_event_id=>wwv_flow_imp.id(284625870136681360)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P2_PROJECT_NUMBER,P2_AGREEMENT_NUMBER'
,p_attribute_03=>'P2_AGREEMENT_NUMBER,P2_PROJECT_NUMBER'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(284626136759681363)
,p_event_id=>wwv_flow_imp.id(284625870136681360)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// apex.region("ProjectCosts").widget().interactiveGrid("getActions").invoke("refresh");',
'// apex.region("ProjectEvents").widget().interactiveGrid("getActions").invoke("refresh");',
'// apex.region("ResourceMetrics").refresh();',
'// apex.region("ResourceMetrics1").refresh();',
'// apex.region("OverallMetrics").refresh();',
'// apex.region("ProjectDetails").refresh();',
'// apex.region("Costsbyprojects").refresh();',
'//apex.region("RealizedRate").refresh();',
'',
'apex.region("TrustBalance").refresh();',
'// apex.region("CostSummary").refresh();',
'apex.item(''P2_DRAFT_NUMBER'').refresh();',
'apex.item(''P2_PROJECT_NUMBER'').refresh();',
'apex.item(''P2_CHANGE_GRAPHS'').refresh();',
'apex.region(''billing'').refresh();',
'$("#open_agreement_btn").refresh;',
'',
'// apex.region(''Fees'').refresh();',
'// apex.item(''P2_AGREEMENT_NUMBER'').refresh();',
'// apex.item(''P2_PROJECT_NUMBER'').refresh();',
'// apex.item(''P2_PROJECT_NUMBER'').setValue(apex.item(''P2_PROJECT_NUMBER'').getValue());',
'set_height();',
'endTimer();',
'// alert(''Hi'');'))
,p_server_condition_type=>'ITEM_IS_NOT_NULL'
,p_server_condition_expr1=>'G_SAAS_ACCESS_TOKEN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37745287827952088)
,p_name=>'Lose Focus on the Agreement Number Item'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_AGREEMENT_NUMBER'
,p_condition_element=>'P2_AGREEMENT_NUMBER'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37745420166952089)
,p_event_id=>wwv_flow_imp.id(37745287827952088)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P_UNBILLED_FLAG'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($x(''P_UNBILLED_FLAG_T_0'').checked == true)',
'    {',
'        apex.item( "P_UNBILLED_FLAG").setValue ("Y");       ',
'    }',
'else',
'    {',
'        apex.item( "P_UNBILLED_FLAG").setValue ("N");   ',
'    }',
'',
'  ',
'    '))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37745440113952090)
,p_event_id=>wwv_flow_imp.id(37745287827952088)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'R_SELECTED_AMOUNT,R_SELECTED_ADJUSTMENT,R_AMT_DIFF'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37745639411952091)
,p_event_id=>wwv_flow_imp.id(37745287827952088)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_url     VARCHAR2(100);',
'l_retcode NUMBER;',
'v_exists  number;',
'  begin',
'    /*check if data already exists */',
'    select count(*)',
'    into   v_exists ',
'    from   xxgpms_project_costs ',
'    where  (project_number = nvl(:P2_PROJECT_NUMBER,''xyz'') or ',
'     contract_number = nvl(:P2_AGREEMENT_NUMBER,''xyz'')',
'   );  ',
'',
'    if v_exists = 0',
'    then ',
'      XX_GPMS.UPDATE_STATUS(:P2_PROJECT_NUMBER, :P2_AGREEMENT_NUMBER, :P_UNBILLED_FLAG_T,:P_BILL_THRU_DATE,:P10_JWT_BASE);',
'      ',
'      if (:p2_agreement_number is not null and :p2_project_number is null)',
'      then',
'        :prjdet_agreement_number := :p2_agreement_number;',
'        for i in',
'        ( select distinct project_number',
'          from   xxgpms_project_costs',
'          where  contract_number = :P2_AGREEMENT_NUMBER',
'          and     session_id     = V(''SESSION'') ',
'        )',
'        loop',
'          -- CHECK IF STANDARD, REALIZED OR AGREEMENT RATE IS NULL OR 0 AND UPDATE IT',
'          -- ADDED BY EMMANUEL',
'          -- xx_gpms.populate_rates_onload(i.project_number);',
'          -- END OF CODE',
'          l_retcode := xx_gpms.get_project_details',
'          (v(''session''), i.project_number, :prjdet_project_name, :prjdet_bu_name,',
'           :prjdet_legal_entity, :prjdet_currency, :prjdet_customer, :prjdet_retainer_balance ',
'           ,:P2_CONTRACT_ID);',
'          if l_retcode <> 1',
'          then',
'            :g_currency := :prjdet_currency;',
'          end if;',
'        end loop;',
'      elsif :p2_project_number is not null',
'      then',
'        -- xx_gpms.populate_rates_onload(:p2_project_number);',
'        l_retcode := xx_gpms.get_project_details(v(''session''), :p2_project_number, ',
'                                                  :prjdet_project_name',
'                                                 , :prjdet_bu_name',
'                                                 , :prjdet_legal_entity',
'                                                 , :prjdet_currency',
'                                                 , :prjdet_customer',
'                                                 , :prjdet_retainer_balance',
'                                                 ,:P2_CONTRACT_ID );',
'        if l_retcode <> 1',
'        then',
'          :g_currency := :prjdet_currency;',
'        end if;',
'        begin',
'          select distinct  contract_number          --, line_number',
'          into   :p2_agreement_number--, :p2_draft_number',
'          from   xxgpms_project_costs',
'          where  session_id = V(''session'');  ',
'          :prjdet_agreement_number := :p2_agreement_number;',
'        exception',
'          when others then ',
'            :prjdet_agreement_number := null;',
'            :p2_agreement_number     := null;',
'        end;',
'      end if;',
'      -- DELETE SPELL CHECKER WHEN REQUERYING',
'     end if;  ',
'    delete from spell_checker_dtl;        ',
'    delete from spell_check;    ',
'  end;'))
,p_attribute_02=>'P_UNBILLED_FLAG,P_BILL_THRU_DATE,P9_EXPIDS,P10_JWT_BASE,P_UNBILLED_FLAG_T,P2_AGREEMENT_NUMBER'
,p_attribute_03=>'PRJDET_PROJECT_NAME,PRJDET_BU_NAME,PRJDET_LEGAL_ENTITY,PRJDET_CURRENCY,PRJDET_CUSTOMER,G_CURRENCY,P2_AGREEMENT_NUMBER,PRJDET_AGREEMENT_NUMBER,P2_DRAFT_NUMBER'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37745914312952094)
,p_event_id=>wwv_flow_imp.id(37745287827952088)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37745742071952093)
,p_event_id=>wwv_flow_imp.id(37745287827952088)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.region("ProjectCosts").widget().interactiveGrid("getActions").invoke("refresh");',
'apex.region("ProjectEvents").widget().interactiveGrid("getActions").invoke("refresh");',
'apex.region("ResourceMetrics").refresh();',
'apex.region("ResourceMetrics1").refresh();',
'apex.region("OverallMetrics").refresh();',
'apex.region("ProjectDetails").refresh();',
'apex.region("Costsbyprojects").refresh();',
'//apex.region("RealizedRate").refresh();',
'apex.region("TrustBalance").refresh();',
'apex.region("CostSummary").refresh();',
'apex.item(''P2_AGREEMENT_NUMBER'').refresh();',
'apex.item(''P2_PROJECT_NUMBER'').refresh();',
'apex.item(''PRJDET_AGREEMENT_NUMBER'').refresh();',
'apex.item(''P2_DRAFT_NUMBER'').refresh();',
'apex.region(''billing'').refresh();',
'set_height();',
''))
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(295478393535097062)
,p_name=>'SaveSessionClick'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(295478071400097059)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41286886908175490)
,p_event_id=>wwv_flow_imp.id(295478393535097062)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimer();',
'',
'apex.region("ProjectCosts").widget().interactiveGrid("getActions").invoke("save");',
'apex.region("ProjectEvents").widget().interactiveGrid("getActions").invoke("save");',
'// Send Only Selected Records to PLSQL for processing',
'// var grid_model = apex.region("ProjectCosts").widget().interactiveGrid("getViews", "grid").model;',
'var grid_model = apex.region("ProjectCosts").widget().interactiveGrid("getCurrentView").model ;',
'var records = grid_model.getSelectedRecords();',
'var actualRecords = { ''expids'': [] };',
'var actualRecordsJSON;',
'var records_from_emp_adjustment = apex.item(''P0_CUMULATIVE_EXP_ID'').getValue();',
'// Reusing Spell Records Item and not creating new one ',
'$s("P2_SELECTED_RECORDS", "");',
'if (records.length > 0) {',
'    $.each(records, function(i,r) {',
'        expenditure_item_id = grid_model.getValue(r, "EXPENDITURE_ITEM_ID");',
'        actualRecords.expids.push({',
'            "EXP_ID": expenditure_item_id',
'        });',
'    });',
'};',
'',
'if (records_from_emp_adjustment){',
'for (let i of records_from_emp_adjustment.split(''-'')){',
'            actualSelectedRecords.expids.push({',
'            "EXP_ID": i',
'        });',
'',
'}};',
'',
'actualRecordsJSON = JSON.stringify(actualSelectedRecords);',
'',
'// var selectedSet = new Set(actualSelectedRecords);',
'// actualRecordsJSON = Array.from(selectedSet).toString();',
'// alert(actualRecordsJSON);',
'apex.item(''P2_SELECTED_RECORDS'').setValue(actualRecordsJSON);',
'// apex.da.cancelEvent.call(this);',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(295478550548097063)
,p_event_id=>wwv_flow_imp.id(295478393535097062)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' if :P2_SELECTED_RECORDS IS NOT NULL THEN ',
'    XX_GPMS.XX_PROCESS_HOLD(:P2_PROJECT_NUMBER,null,:P2_SELECTED_RECORDS);',
'  end if;',
'      -- If Events are already Generated using "Generate Events" we need to post them as well',
'',
'    XX_GPMS.GENERATE_EVENTS_AND_POST(:P2_PROJECT_NUMBER_COPY',
'                               ,:P_BILL_THRU_DATE',
'                               ,:P2_AGREEMENT_NUMBER',
'                               ,null--:INV_JUSTIFICATION',
'                               ,null',
'                               ,:P_BILL_FROM_DATE);',
'end;'))
,p_attribute_02=>'P2_SELECTED_RECORDS,P2_PROJECT_NUMBER,P2_AGREEMENT_NUMBER,P_BILL_FROM_DATE,P_BILL_THRU_DATE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41287247211175494)
,p_event_id=>wwv_flow_imp.id(295478393535097062)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'endTimer();',
'apex.region(''ProjectCosts'').refresh();',
'apex.region(''ResourceMetrics'').refresh();',
'apex.region(''ResourceMetrics1'').refresh();',
'apex.region(''OverallMetrics'').refresh();',
'apex.region(''CostSummary'').refresh();',
'apex.region(''TrustBalance'').refresh();',
'apex.region(''Costsbyprojects'').refresh();',
'//apex.region(''Fees'').refresh();',
'',
'',
'',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(295478680276097065)
,p_name=>'Da_Select'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(295455358557053551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(295478791733097066)
,p_event_id=>wwv_flow_imp.id(295478680276097065)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i, ',
'    i_empids = "-", ',
'    i_empid, ',
'    i_project_numbers = "-",',
'    i_project_number,',
'    i_task_numbers = "-",',
'    i_task_number,',
'    i_billable_flag, ',
'    i_uom,',
'    i_currency;',
'',
'',
'model = this.data.model;',
'',
'i_amt = 0;',
'i_rlzamt = 0;',
'i_rlzamtr = 0;',
'i_selcount = 0;',
'i_hourscount = 0;',
'i_totalcount = 0;',
'i_rlzdiff = 0;',
'l_rlzdiff2 = 0;',
'i_amt2 = 0;',
'',
'for ( i = 0; i < this.data.selectedRecords.length; i++ ) {',
'    ',
'    i_billable_flag = model.getValue( this.data.selectedRecords[i], "BILLABLE_FLAG");',
'    // console.log(i_billable_flag);',
'    if (i_billable_flag != "N" )',
'    {',
'        i_empid = model.getValue( this.data.selectedRecords[i], "EXPENDITURE_ITEM_ID");',
'        console.log(i_empid);',
'        i_amt += Number(model.getValue( this.data.selectedRecords[i], "PROJECT_BILL_RATE_AMT").replace(/,(?=\d{3})/g, ''''));',
'        console.log(i_amt);',
'        i_rlzamt += Number(model.getValue( this.data.selectedRecords[i], "REALIZED_BILL_RATE_AMT").replace(/,(?=\d{3})/g, ''''));',
'        console.log(i_rlzamt); ',
'        var i_empid = model.getValue( this.data.selectedRecords[i], "EXPENDITURE_ITEM_ID");',
'        i_empids += i_empid + "-";',
'        var i_project_number = model.getValue( this.data.selectedRecords[i], "PROJECT_NUMBER");',
'        i_project_numbers += i_project_number + "-";',
'        var i_task_number = model.getValue( this.data.selectedRecords[i], "TASK_NUMBER");',
'        i_task_numbers += i_task_number + "-";',
'        actualSelectedRecords.expids.push({',
'            "EXP_ID": i_empid',
'        });        ',
'        i_uom = model.getValue( this.data.selectedRecords[i], "UNIT_OF_MEASURE");',
'        console.log(i_uom); ',
'        if (i_uom.toUpperCase() == "HOURS")',
'        {',
'            i_hourscount += Number(model.getValue( this.data.selectedRecords[i], "QUANTITY"));',
'                ',
'        }',
'        i_totalcount += Number(model.getValue( this.data.selectedRecords[i], "QUANTITY"));',
'        ',
'        i_selcount += 1;    ',
'    }',
'    ',
'}',
'',
'i_rlzdiff = i_amt- i_rlzamt;',
'i_amt2 = i_amt;',
'i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'//i_amt     = Math.round( i_amt   * 100.00 ) / 100.00;',
'//i_rlzamt  = Math.round(i_rlzamt * 100.00 ) / 100.00;',
'//i_rlzdiff = Math.round((i_amt - i_rlzamt)* 100.00) / 100.00;',
'i_amt = currencyFormatter(i_amt,i_currency);',
'i_rlzamt = currencyFormatter(i_rlzamt,i_currency);',
'i_rlzdiff = currencyFormatter(i_rlzdiff,i_currency);',
'',
'// i_rlzamtr = Math.round( i_rlzamt * 100.00 + Number.EPSILON ) / 100.00;',
'//  i_rlzamtr = i_rlzamt',
'//  String myCurrency = currency.format(123.5);',
' //  l_rlzdiff2 = String.format("%.2f", i_rlzamt);',
'',
'console.log(''Emp IDs'',i_empids);',
'apex.item( "P9_EXPIDS" ).setValue (i_empids);',
'apex.item( "P2_SELECTED_PROJS" ).setValue (i_project_numbers);',
'apex.item( "P2_SELECTED_TASK_NUMBERS" ).setValue (i_task_numbers);',
'console.log(apex.item(''P9_EXPIDS'').getValue());',
'apex.item( "P_SELECTED_AMOUNT").setValue (i_amt2);',
'apex.item( "P_SELECTED_ADJUSTMENT").setValue (i_rlzamt);',
'// apex.item( "R_SELECTED_AMOUNT").setValue (i_amt);',
'// apex.item( "R_SELECTED_ADJUSTMENT").setValue (i_rlzamt);',
'// apex.item( "R_AMT_DIFF").setValue (i_rlzdiff);',
'apex.item( "EXPENDITURE_SUMMARY").setValue (i_amt);',
'apex.item( "R_SELECTED_COUNT").setValue (i_selcount);',
'apex.item( "P_SELECTED_COUNT").setValue (i_selcount);',
'console.log(''Hours Count'',i_hourscount);',
'apex.item( "R_HOURS_COUNT").setValue (i_hourscount);',
'apex.item( "P_HOURS_COUNT").setValue (i_totalcount);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16875171321514522)
,p_event_id=>wwv_flow_imp.id(295478680276097065)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i, ',
'    i_empids = "-", ',
'    i_empid, ',
'    i_project_numbers = "~",',
'    i_project_number,',
'    i_task_numbers = "~",',
'    i_task_number,',
'    i_billable_flag, ',
'    i_uom,',
'    i_currency;',
'',
'',
'model = this.data.model;',
'',
'i_amt = 0;',
'i_rlzamt = 0;',
'i_rlzamtr = 0;',
'i_selcount = 0;',
'i_hourscount = 0;',
'i_rlzdiff = 0;',
'l_rlzdiff2 = 0;',
'i_amt2 = 0;',
'',
'for ( i = 0; i < this.data.selectedRecords.length; i++ ) {',
'    ',
'    i_billable_flag = model.getValue( this.data.selectedRecords[i], "BILLABLE_FLAG");',
'    // console.log(i_billable_flag);',
'        i_empid = model.getValue( this.data.selectedRecords[i], "EXPENDITURE_ITEM_ID");',
'        // console.log(i_empid);',
'        i_amt += Number(model.getValue( this.data.selectedRecords[i], "PROJECT_BILL_RATE_AMT").replace(/,(?=\d{3})/g, ''''));',
'        // console.log(i_amt);',
'        i_rlzamt += Number(model.getValue( this.data.selectedRecords[i], "REALIZED_BILL_RATE_AMT").replace(/,(?=\d{3})/g, ''''));',
'        console.log(i_rlzamt); ',
'        var i_empid = model.getValue( this.data.selectedRecords[i], "EXPENDITURE_ITEM_ID");',
'        i_empids += i_empid + "-";',
'        var i_project_number = model.getValue( this.data.selectedRecords[i], "PROJECT_NUMBER");',
'        i_project_numbers += i_project_number + "~";',
'        var i_task_number = model.getValue( this.data.selectedRecords[i], "TASK_NUMBER");',
'        i_task_numbers += i_task_number + "~";',
'        actualSelectedRecords.expids.push({',
'            "EXP_ID": i_empid',
'        });        ',
'        i_uom = model.getValue( this.data.selectedRecords[i], "UNIT_OF_MEASURE");',
'        // console.log(i_uom); ',
'        if (i_uom = "HOURS")',
'        {',
'            i_hourscount += Number(model.getValue( this.data.selectedRecords[i], "QUANTITY"));',
'                ',
'        }',
'        ',
'        i_selcount += 1;        ',
'}',
'',
'i_rlzdiff = i_amt- i_rlzamt;',
'i_amt2 = i_amt;',
'i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'//i_amt     = Math.round( i_amt   * 100.00 ) / 100.00;',
'//i_rlzamt  = Math.round(i_rlzamt * 100.00 ) / 100.00;',
'//i_rlzdiff = Math.round((i_amt - i_rlzamt)* 100.00) / 100.00;',
'i_amt = currencyFormatter(i_amt,i_currency);',
'i_rlzamt = currencyFormatter(i_rlzamt,i_currency);',
'i_rlzdiff = currencyFormatter(i_rlzdiff,i_currency);',
'',
'// i_rlzamtr = Math.round( i_rlzamt * 100.00 + Number.EPSILON ) / 100.00;',
'//  i_rlzamtr = i_rlzamt',
'//  String myCurrency = currency.format(123.5);',
' //  l_rlzdiff2 = String.format("%.2f", i_rlzamt);',
'',
'',
'apex.item( "P9_EXPIDS_ST").setValue (i_empids);',
'apex.item( "P2_SELECTED_PROJS_ST" ).setValue (i_project_numbers);',
'apex.item( "P2_SELECTED_TASK_NUMBERS_ST" ).setValue (i_task_numbers);',
'apex.item( "P_SELECTED_AMOUNT_ST").setValue (i_amt2);',
'apex.item( "P_SELECTED_COUNT_ST").setValue (i_selcount);',
'apex.item( "P_HOURS_COUNT_ST").setValue (i_hourscount);'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(287177013269240063)
,p_event_id=>wwv_flow_imp.id(295478680276097065)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'begin',
'APEX_UTIL.SET_SESSION_STATE(''WIP_EXPIDS'',:P9_EXPIDS);',
'end;'))
,p_attribute_02=>'R_SELECTED_AMOUNT,R_SELECTED_ADJUSTMENT,R_AMT_DIFF,P9_EXPIDS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(180945614364300356)
,p_event_id=>wwv_flow_imp.id(295478680276097065)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(287980977308240473)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(285023724005613568)
,p_name=>'Generate Events'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(294120288472181160)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(285023841238613569)
,p_event_id=>wwv_flow_imp.id(285023724005613568)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'XX_GPMS.GENERATE_EVENTS(:P2_PROJECT_NUMBER,:P2_AGREEMENT_NUMBER, :P_BILL_THRU_DATE);',
'end;'))
,p_attribute_02=>'P_BILL_THRU_DATE,P2_PROJECT_NUMBER,P2_AGREEMENT_NUMBER'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(286623639201252161)
,p_event_id=>wwv_flow_imp.id(285023724005613568)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region( "ProjectEvents" ).widget().interactiveGrid("getActions"). invoke("refresh");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(286624269336252167)
,p_name=>'EventSel'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(295458260805053581)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(286624305002252168)
,p_event_id=>wwv_flow_imp.id(286624269336252167)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i, i_eventnums = "-", i_eventnum, ',
'',
'',
'model = this.data.model;',
'',
'',
'for ( i = 0; i < this.data.selectedRecords.length; i++ ) {',
'    ',
'    i_eventnum = model.getValue( this.data.selectedRecords[i], "EVENT_NUM");',
'    ',
'    i_eventnums += model.getValue( this.data.selectedRecords[i], "EVENT_NUM") + "-";',
'    ',
'}',
'console.log(i_eventnums);',
'apex.item( "EVENT_SEL_ID" ).setValue (i_eventnums);',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(286624526170252170)
,p_name=>'EventTagClick'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(286624426465252169)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(286624645979252171)
,p_event_id=>wwv_flow_imp.id(286624526170252170)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'XX_GPMS.TAG_EVENTS(:P2_PROJECT_NUMBER, :P9_EXPIDS, :EVENT_SEL_ID, :P_SELECTED_AMOUNT);',
'',
'end;'))
,p_attribute_02=>'P9_EXPIDS,EVENT_SEL_ID,P_SELECTED_AMOUNT'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(286926834737957787)
,p_event_id=>wwv_flow_imp.id(286624526170252170)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region( "ProjectCosts" ).widget().interactiveGrid("getActions"). invoke("refresh");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(286928956357957808)
,p_name=>'WIPAdjustmentClose'
,p_event_sequence=>110
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#WIPAdjustment'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(287176605640240059)
,p_event_id=>wwv_flow_imp.id(286928956357957808)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.region( "ProjectCosts" ).widget().interactiveGrid("getActions"). invoke("refresh");',
'apex.region("ResourceMetrics1").refresh();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(287177490340240067)
,p_name=>'WIPAdjustmentClick'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(285024800405613578)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(287177563312240068)
,p_event_id=>wwv_flow_imp.id(287177490340240067)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P_DIALOG_URL'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.prepare_url(''f?p=&APP_ID.:4:&SESSION.:::4:WIP_SEL_AMOUNT,WIP_EXPIDS,WIP_LINE_COUNT,WIP_HOURS_COUNT,WIP_PROJECT_NUMBER,P4_CURRENCY,P4_HOURS_COUNT:'' || :P_SELECTED_AMOUNT || '','' || :P9_EXPIDS || '','' || :P_SELECTED_COUNT || '','' || round(:P_HOU'
||'RS_COUNT,2) || '','' || :P2_PROJECT_NUMBER|| '',''||:PRJDET_CURRENCY||'',''||:R_HOURS_COUNT, ',
'                      p_triggering_element => ''apex.jQuery(''''#WIPAdjustment'''')'') ',
'',
''))
,p_attribute_07=>'P2_SELECTED_RECORDS,P9_EXPIDS,P_SELECTED_AMOUNT,P_SELECTED_COUNT,P_HOURS_COUNT,PRJDET_CURRENCY,R_HOURS_COUNT'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(287177836147240071)
,p_event_id=>wwv_flow_imp.id(287177490340240067)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var l_url=apex.item(''P_DIALOG_URL'').getValue();',
'',
'l_url = l_url.replace(''javascript:'', '''');',
'l_url = l_url.replace(new RegExp(''&#x27;'', ''g''), "''");',
'',
'eval(l_url);',
'',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(4225931260455671)
,p_name=>'Transfer and Split Click'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(4226636179455678)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4225794930455670)
,p_event_id=>wwv_flow_imp.id(4225931260455671)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P_DIALOG_URL'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.prepare_url(''f?p=&APP_ID.:14:&SESSION.:::14:P14_WIP_SEL_AMOUNT,P14_WIP_EXPIDS,P14_WIP_LINE_COUNT,P14_WIP_HOURS_COUNT,P14_WIP_PROJECT_NUMBER,P14_CURRENCY,P14_WIP_TASK_NUMBER:'' || :P_SELECTED_AMOUNT_ST || '','' || :P9_EXPIDS_ST || '','' || :P_SEL'
||'ECTED_COUNT_ST || '','' || round(:P_HOURS_COUNT_ST,2) || '','' || :P2_SELECTED_PROJS_ST|| '',''||:PRJDET_CURRENCY||'',''||:P2_SELECTED_TASK_NUMBERS_ST, ',
'                      p_triggering_element => ''apex.jQuery(''''#TransferSplit'''')'') ',
'',
''))
,p_attribute_07=>'P2_SELECTED_RECORDS,P9_EXPIDS,P_SELECTED_AMOUNT,P_SELECTED_COUNT,P_HOURS_COUNT,PRJDET_CURRENCY,P2_AGREEMENT_NUMBER,P2_PROJECT_NUMBER,P2_SELECTED_PROJS,P2_SELECTED_TASK_NUMBERS,P9_EXPIDS_ST,P_SELECTED_AMOUNT_ST,P2_SELECTED_PROJS_ST,P_SELECTED_COUNT_ST'
||',P2_SELECTED_TASK_NUMBERS_ST,P_HOURS_COUNT_ST'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4225738478455669)
,p_event_id=>wwv_flow_imp.id(4225931260455671)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var l_url=apex.item(''P_DIALOG_URL'').getValue();',
'',
'l_url = l_url.replace(''javascript:'', '''');',
'l_url = l_url.replace(new RegExp(''&#x27;'', ''g''), "''");',
'',
'eval(l_url);',
'',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(287178422397240077)
,p_name=>'GenerateInvoiceClick'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(286623798576252162)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(287178585778240078)
,p_event_id=>wwv_flow_imp.id(287178422397240077)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P_CONTRACT_URL'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.prepare_url(''f?p=&APP_ID.:3:&SESSION.::::INV_PROJECT_NUMBER,INV_BILL_THRU_DATE,INV_RETAINER_BALANCE,P3_PRJDET_AGREEMENT_NUMBER,INV_CONTRACT_NUMBER:'' || :P2_PROJECT_NUMBER || '','' || :P_BILL_THRU_DATE || '','' || :PRJDET_RETAINER_BALANCE||'',''||'
||':P2_AGREEMENT_NUMBER||'',''||:P2_AGREEMENT_NUMBER, p_triggering_element => ''apex.jQuery(''''#GenerateInvoiceBtn'''')'') ',
'                      ',
'                      ',
'',
'',
'',
'',
'',
'',
'',
''))
,p_attribute_07=>'P_BILL_THRU_DATE,P2_AGREEMENT_NUMBER'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(287178672077240079)
,p_event_id=>wwv_flow_imp.id(287178422397240077)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var l_url=apex.item(''P_CONTRACT_URL'').getValue();',
'',
'',
'l_url = l_url.replace(''javascript:'', '''');',
'l_url = l_url.replace(new RegExp(''&#x27;'', ''g''), "''");',
'',
'eval(l_url);',
'',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(287179533984240088)
,p_name=>'InvoiceGenerationClose'
,p_event_sequence=>150
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#GenerateInvoiceBtn'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(287179699210240089)
,p_event_id=>wwv_flow_imp.id(287179533984240088)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.region( "ProjectCosts" ).widget().interactiveGrid("getActions"). invoke("refresh");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(290581412882229661)
,p_name=>'SET_SEARCH'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(290579642330216443)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(290581845357229663)
,p_event_id=>wwv_flow_imp.id(290581412882229661)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//an array with all filters we want to add when pressing Search',
'var arrayFields = [];',
'',
'//counter controller to check whether it should save and refresh IG',
'var cont = 1;',
'',
'// interactive grid',
'var regionStaticId = ''ProjectCosts'';',
'var itemsSelected = new Array();',
'var ig$ = apex.region(regionStaticId).widget();',
'var gridView = ig$.interactiveGrid("getViews").grid;',
'',
'//adding customer filter',
'if ($v(''P2_SEARCH'')) {',
'    arrayFields.push(',
'        {',
'            type: ''column'',',
'            columnType: ''column'',',
'            columnName: ''NARRATIVE_BILLING_OVERFLOW'',',
'            operator: ''C'',',
'            value: $v(''P2_SEARCH''),',
'            isCaseSensitive: false',
'        }',
'    );',
'}',
'',
'//iterate through the filters and refresh IG',
'for (var filterObj of arrayFields) {',
'    if (filterObj.value) {',
'        // Remove existing filter on the column before adding new',
'        var vFilters = apex.region(regionStaticId).call("getFilters");',
'        var vFilterColId = apex.region(regionStaticId).call("getViews").grid.modelColumns["NARRATIVE_BILLING_OVERFLOW"].id;',
'        for (var i in vFilters) {',
'            if (vFilters[i].columnId == vFilterColId) {',
'                apex.region(regionStaticId).call("deleteFilter", vFilters[i].id);',
'            }',
'        }',
'        ig$.interactiveGrid("addFilter", filterObj,',
'            {',
'                refreshData: (cont == arrayFields.length) ? true : false,',
'                save: (cont == arrayFields.length) ? true : false',
'            }',
'        );',
'    }',
'    cont++;',
'',
'    gridView.view$.grid("selectAll");',
'}',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(290582208590233089)
,p_name=>'P2_REPLACE_PRESSED'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(290580061001216444)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(290582603197233089)
,p_event_id=>wwv_flow_imp.id(290582208590233089)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var regionStaticId = ''ProjectCosts'';',
'var itemsSelected = new Array();    ',
'var ig$ = apex.region(regionStaticId).widget();',
'var gridView = ig$.interactiveGrid("getViews").grid;',
'var selectedRecords = gridView.getSelectedRecords();',
'var recsupdated = 0;',
'',
'var repl ',
'var sear',
'var curstring',
'var newstring',
'',
'repl = $v("P2_REPLACE");',
'sear = $v("P2_SEARCH");',
'',
'//execute this code only if there is at least one row selected in the IG',
'if(selectedRecords.length > 0 ) {    ',
'',
'  for(i = 0; i < selectedRecords.length; i++) {   ',
'',
'    curstring = gridView.model.getValue(selectedRecords[i], ''NARRATIVE_BILLING_OVERFLOW'');',
'    newstring = curstring.replaceAll(sear,repl);',
'',
'    // putting this if statement in because find may not have been pressed and a replace may result in changes not actually being needed',
'    if (curstring != newstring) ',
'    {',
'      gridView.model.setValue(selectedRecords[i], ''NARRATIVE_BILLING_OVERFLOW'', newstring);',
'      recsupdated++;',
'    }',
'  }',
'  apex.message.showPageSuccess( recsupdated+" records updated." );',
' }',
'else    {',
'    apex.message.showPageSuccess( "No records to change." );',
'}',
'',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(284626290042681364)
,p_name=>'Open_Find_Replace'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(290578889487211053)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37772114595699925)
,p_event_id=>wwv_flow_imp.id(284626290042681364)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(335681333723944902)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'openModal(''find_replace'');',
'apex.region(''find_replace'').refresh();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(319160805789534261)
,p_name=>'Set the currency post report refresh'
,p_event_sequence=>190
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(287980977308240473)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(319160976689534262)
,p_event_id=>wwv_flow_imp.id(319160805789534261)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(287980977308240473)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i_selector = $(''#CostSummary tr td[headers="Total_Amt"]'');',
'var i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'var i_selector = $(''#CostSummary tr td[headers="Fees"]'');',
'var i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'var i_selector = $(''#CostSummary tr td[headers="Selected Amounts"]'');',
'for (i=0;i<i_selector.length;i++)',
'{',
'    i_selector[i].innerHTML = currencyFormatter(0.00,i_currency);',
'}',
'',
'',
'var i_selector = $(''#CostSummary tr td[headers="Costs"]'');',
'var i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'var i_selector = $(''#CostSummary tr td[headers="Hourly_Fees"]'');',
'var i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'var i_selector = $(''#CostSummary tr td[headers="FEES"]'');',
'var i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'var i_selector = $(''#CostSummary tr td[headers="Hard_Costs"]'');',
'var i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'var i_selector = $(''#CostSummary tr td[headers="Soft_Costs"]'');',
'var i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(276839174140554535)
,p_name=>'Click on Replace All'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(276839065008554534)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(276839309240554536)
,p_event_id=>wwv_flow_imp.id(276839174140554535)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var grid_model = apex.region("spell_check_region").widget().interactiveGrid("getViews", "grid").model;',
'var records = grid_model.getTotalRecords();',
'var old_grid_model = apex.region("ProjectCosts").widget().interactiveGrid("getViews", "grid").model;',
'var old_records = old_grid_model.getTotalRecords();',
'var accepted_word, error_word,expenditure_item_id,old_EXPENDITURE_ITEM_ID;',
'',
'if (records > 0) {',
'    grid_model.forEach(function (record, index, id) {',
'        accepted_word = grid_model.getValue(record, "SUGGESTED");',
'        //alert(''Accepted Word: ''+accepted_word);',
'        error_word = grid_model.getValue(record, "ERROR_WORD");',
'        //alert(''error_word: ''+error_word);',
'        expenditure_item_id = grid_model.getValue(record, "EXP_ITEM_ID");',
'        //alert(''expenditure_item_id: ''+expenditure_item_id);',
'        var session = $v(''pInstance'');',
'        if (accepted_word !== '''') {',
'            var old_EXPENDITURE_ITEM_ID = old_grid_model.getRecord([expenditure_item_id,session]);',
'            //alert(''old_EXPENDITURE_ITEM_ID: ''+old_EXPENDITURE_ITEM_ID);',
'            var old_narration = old_grid_model.getValue(old_EXPENDITURE_ITEM_ID, ''NARRATIVE_BILLING_OVERFLOW'');',
'            //alert(''old_narration: ''+old_narration);',
'            newstring = old_narration.replace(error_word,accepted_word);',
'            //alert(''newstring: ''+newstring);',
'            old_grid_model.setValue(old_EXPENDITURE_ITEM_ID, ''NARRATIVE_BILLING_OVERFLOW'', newstring);',
'            //apex.old_grid_model.save;',
'            //apex.region("ProjectCosts").widget().interactiveGrid("getActions").invoke("save");',
'            grid_model.clearChanges();',
'            apex.message.showPageSuccess( ''Replace Complete!! Refreshing..'');',
'            $("#SPELL_CHECK").click();',
'',
'        }',
'    });',
'}',
'else',
'{',
'        apex.message.clearErrors();',
'',
'        apex.message.showErrors([',
'            {',
'                type: apex.message.TYPE.ERROR,',
'                location: ["page"],',
'                message: "No records to replace!!",',
'                unsafe: false',
'                }',
'                ]);',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(279747352521405530)
,p_name=>'Ignore Word'
,p_event_sequence=>210
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'buttonClicked'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(279747798439405534)
,p_event_id=>wwv_flow_imp.id(279747352521405530)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P2_ERR_WORD'').setValue((this.data.P2_ERR_WORD));',
'apex.item(''P2_EXP_ID'').setValue((this.data.P2_EXP_ID));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(279747698344405533)
,p_event_id=>wwv_flow_imp.id(279747352521405530)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'V_EXISTING_COUNT NUMBER;',
'BEGIN',
'',
'SELECT COUNT(*)',
'INTO   V_EXISTING_COUNT',
'FROM   SPELL_CHECK_EXCEPTIONS',
'WHERE  1=1',
'AND    DTL_ID = :P2_EXP_ID;',
'',
'IF V_EXISTING_COUNT = 0 ',
'THEN',
'INSERT INTO  SPELL_CHECK_EXCEPTIONS (WORD,EXPENDITURE_ITEM_KEY,EXCEPTION_TYPE,USER_EMAIL,DTL_ID)',
'SELECT ERROR_WORD, EXP_ITEM_ID,''I'',:P2_SAAS_USER,ID FROM SPELL_CHECKER_DTL ',
'WHERE ID = :P2_EXP_ID;',
'END IF;',
'END;',
''))
,p_attribute_02=>'P2_ERR_WORD,P2_EXP_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(279747826996405535)
,p_event_id=>wwv_flow_imp.id(279747352521405530)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(276835019938554494)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41326932342208491)
,p_name=>'Add to Global Dictionary'
,p_event_sequence=>220
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'removeButtonClicked'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41326952031208492)
,p_event_id=>wwv_flow_imp.id(41326932342208491)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P2_ERR_WORD'').setValue((this.data.P2_ERR_WORD));',
'apex.item(''P2_EXP_ID'').setValue((this.data.P2_EXP_ID));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41327128339208493)
,p_event_id=>wwv_flow_imp.id(41326932342208491)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'V_EXISTING_COUNT NUMBER;',
'BEGIN',
'',
'SELECT COUNT(*)',
'INTO   V_EXISTING_COUNT',
'FROM   SPELL_CHECK_EXCEPTIONS',
'WHERE  1=1',
'AND    DTL_ID = :P2_EXP_ID;',
'',
'IF V_EXISTING_COUNT = 0 ',
'THEN',
'INSERT INTO  SPELL_CHECK_EXCEPTIONS (WORD,EXPENDITURE_ITEM_KEY,EXCEPTION_TYPE,USER_EMAIL,DTL_ID)',
'SELECT ERROR_WORD, EXP_ITEM_ID,''D'',:P2_SAAS_USER,ID FROM SPELL_CHECKER_DTL ',
'WHERE ID = :P2_EXP_ID;',
'END IF;',
'END;',
''))
,p_attribute_02=>'P2_ERR_WORD,P2_EXP_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41327156148208494)
,p_event_id=>wwv_flow_imp.id(41326932342208491)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(276835019938554494)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(281262190110476589)
,p_name=>'Add to Dictionary'
,p_event_sequence=>230
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'buttonPressed'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(281262278184476590)
,p_event_id=>wwv_flow_imp.id(281262190110476589)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//alert(apex.item(''P2_ERR_WORD'').setValue((this.data.P2_ERR_WORD)));',
'apex.item(''P2_ERR_WORD'').setValue((this.data.P2_ERR_WORD));',
'//alert(apex.item(''P2_EXP_ID'').setValue((this.data.P2_EXP_ID)));',
'apex.item(''P2_EXP_ID'').setValue((this.data.P2_EXP_ID));'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(281262399886476591)
,p_event_id=>wwv_flow_imp.id(281262190110476589)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'V_EXISTING_COUNT NUMBER;',
'BEGIN',
'',
'SELECT COUNT(*)',
'INTO   V_EXISTING_COUNT',
'FROM   SPELL_CHECK_EXCEPTIONS',
'WHERE  1=1',
'AND    DTL_ID = :P2_EXP_ID',
'AND    USER_EMAIL = :P2_SAAS_USER;',
'',
'IF V_EXISTING_COUNT = 0 ',
'THEN',
'INSERT INTO  SPELL_CHECK_EXCEPTIONS (WORD,EXPENDITURE_ITEM_KEY,EXCEPTION_TYPE,USER_EMAIL,DTL_ID)',
'SELECT ERROR_WORD, EXP_ITEM_ID,''P'',:P2_SAAS_USER,ID FROM SPELL_CHECKER_DTL ',
'WHERE ID = :P2_EXP_ID;',
'END IF;',
'END;',
''))
,p_attribute_02=>'P2_ERR_WORD,P2_EXP_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(281262505273476592)
,p_event_id=>wwv_flow_imp.id(281262190110476589)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(276835019938554494)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(280335578078789793)
,p_name=>'Get the Access Token'
,p_event_sequence=>240
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(280335713504789794)
,p_event_id=>wwv_flow_imp.id(280335578078789793)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if((!''&G_SAAS_ACCESS_TOKEN!JS.''))',
'{',
'  getAccessToken(''&G_SAAS_ACCESS_URL!JS.''); // Escape JS special characters',
'}',
'',
'// GET THE URL VALUE',
'var url = window.location.href;',
'if (url.match(/^.*fronteragpmsdev.*$/)) //%abc',
'{',
'    $("#wipmanagement").css("background-color","rgb(231 219 208)");',
'}',
'',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(182377434421203416)
,p_name=>'Switch_Charts'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_CHANGE_GRAPHS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(182377510878203417)
,p_event_id=>wwv_flow_imp.id(182377434421203416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var val = apex.item(''P2_CHANGE_GRAPHS'').getValue();',
'var label = apex.item(''P0_PROJECT_LABEL'').getValue();',
'var button_selector = $("#FEE_ADJ");',
'if (val==''E'')',
'{',
'    $("#ResourceMetrics").hide();',
'    $("#OverallMetrics").hide();',
'    $("#ResourceMetrics1").show();  ',
'    $("#Costsbyprojects").hide();',
'    $("#chart_parent .t-Region-title").text(''Fees Analysis By Fee Earner'');',
'    apex.region(''ResourceMetrics1'').refresh();  ',
'   $("#P2_CHANGE_GRAPHS").parent().prepend($("#FEE_ADJ"));',
'}   ',
'else if (val == ''T'')',
'{',
'     $("#ResourceMetrics1").hide();',
'    $("#OverallMetrics").hide(); ',
'    $("#ResourceMetrics").show();',
'    $("#Costsbyprojects").hide();',
'    $("#chart_parent .t-Region-title").text(''Fees Analysis By Title'');',
'    apex.region(''ResourceMetrics'').refresh();',
'     //$("#chart_parent .t-Region-title").append(button_selector);',
'     $("#P2_CHANGE_GRAPHS").parent().prepend($("#FEE_ADJ"));',
'}',
'else if (val == ''A'')',
'{',
'    $("#ResourceMetrics1").hide();',
'    $("#ResourceMetrics").hide();',
'    $("#OverallMetrics").show(); ',
'    $("#Costsbyprojects").hide();',
'    $("#chart_parent .t-Region-title").text(''Unbilled Aging'');',
'    apex.region(''OverallMetrics'').refresh();',
'    //$("#chart_parent .t-Region-title").append(button_selector);',
'    $("#P2_CHANGE_GRAPHS").parent().prepend($("#FEE_ADJ"));',
'}',
'else if (val == ''P'')',
'{',
'    $("#ResourceMetrics1").hide();',
'    $("#ResourceMetrics").hide();',
'    $("#OverallMetrics").hide();',
'    $("#Costsbyprojects").show();',
'    $("#chart_parent .t-Region-title").text(''Fee Allocation By ''+label);',
'    apex.region(''Costsbyprojects'').refresh();',
'    //$("#chart_parent .t-Region-title").append(button_selector);',
'    $("#P2_CHANGE_GRAPHS").parent().prepend($("#FEE_ADJ"));',
'}',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(125823262867846264)
,p_name=>'After Refresh of Cost Summary'
,p_event_sequence=>260
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(287980977308240473)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(125823307439846265)
,p_event_id=>wwv_flow_imp.id(125823262867846264)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(".t-Report-report tr:last td").css("font-weight","700");'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15669470526406502)
,p_event_id=>wwv_flow_imp.id(125823262867846264)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9055770686988829)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(36685118196316917)
,p_name=>'Close all Persons dialog (Page 6)'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(79471184989090619)
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(36685176119316918)
,p_event_id=>wwv_flow_imp.id(36685118196316917)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(280338074776789818)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37332142343710310)
,p_event_id=>wwv_flow_imp.id(36685118196316917)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(287980977308240473)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16677440283673418)
,p_event_id=>wwv_flow_imp.id(36685118196316917)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(295455358557053551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(36896866213308591)
,p_name=>'Close Page 7 (Person Specific Dialog)'
,p_event_sequence=>280
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#ResourceMetrics1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(36896999786308592)
,p_event_id=>wwv_flow_imp.id(36896866213308591)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(280338074776789818)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16677515973673419)
,p_event_id=>wwv_flow_imp.id(36896866213308591)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(295455358557053551)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16677656460673420)
,p_event_id=>wwv_flow_imp.id(36896866213308591)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(287980977308240473)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37332789893710316)
,p_name=>'Change of Draft Invoice Number'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_DRAFT_NUMBER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37332938176710317)
,p_event_id=>wwv_flow_imp.id(37332789893710316)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(295455358557053551)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2694432496079739)
,p_event_id=>wwv_flow_imp.id(37332789893710316)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(295458260805053581)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37772852124699933)
,p_name=>'Click on Spell Check Button'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(276836940485554513)
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37773008727699934)
,p_event_id=>wwv_flow_imp.id(37772852124699933)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
' var grid_model = apex.region("ProjectCosts").widget().interactiveGrid("getViews", "grid").model;',
'	var records = grid_model.getTotalRecords();',
'	var narrative, expenditure_item_id;',
'	var wrongWords = { ''words'': [] };',
'	var wrongWordsJSON;',
'    var regex = /[!"#$%&''()*+,-/:;<=>?[\]^_`{|}~]/g;',
'	$s("P2_SPELL_RECORDS", "");',
'	if (records > 0) {',
'        setTimer();',
'		$.get(''#APP_IMAGES#en_US.aff'', function (affData) {',
'			$.get(''#APP_IMAGES#en_US.dic'', function (wordsData) {',
'				var dictionary = new Typo("en_US", affData, wordsData);',
'				grid_model.forEach(function (record, index, id) {',
'                    // Add Code for Progress Bar for Each Record',
'                    apex.item(''P2_RECORD_ID'').setValue((index/records)*100);',
'                    apex.server.process(''Insert_spellcheck_progress'', {',
'					pageItems: ''#P2_RECORD_ID''',
'				},',
'					{',
'						dataType: ''text'', success: function () {',
'                            void(0);',
'						}',
'					});',
'					narrative = grid_model.getValue(record, "NARRATIVE_BILLING_OVERFLOW");',
'					expenditure_item_id = grid_model.getValue(record, "EXPENDITURE_ITEM_ID");',
'					var split_array = narrative.split(" ");',
'					for (j = 0; j < split_array.length; j++) {',
'                        if (!validateEmail(split_array[j]))',
'                        {',
'                        split_array[j] = split_array[j].replace(regex,'''');',
'						if (!(dictionary.check(split_array[j]))) {',
'							//alert (''Error word :''+split_array[j]+ '' at index ''+index+'' \n Suggested: ''+dictionary.suggest(split_array[j]));',
'							wrongWords.words.push({',
'								"EXPENDITURE_ITEM_ID": expenditure_item_id,',
'                                "narrative": narrative,',
'								"Error_Word": split_array[j],',
'								"Suggested_Words": dictionary.suggest(split_array[j])',
'							});',
'                            //alert(wrongWords.length);',
'						}',
'					  }',
'                    }',
'				});',
'				wrongWordsJSON = JSON.stringify(wrongWords);',
'				apex.item(''P2_SPELL_RECORDS'').setValue(wrongWordsJSON);',
'				apex.server.process(''Insert_spellcheck_table'', {',
'					pageItems: ''#P2_SPELL_RECORDS''',
'				},',
'					{',
'						dataType: ''text'', success: function () {',
'                            endTimer();',
'							apex.region("spell_check_region").refresh();',
'                            apex.message.showPageSuccess( ''Spell Check Complete!!'');',
'						}',
'					})',
'			});',
'		});',
'	}',
'    else',
'    {',
'        apex.message.clearErrors();',
'',
'        apex.message.showErrors([',
'            {',
'                type: apex.message.TYPE.ERROR,',
'                location: ["page"],',
'                message: "No records to Spell Check!!",',
'                unsafe: false',
'                }',
'                ]);',
'    };',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37773294968699937)
,p_name=>'Fade the Messages'
,p_event_sequence=>310
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38083875248347988)
,p_event_id=>wwv_flow_imp.id(37773294968699937)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function() {',
'    $(''#APEX_SUCCESS_MESSAGE'').fadeOut(''fast'');',
'}, 3000);',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(26557418734945598)
,p_name=>'Refresh the Project Costs'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_PROJECT_NUMBER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26557537213945599)
,p_event_id=>wwv_flow_imp.id(26557418734945598)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(295455358557053551)
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27132597919421023)
,p_event_id=>wwv_flow_imp.id(26557418734945598)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(280338074776789818)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27132753908421024)
,p_event_id=>wwv_flow_imp.id(26557418734945598)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(26950721042941598)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27132789932421025)
,p_event_id=>wwv_flow_imp.id(26557418734945598)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(286627128443252196)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27132963117421026)
,p_event_id=>wwv_flow_imp.id(26557418734945598)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(286627754875252202)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27133009131421027)
,p_event_id=>wwv_flow_imp.id(26557418734945598)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(287980977308240473)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(21728346905658029)
,p_name=>'On Report Selection'
,p_event_sequence=>330
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_REPORT_SELECTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21729121099658037)
,p_event_id=>wwv_flow_imp.id(21728346905658029)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function setReportSelection(){',
'var selector = apex.item(''P2_REPORT_SELECTION'').getValue();',
'if (selector != ''Soft Costs''){',
'    await hideCol();',
'}',
'else{',
'    await viewCol();',
'}',
'apex.region("ProjectCosts").widget().interactiveGrid("getActions").invoke("refresh");',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21728405112658030)
,p_event_id=>wwv_flow_imp.id(21728346905658029)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(295455358557053551)
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15671920399406527)
,p_name=>'New'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(286623798576252162)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15672001872406528)
,p_event_id=>wwv_flow_imp.id(15671920399406527)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(295455358557053551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6502507158171636)
,p_name=>'New_1'
,p_event_sequence=>350
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9055770686988829)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6502616567171637)
,p_event_id=>wwv_flow_imp.id(6502507158171636)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2_LINKED_PROJECTS_COUNT'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'SELECT COUNT(*)',
'',
'      FROM',
'        XXGPMS_PROJECT_CONTRACT',
'      WHERE',
'        CONTRACT_NUMBER = NVL(:P2_AGREEMENT_NUMBER,CONTRACT_NUMBER)',
'      AND PROJECT_NUMBER = NVL(:P2_PROJECT_NUMBER,PROJECT_NUMBER)',
'      AND SESSION_ID = V(''APP_SESSION'')  ;'))
,p_attribute_07=>'P2_PROJECT_NUMBER,P2_AGREEMENT_NUMBER'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6502799067171639)
,p_event_id=>wwv_flow_imp.id(6502507158171636)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(".linkedProjects").text(apex.item("P2_LINKED_PROJECTS_COUNT").getValue());'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(294526721040727140)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(294520130727727109)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form GPMS Maint Screen'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>280541857917133443
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(295477959594097057)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(295455358557053551)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Project Costs - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>281493096470503360
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(287164669029877072)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(295458260805053581)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Milestone and Event Adjustments - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>273179805906283375
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(280335346773789791)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(276835019938554494)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Spell Checker Results - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>266350483650196094
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(23038307613582503)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update Invoice DFF'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_response_code number;',
'begin',
'  xx_gpms.UPDATE_INVOICE_HEADER_DFFS(:P2_CONTRACT_ID,null,null,v_response_code);',
'end;  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(23038250836582502)
,p_internal_uid=>9053444489988806
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(294526290962727140)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(294520130727727109)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form GPMS Maint Screen'
,p_process_when_type=>'NEVER'
,p_internal_uid=>280541427839133443
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(294211401173415295)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Parse JWT and Get Username'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_query_string varchar2(8500);',
'l_jwt_start_pos NUMBER;',
'l_jwt_arr APEX_APPLICATION_GLOBAL.VC_ARR2;',
'l_prn_json varchar2(10000);',
'l_web_url varchar2(200) := ''/fscmUI/HedTokenGenerationServlet?response_type=code'';',
'',
'begin',
'',
'XX_JWT_USERNAME();',
'l_query_string  := owa_util.get_cgi_env(''QUERY_STRING'');',
'XX_JWT_USERNAME1(l_query_string);',
'',
'',
'  l_jwt_start_pos := INSTR(l_query_string,''jwt='');',
'  XX_JWT_USERNAME1(l_jwt_start_pos);',
'  if l_jwt_start_pos <> 0 then ',
'    :G_JWT_BASE := SUBSTR(l_query_string, l_jwt_start_pos+4, 10000);',
'',
'    l_jwt_arr       := APEX_UTIL.STRING_TO_TABLE(:G_JWT_BASE, ''.'');',
'    :P2_SAAS_ACCESS_TOKEN := l_jwt_arr(2);',
'',
'       l_prn_json := UTL_ENCODE.TEXT_DECODE(l_jwt_arr(2), ''UTF8'', UTL_ENCODE.BASE64);',
'',
'       APEX_JSON.PARSE (l_prn_json);',
'      :P10_FUSION_USER := APEX_JSON.get_varchar2 (p_path => ''prn'');',
'      :P2_SAAS_USER := :P10_FUSION_USER;',
'',
'  else',
'    if :G_SAAS_ACCESS_URL IS NULL',
'    then',
'      select base_url ',
'      into   :G_SAAS_ACCESS_URL',
'       from prt_environments',
'       where organization_id in (',
'       select organization_id from prt_organizations',
'       where organization_name = :CLIENT)',
'       and environment_name = :ENV;',
'       ',
'      :G_JWT_BASE := ''OTBI'';     ',
'    end if;',
'          :G_JWT_BASE := ''OTBI'';       ',
'    end if;',
' IF :G_SAAS_ACCESS_TOKEN IS NOT NULL AND :G_SAAS_USER IS NOT NULL THEN',
'--    APEX_CUSTOM_AUTH.SET_USER(:G_SAAS_USER);',
'      APEX_CUSTOM_AUTH.DEFINE_USER_SESSION(p_user => :G_SAAS_USER',
'                                           ,p_session_id => :APP_SESSION);',
'--    apex_session.create_session (p_app_id => :APP_ID, p_page_id  => :APP_PAGE_ID, p_username => :G_SAAS_USER);',
' END IF;',
'  ',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>280226538049821598
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(280335426436789792)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OTBI Calling Process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2_SAAS_ACCESS_TOKEN IS NOT NULL AND :P2_SAAS_USER IS NOT NULL THEN',
'  APEX_CUSTOM_AUTH.SET_USER(:P2_SAAS_USER);',
'END IF;  '))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>266350563313196095
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41328260946208505)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get the Label Names'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
':P0_CLIENT := :CLIENT;',
':P0_ENV := :ENV;',
'',
'SELECT PROJECT_LABEL,TRUST_LABEL, RETAINER_LABEL',
'INTO   :P0_PROJECT_LABEL, :P0_TRUST_LABEL, :P0_RETAINER_LABEL',
'FROM   PRT_ENVIRONMENTS',
'WHERE  organization_id = (select organization_id ',
'from   prt_organizations ',
'where  upper(organization_name) = :P0_CLIENT)',
'and    environment_name = :P0_ENV;',
'',
'EXCEPTION',
'  when others then ',
'    :P0_PROJECT_LABEL := ''Project'';',
'    :P0_TRUST_LABEL := ''Trust'';',
'    :P0_RETAINER_LABEL := ''Retainer'';',
'end;',
'',
':P2_PROJECT_NUMBER_COPY := :P2_PROJECT_NUMBER;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>27343397822614808
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(21729033896658036)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get the WIP Categories'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_collection_name varchar2(100) := ''WIP_CATEGORY'';',
'  l_query varchar2(2000);',
'Begin',
' if (APEX_COLLECTION.COLLECTION_EXISTS ( p_collection_name => l_collection_name))',
' then',
'    APEX_COLLECTION.DELETE_COLLECTION(p_collection_name => l_collection_name);',
' end if;',
'',
' l_query := ''select distinct wip_category from xxgpms_project_costs ',
'               where SESSION_ID = ''||V(''SESSION'')||''',
'               AND NVL(DRAFT_INVOICE_NUMBER,-999) = NVL(''''''||:P2_DRAFT_NUMBER||'''''',NVL(DRAFT_INVOICE_NUMBER,-999))',
'               and  project_number = COALESCE(''''''||:P2_PROJECT_NUMBER||'''''',project_number)',
'               and  contract_number = nvl(''''''||:P2_AGREEMENT_NUMBER||'''''',contract_number)'';',
'    APEX_COLLECTION.CREATE_COLLECTION_FROM_QUERY (',
'        p_collection_name => l_collection_name, ',
'        p_query => l_query,',
'        p_generate_md5 => ''YES'');',
'',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>7744170773064339
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(276837383956554517)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert_spellcheck_table'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'execute immediate ''truncate table spell_check'';',
'EXECUTE IMMEDIATE ''TRUNCATE TABLE SPELL_CHECKER_DTL'';',
'if regexp_substr(:P2_SPELL_RECORDS,''[^[]+[]]'',1,1) is not null',
'then',
'insert into spell_check (json_value_new)',
'values (:P2_SPELL_RECORDS);',
'COMMIT;',
'INSERT INTO SPELL_CHECKER_DTL (EXP_ITEM_ID,ERROR_WORD,NARRATIVE,SUGGESTED_WORDS,USER_EMAIL)',
'WITH SPELL_CHECK_QUERY',
'AS',
'(select EXPENDITURE_ITEM_ID,ERROR_WORD,Narrative,',
'REPLACE(REPLACE(REPLACE(SUGGESTED_WORDS,''['',''''),'']'',''''),''"'','''') SUGGESTED_WORDS',
' from  json_table((SELECT JSON_VALUE_NEW FROM SPELL_CHECK),',
'''$''',
'        COLUMNS (',
'            NESTED PATH ''$.words[*]''',
'            COLUMNS (',
'                EXPENDITURE_ITEM_ID Number PATH ''$.EXPENDITURE_ITEM_ID'',',
'                Error_Word VARCHAR PATH ''$.Error_Word'',',
'                Suggested_words VARCHAR FORMAT JSON PATH ''$.Suggested_Words'',',
'                Narrative VARCHAR PATH ''$.narrative''',
'            )))',
')',
'SELECT EXPENDITURE_ITEM_ID,ERROR_WORD,Narrative,SUGGESTED_WORDS,:APP_USER',
'FROM SPELL_CHECK_QUERY SCQ',
'WHERE NOT EXISTS (SELECT 1 ',
'FROM SPELL_CHECK_EXCEPTIONS SCE',
'WHERE 1=1',
'AND (SCE.EXPENDITURE_ITEM_KEY = SCQ.EXPENDITURE_ITEM_ID',
'AND   SCE.WORD = SCQ.ERROR_WORD',
'AND   EXCEPTION_TYPE = ''I'')',
'OR (SCE.WORD = SCQ.ERROR_WORD',
'AND EXCEPTION_TYPE = ''P''',
'AND USER_EMAIL = :P2_SAAS_USER)',
'OR (SCE.WORD = SCQ.ERROR_WORD',
'AND EXCEPTION_TYPE = ''D''));',
'COMMIT;',
'',
'end if;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>262852520832960820
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(280335732125789795)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_ACCESS_TOKEN'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object;',
'begin',
'  :G_SAAS_ACCESS_TOKEN   := apex_application.g_x01;',
'  :G_SAAS_USER           := apex_application.g_x02;',
'  :G_SAAS_PREFERRED_NAME := apex_application.g_x03;',
'  :G_TIMESTAMP           := apex_application.g_x04;',
'  :G_TOKEN_DURATION      := apex_application.g_x05;',
'--   APEX_CUSTOM_AUTH.SET_USER(:P2_SAAS_USER);',
'  apex_json.write(''ok'',true);',
'exception',
'  when others then apex_json.write(''sqlerrm'',sqlerrm);',
'end;',
'apex_json.close_all;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>266350869002196098
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(279744778121405504)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert_spellcheckexceptions_table'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' INSERT INTO  SPELL_CHECK_EXCEPTIONS (WORD,EXPENDITURE_ITEM_KEY,EXCEPTION_TYPE)',
'    VALUES (:P2_ERR_WORD, :P2_EXP_ID,''D'');',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>265759914997811807
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41287874566175500)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Percentage_for_the_progress'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select percentage,message',
'into   :P0_PROGRESS_BAR2, :P0_PROGRESS_MESSAGE',
'from   progress_bar_entries',
'where  module = ''GET_WIP_LINES''',
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
,p_internal_uid=>27303011442581803
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
 p_id=>wwv_flow_imp.id(41288492208175506)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert_spellcheck_progress'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  PROGRESS_ENTRIES_LOGGER(:P2_RECORD_ID,''Spell Checking..'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>27303629084581809
);
wwv_flow_imp.component_end;
end;
/
