@AbapCatalog.sqlViewName: 'ZC40FLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Flight'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
@ObjectModel:{
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZC_40_Flight
  as select from ZI_40_FlightTP
  association [1] to ZC_40_FlightConnection as _FlightConnection on  $projection.CarrierID    = _FlightConnection.CarrierID
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
 