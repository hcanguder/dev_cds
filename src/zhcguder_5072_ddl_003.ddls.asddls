@AbapCatalog.sqlViewName: 'ZHCG_5072_V003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Halil Can Güder CDS Ödev 2'
define view ZHCGUDER_5072_DDL_003 
    as select from vbrp
        inner join vbrk on vbrk.vbeln = vbrp.vbeln
        inner join mara on mara.matnr = vbrp.matnr
   left outer join vbak on vbak.vbeln = vbrp.aubel
   left outer join kna1 on kna1.kunnr = vbak.kunnr
   left outer join makt on makt.matnr = mara.matnr
                       and makt.spras = $session.system_language
{
    key vbrp.vbeln,
    key vbrp.posnr,
        vbrp.aubel,
        vbrp.aupos,
        vbak.kunnr,
        concat_with_space( kna1.name1, kna1.name2, 1 ) as kunnrAd,
    
//        @Semantics.amount.currencyCode: 'vbrp.netwr' 
        
        
//        CURRENCY_CONVERSION(
//            amount              => vbrp.netwr,
//            source_currency     => vbrk.waerk,
//            target_currency     => cast( 'EUR' as abap.cuky ),
//            exchange_rate_date  => vbrk.fkdat ) as conversion_netwr,
        left(vbak.kunnr, 3)    as left_kunnr,
        length(mara.matnr)     as matnr_length, 
    case	
       when vbrk.fkart = 'FAS' then 'Peşinat talebi iptali'
       when vbrk.fkart = 'FAZ' then 'Peşinat talebi'
       else 'Fatura' end as Faturalama_Turu,
     vbrk.fkdat,
     vbrk.inco2_l
}
