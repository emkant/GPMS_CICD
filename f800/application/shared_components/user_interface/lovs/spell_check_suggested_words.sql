prompt --application/shared_components/user_interface/lovs/spell_check_suggested_words
begin
--   Manifest
--     SPELL_CHECK_SUGGESTED_WORDS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.1'
,p_default_workspace_id=>7335182145699007
,p_default_application_id=>150
,p_default_id_offset=>36844276540830363
,p_default_owner=>'WKSP_FRONGPMSTDEV'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(293328106137264941)
,p_lov_name=>'SPELL_CHECK_SUGGESTED_WORDS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH SPELL_CHECK_QUERY',
'AS',
'(select ROWNO,ERROR_WORD,REPLACE(REPLACE(REPLACE(SUGGESTED_WORDS,''['',''''),'']'',''''),''"'','''') SUGGESTED_WORDS',
' from  json_table((SELECT JSON_VALUE FROM SPELL_CHECK),',
'''$''',
'        COLUMNS (',
'            NESTED PATH ''$.words[*]''',
'            COLUMNS (',
'                RowNo Number PATH ''$.RowNo'',',
'                Error_Word VARCHAR PATH ''$.Error_Word'',',
'                Suggested_words VARCHAR FORMAT JSON PATH ''$.Suggested_Words''',
'            )))',
')',
'SELECT  REGEXP_SUBSTR(SUGGESTED_WORDS,''[^,]+'',1,LEVEL) D,',
'REGEXP_SUBSTR(SUGGESTED_WORDS,''[^,]+'',1,LEVEL) R',
'FROM SPELL_CHECK_QUERY',
'connect by  REGEXP_SUBSTR(SUGGESTED_WORDS,''[^,]+'',1,LEVEL) is not null',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
