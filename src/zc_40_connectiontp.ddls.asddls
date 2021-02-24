@AbapCatalog.sqlViewName: 'ZC40CONN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Connection'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZC_40_ConnectionTP
  as select from ZI_40_ConnectionTP
{
  key CarrierId,
  key ConnectionId,
      DepartureCountry,
      DepartureCity,
      DepartureAirport,
      ArrivalCountry,
      ArrivalCity,
      ArrivalAirport,
      FlightTime,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      FlightType,
      Period
}
