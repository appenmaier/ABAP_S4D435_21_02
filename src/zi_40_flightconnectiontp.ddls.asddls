@AbapCatalog.sqlViewName: 'ZI40FLIGHTCONNTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View: Flight Connection'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel:{
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'Z40_FLIGHTCONN',

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,

    modelCategory: #BUSINESS_OBJECT,
    representativeKey: ['CarrierID', 'ConnectionId'],
    semanticKey: ['CarrierID', 'ConnectionId']
}
define view ZI_40_FlightConnectionTP
  as select from ZI_40_FlightConnection
  association [*] to ZI_40_FlightTP as _Flights on  $projection.CarrierID    = _Flights.CarrierID
                                                and $projection.ConnectionId = _Flights.ConnectionID
{
  key CarrierID,
  key ConnectionId,
      DepartureCountry,
      DepartureCity,
      DepartureAirport,
      ArrivalCountry,
      ArrivalCity,
      ArrivalAirport,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Flights
} 
 