@AbapCatalog.sqlViewName: 'ZHCG_5072_V_001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Halil Can Güder CDS Deneme 1'
define view ZHCGUDER_5072_DDL_001 
as select from mara
     left outer join makt on makt.matnr = mara.matnr
           and makt.spras = $session.system_language
{
    mara.matnr,
    makt.maktx
}
