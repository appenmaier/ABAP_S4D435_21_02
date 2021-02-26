@AbapCatalog.sqlViewName: 'ZI40TRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Interface View'

@VDM.viewType: #BASIC

define view ZI_40_Travel
  as select from z40_travel
  association [*] to ZI_40_TravelItem as _TravelItems on  $projection.TravelNumber = _TravelItems.TravelNumber
                                                      and $projection.TravelAgency = _TravelItems.TravelAgency
{
  key agencynum as TravelAgency,
  key travelid  as TravelNumber,
      trdesc    as TravelDescription,
      customid  as Customer,
      stdat     as StartDate,
      enddat    as EndDate,
      status    as Status,
      @Semantics.systemDateTime.lastChangedAt: true
      changedat as ChangedAt,
      @Semantics.user.lastChangedBy: true
      changedby as ChangedBy,
      _TravelItems
}
