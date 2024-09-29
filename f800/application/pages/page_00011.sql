prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_name=>'Invoice History'
,p_alias=>'INVOICE-HISTORY'
,p_page_mode=>'MODAL'
,p_step_title=>'Invoice History'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29657801806000234)
,p_plug_name=>'Invoice History'
,p_region_name=>'invHistory'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(308406348131310813)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NULL,',
'       ID,',
'       INVOICE_DATE,',
'       INVOICE_NUMBER,',
'       ADJUSTMENTS,',
'       INVOICE_AMOUNT,',
'       TAX,',
'       TOTAL_INVOICE_AMOUNT,',
'       OPEN_BALANCE,',
'       LAST_RECEIPT_DATE,',
'       SESSION_ID,',
'       CONTRACT_ID,',
'       INVOICE_ID,',
'       1 ord',
'  from XXGPMS_PROJECT_INVOICE_HISTORY',
' where session_id = v(''APP_SESSION'')',
' union ',
' select ''<b>Total</b>'',',
'         NULL,',
'         NULL,',
'         NULL,',
'        SUM(ADJUSTMENTS),',
'         SUM(INVOICE_AMOUNT),',
'         SUM(TAX),',
'         SUM(TOTAL_INVOICE_AMOUNT),',
'         SUM(OPEN_BALANCE),',
'         NULL,',
'         NULL,',
'         NULL,',
'         NULL,',
'         999 ord',
'    from XXGPMS_PROJECT_INVOICE_HISTORY',
' where session_id = v(''APP_SESSION'')   ',
' order by ord,invoice_date, invoice_number'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Invoice History'
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
 p_id=>wwv_flow_imp.id(29657940561000235)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_pivot=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'EMMANUEL.KANT@FRONTERACONSULTING.NET'
,p_internal_uid=>15673077437406538
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29658018295000236)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29658116743000237)
,p_db_column_name=>'INVOICE_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Invoice Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29658205599000238)
,p_db_column_name=>'INVOICE_NUMBER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Invoice Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29658337519000239)
,p_db_column_name=>'ADJUSTMENTS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Adjustments (Up/Down)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_static_id=>'ADJ'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29658393765000240)
,p_db_column_name=>'INVOICE_AMOUNT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Invoice Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_static_id=>'INV_AMT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29658561474000241)
,p_db_column_name=>'TAX'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tax'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_static_id=>'TAX'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29658596015000242)
,p_db_column_name=>'TOTAL_INVOICE_AMOUNT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Total Invoice Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_static_id=>'TIA'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29658666031000243)
,p_db_column_name=>'OPEN_BALANCE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Open Balance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_static_id=>'OPB'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29658858073000244)
,p_db_column_name=>'LAST_RECEIPT_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Last Receipt Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29658882992000245)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Session Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29659059492000246)
,p_db_column_name=>'CONTRACT_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Contract Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29659112946000247)
,p_db_column_name=>'INVOICE_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Invoice Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30660952396267101)
,p_db_column_name=>'NULL'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'&nbsp'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30661059780267102)
,p_db_column_name=>'ORD'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Ord'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(30656093220166233)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'166713'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_view_mode=>'REPORT'
,p_report_columns=>'NULL:INVOICE_DATE:INVOICE_NUMBER:ADJUSTMENTS:INVOICE_AMOUNT:TAX:TOTAL_INVOICE_AMOUNT:OPEN_BALANCE:LAST_RECEIPT_DATE:'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30660808983267100)
,p_name=>'P11_CURRENCY'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30660576566267098)
,p_name=>'Set the Currency Post refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(29657801806000234)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30660723659267099)
,p_event_id=>wwv_flow_imp.id(30660576566267098)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var i_selector = $("#invHistory tr td[headers=''INV_AMT'']");',
'var i_currency = apex.item("P11_CURRENCY").getValue();',
'console.log(''Starting at '',i_currency);',
'if (!i_currency){',
'    i_currency = apex.item(''PRJDET_CURRENCY'').getValue();',
'    console.log(''Currency is null so setting '',i_currency);',
'    apex.item(''P11_CURRENCY'').setValue(i_currency);',
'}',
'for (i=0;i<i_selector.length;i++)',
'{  ',
'    console.log(i_currency);',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'var i_selector = $("#invHistory tr td[headers=''TIA'']");',
'var i_currency = apex.item("P11_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{  ',
'    console.log(i_currency);',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'var i_selector = $("#invHistory tr td[headers=''TAX'']");',
'var i_currency = apex.item("P11_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{  ',
'    console.log(i_currency);',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'var i_selector = $("#invHistory tr td[headers=''ADJ'']");',
'var i_currency = apex.item("P11_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{  ',
'    console.log(i_currency);',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}',
'',
'var i_selector = $("#invHistory tr td[headers=''OPB'']");',
'var i_currency = apex.item("P11_CURRENCY").getValue();',
'for (i=0;i<i_selector.length;i++)',
'{  ',
'    console.log(i_currency);',
'    i_selector[i].innerHTML = currencyFormatter(Number(i_selector[i].innerHTML),i_currency);',
'}'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(32454513430901698)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'select distinct CURRENCY_CODE',
'into  :P11_CURRENCY',
'from  xxgpms_project_contract',
'where session_id = V(''APP_SESSION'');',
'exception',
'  when others then',
'    null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>18469650307308001
);
wwv_flow_imp.component_end;
end;
/
