@AbapCatalog.sqlViewName: 'ZC40CONN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Connection'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@ObjectModel:{
    transactionalProcessingDelegated: true,
    updateEnabled: true
}
@Metadata.allowExtensions: true
define view ZC_40_ConnectionTP
  as select from ZI_40_ConnectionTP
  association [1] to ZI_40_Airport as _DepartureAirport on $projection.DepartureAirport = _DepartureAirport.Id
  association [1] to ZI_40_Airport as _ArrivalAirport   on $projection.ArrivalAirport = _ArrivalAirport.Id

{
  key CarrierId,
  key ConnectionId,
      @ObjectModel.readOnly: true
      DepartureCountry,
      @ObjectModel.readOnly: true
      DepartureCity,
      @ObjectModel.mandatory: true
      @ObjectModel.foreignKey.association: '_DepartureAirport'
      DepartureAirport,
      @ObjectModel.readOnly: true
      ArrivalCountry,
      @ObjectModel.readOnly: true
      ArrivalCity,
      @ObjectModel.mandatory: true
      @Consumption.valueHelp: '_ArrivalAirport'
      ArrivalAirport,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      FlightType,
      Period,
      _DepartureAirport,
      _ArrivalAirport
}
