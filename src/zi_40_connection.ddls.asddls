@AbapCatalog.sqlViewName: 'ZI40CONN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Connection'
@VDM.viewType: #BASIC
define view ZI_40_Connection
  as select from spfli
{
  key carrid    as CarrierId,
  key connid    as ConnectionId,
      countryfr as DepartureCountry,
      cityfrom  as DepartureCity,
      airpfrom  as DepartureAirport,
      countryto as ArrivalCountry,
      cityto    as ArrivalCity,
      airpto    as ArrivalAirport,
      fltime    as FlightTime,
      deptime   as DepartureTime,
      arrtime   as ArrivalTime,
      distance  as Distance,
      distid    as DistanceUnit,
      fltype    as FlightType,
      period    as Period
}
