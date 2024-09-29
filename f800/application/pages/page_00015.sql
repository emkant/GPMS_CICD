prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
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
 p_id=>15
,p_name=>'Matter Credits'
,p_alias=>'MATTER-CREDITS'
,p_page_mode=>'MODAL'
,p_step_title=>'Matter Credits'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1000'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41911700845623291)
,p_plug_name=>'Matter Credits'
,p_region_name=>'matterCredits'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(308406348131310813)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'XXGPMS_MATTER_CREDITS'
,p_query_where=>'SESSION_ID = V(''APP_SESSION'')'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Matter Credits'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(41911868357623291)
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
,p_internal_uid=>41911868357623291
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(41912107746623677)
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
 p_id=>wwv_flow_imp.id(41912562903623680)
,p_db_column_name=>'MATTER_NUMBER'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Matter Number'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(41912995234623680)
,p_db_column_name=>'CREDIT_TYPE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Credit Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(41913358103623680)
,p_db_column_name=>'BILLED'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Billed'
,p_column_html_expression=>'&P15_CURRENCY.#BILLED#'
,p_allow_sorting=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(41913793224623681)
,p_db_column_name=>'PAID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Paid'
,p_column_html_expression=>'&P15_CURRENCY.#PAID#'
,p_allow_sorting=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(41914116379623681)
,p_db_column_name=>'APPLIED'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Applied'
,p_column_html_expression=>'&P15_CURRENCY.#APPLIED#'
,p_allow_sorting=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(41914515455623681)
,p_db_column_name=>'AVAILABLE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Available'
,p_column_html_expression=>'&P15_CURRENCY.#AVAILABLE#'
,p_allow_sorting=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(41914900521623682)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Session ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(41915508223629010)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'419156'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'ID:MATTER_NUMBER:CREDIT_TYPE:BILLED:PAID:APPLIED:AVAILABLE:SESSION_ID'
,p_sum_columns_on_break=>'BILLED:PAID:APPLIED:AVAILABLE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38969251714064413)
,p_name=>'P15_CURRENCY'
,p_item_sequence=>90
,p_item_default=>'$'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38969382086064414)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(41911700845623291)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38969480736064415)
,p_event_id=>wwv_flow_imp.id(38969382086064414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// var i_selector = $(''#matterCredits tr td[headers="BILLED"]'');',
'// var i_currency = apex.item("PRJDET_CURRENCY").getValue();',
'// for (i=0;i<i_selector.length;i++)',
'// {',
'//     i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'// }',
'',
'',
'$(".a-IRR-aggregate.u-tR .a-IRR-aggregate-value").each(function(index){',
'    $(this)[0].innerHTML = currencyFormatter(Number($(this)[0].innerHTML),''&G_CURRENCY.'');',
'})'))
);
wwv_flow_imp.component_end;
end;
/
