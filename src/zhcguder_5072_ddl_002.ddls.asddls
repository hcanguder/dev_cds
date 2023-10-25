@AbapCatalog.sqlViewName: 'ZHCG_5072_V002'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Halil Can Güder Örnek CDS-1'
define view ZHCGUDER_5072_DDL_002 
as select from ekko
     inner join ekpo on ekpo.ebeln = ekko.ebeln
     inner join mara on mara.matnr = ekpo.matnr
     inner join lfa1 on lfa1.lifnr = ekko.lifnr
left outer join makt on makt.matnr = mara.matnr
                    and makt.spras = $session.system_language
{
    ekpo.ebeln,
    ekpo.ebelp,
    ekpo.matnr,
    makt.maktx,
    ekpo.werks,
    ekpo.lgort,
    ekpo.meins,
    lfa1.lifnr,
    lfa1.name1,
    concat(lfa1.stras, lfa1.mcod3) as satici_adresi
}
