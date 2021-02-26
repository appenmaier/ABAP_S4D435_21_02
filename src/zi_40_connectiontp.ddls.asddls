@AbapCatalog.sqlViewName: 'ZI40CONNTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View: Connection'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel: {
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'Z40_CONNECTION',
    
    updateEnabled: true,

    modelCategory: #BUSINESS_OBJECT,
    representativeKey: ['CarrierId', 'ConnectionId'],
    semanticKey: ['CarrierId', 'ConnectionId']
}
define view ZI_40_ConnectionTP
  as select from ZI_40_Connection
{
  key CarrierId,
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
      FlightType,
      Period
}
