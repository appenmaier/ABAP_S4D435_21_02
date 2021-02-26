@AbapCatalog.sqlViewName: 'ZI40FLIGHTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View: Flight'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel:{
    writeActivePersistence: 'Z40_FLIGHT',

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,

    representativeKey: ['CarrierID', 'ConnectionId', 'FlightDate'],
    semanticKey: ['CarrierID', 'ConnectionId', 'FlightDate']
}
define view ZI_40_FlightTP
  as select from ZI_40_Flight
  association [1] to ZI_40_FlightConnectionTP as _FlightConnection on  $projection.CarrierID    = _FlightConnection.CarrierID
                                                                   and $projection.ConnectionID = _FlightConnection.ConnectionId
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
      Price,
      Currency,
      PlaneType,
      MaxSeats,
      OccupiedSeats,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _FlightConnection
} 
 