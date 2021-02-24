@AbapCatalog.sqlViewName: 'ZC40FLIGHTCONN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Flight Connection'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel:{
    transactionalProcessingDelegated: true,
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZC_40_FlightConnection
  as select from ZI_40_FlightConnectionTP
  association [*] to ZC_40_Flight as _Flights on  $projection.CarrierID    = _Flights.CarrierID
                                              and $projection.ConnectionId = _Flights.ConnectionID
{
  key CarrierID,
  key ConnectionId,
      DepartureCountry,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.5
      DepartureCity,
      DepartureAirport,
      ArrivalCountry,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.5
      ArrivalCity,
      ArrivalAirport,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Flights
} 
 