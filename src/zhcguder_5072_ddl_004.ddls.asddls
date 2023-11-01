@AbapCatalog.sqlViewName: 'ZHCG_5072_V004'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Halil Can Güder CDS Ödev 2.2'
define view ZHCGUDER_5072_DDL_004 
    as select from zhcg_5072_v003 as cds
{
    
    key cds.vbeln,
//    sum(cds.conversion_netwr)                 as toplam_net_deger,
    cds.kunnrad                               as musteri_ad_soyad,
    count(*)                                  as toplam_fatura_adedi ,
//    division(cast( sum(cds2.conversion_netwr) as abap.curr( 10, 3 ) ), cast( count(*) as abap.int1 ), 3) as ortalama_miktar,
    substring(cds.fkdat, 1, 4)               as faturalama_yili,
    substring(cds.fkdat, 5, 2)               as faturalama_ayi,
    substring(cds.fkdat, 7, 2)               as faturalama_gunu,
    substring(cds.inco2_l,1,3)               as incoterm_yeri
    
}   group by cds.vbeln,
             cds.kunnrad,
             cds.fkdat,
             cds.inco2_l   
