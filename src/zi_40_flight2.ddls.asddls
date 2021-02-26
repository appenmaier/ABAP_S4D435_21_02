@AbapCatalog.sqlViewName: 'ZI40FLIGHT2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Flight'
define view ZI_40_Flight2
  as select from sflight
{
  key carrid,
  key connid,
  key fldate,
      price,
      currency,
      planetype,
      seatsmax,
      seatsocc
}
