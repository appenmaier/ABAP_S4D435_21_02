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

    createEnabled: true,
    updateEnabled: true,

    modelCategory: #BUSINESS_OBJECT,
    representativeKey: ['CarrierId', 'ConnectionId'],
    semanticKey: ['CarrierId', 'ConnectionId']
}
define view ZI_40_ConnectionTP
  as select from ZI_40_Connection
{
      @ObjectModel.mandatory: true
  key CarrierId,
      @ObjectModel.mandatory: true
  key ConnectionId,
      @ObjectModel.readOnly: true
      DepartureCountry,
      @ObjectModel.readOnly: true
      DepartureCity,
      @ObjectModel.mandatory: true
      DepartureAirport,
      @ObjectModel.readOnly: true
      ArrivalCountry,
      @ObjectModel.readOnly: true
      ArrivalCity,
      @ObjectModel.mandatory: true
      ArrivalAirport,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      FlightType,
      Period
}
