@AbapCatalog.sqlViewName: 'ZI40FLIGHTCONN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Flight Connection'
@VDM.viewType: #BASIC
define view ZI_40_FlightConnection
  as select from spfli
{
  key carrid    as CarrierID,
  key connid    as ConnectionId,
      countryfr as DepartureCountry,
      cityfrom  as DepartureCity,
      airpfrom  as DepartureAirport,
      countryto as ArrivalCountry,
      cityto    as ArrivalCity,
      airpto    as ArrivalAirport,
      deptime   as DepartureTime,
      arrtime   as ArrivalTime,
      distance  as Distance,
      distid    as DistanceUnit
}
where
  fltype <> 'X' 
 