prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Inter Matter WIP'
,p_alias=>'INTER-MATTER-WIP'
,p_page_mode=>'MODAL'
,p_step_title=>'Inter Matter WIP'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1000'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(52612976582860429)
,p_plug_name=>'Inter Project WIP'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(308408320642310814)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       PROJECT_NUMBER,',
'       LABOR_WIP,',
'       FEES_WIP,',
'       HARD_WIP,',
'       SOFT_WIP,',
'       labor_wip+fees_wip+hard_wip+soft_wip total,',
'       SESSION_ID',
'  from XXGPMS_INTERPROJECTS',
'  WHERE SESSION_ID = V(''APP_SESSION'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Matter Credits'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(52613144094860429)
,p_name=>'Matter Credits'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'EMMANUEL.KANT@FRONTERACONSULTING.NET'
,p_internal_uid=>52613144094860429
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52613383483860815)
,p_db_column_name=>'ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(52616176258860820)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Session ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38970018321064421)
,p_db_column_name=>'PROJECT_NUMBER'
,p_display_order=>18
,p_column_identifier=>'I'
,p_column_label=>'Project Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38970177629064422)
,p_db_column_name=>'LABOR_WIP'
,p_display_order=>28
,p_column_identifier=>'J'
,p_column_label=>'Labor'
,p_column_html_expression=>'&P16_CURRENCY.#LABOR_WIP#'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38970210037064423)
,p_db_column_name=>'FEES_WIP'
,p_display_order=>38
,p_column_identifier=>'K'
,p_column_label=>'Fees'
,p_column_html_expression=>'&P16_CURRENCY.#FEES_WIP#'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38970439649064425)
,p_db_column_name=>'SOFT_WIP'
,p_display_order=>48
,p_column_identifier=>'M'
,p_column_label=>'Soft Costs'
,p_column_html_expression=>'&P16_CURRENCY.#SOFT_WIP#'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38970356193064424)
,p_db_column_name=>'HARD_WIP'
,p_display_order=>58
,p_column_identifier=>'L'
,p_column_label=>'Hard Costs'
,p_column_html_expression=>'&P16_CURRENCY.#HARD_WIP#'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38971480503064435)
,p_db_column_name=>'TOTAL'
,p_display_order=>68
,p_column_identifier=>'N'
,p_column_label=>'Total'
,p_column_html_expression=>'&P16_CURRENCY.#TOTAL#'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(52616783960866148)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'419156'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'PROJECT_NUMBER:FEES_WIP:HARD_WIP:LABOR_WIP:SOFT_WIP:TOTAL:'
,p_sum_columns_on_break=>'FEES_WIP:HARD_WIP:LABOR_WIP:SOFT_WIP:TOTAL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38971757295064438)
,p_name=>'P16_CURRENCY_CODE'
,p_item_sequence=>110
,p_use_cache_before_default=>'NO'
,p_item_default=>'G_CURRENCY'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49674196305301655)
,p_name=>'P16_CURRENCY'
,p_item_sequence=>100
,p_item_default=>'select get_currency(:G_CURRENCY) FROM DUAL;'
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10705363620237246)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(52612976582860429)
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10705832861237249)
,p_event_id=>wwv_flow_imp.id(10705363620237246)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(52612976582860429)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i_selector = $(''#matterCredits tr td[headers="BILLED"]'');',
'var i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'',
'$(".a-IRR-aggregate.u-tR .a-IRR-aggregate-value").each(function(index){',
'    $(this)[0].innerHTML = currencyFormatter(Number($(this)[0].innerHTML),''&G_CURRENCY.'');',
'})'))
);
wwv_flow_imp.component_end;
end;
/
