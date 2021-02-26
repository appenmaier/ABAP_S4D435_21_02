@AbapCatalog.sqlViewName: 'ZI40TRITEMTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Item Transactional View'

@VDM.viewType: #TRANSACTIONAL

@ObjectModel:{
    writeActivePersistence: 'Z40_TRAVELITEMV',

    createEnabled: true
}

define view ZI40_TravelItemTP
  as select from ZI_40_TravelItem
  association [1] to ZI_40_TravelTP as _Travel on  $projection.TravelNumber = _Travel.TravelNumber
                                               and $projection.TravelAgency = _Travel.TravelAgency
{

       @ObjectModel.readOnly: true
  key  TravelAgency,
       @ObjectModel.readOnly: true
  key  TravelNumber,
       @ObjectModel.readOnly: true
       ItemNumber,
       TravelGuid,
       @ObjectModel.mandatory: true
       AirlineID,
       @ObjectModel.mandatory: true
       ConnectionNumber,
       @ObjectModel.mandatory: true
       FlightDate,
       @ObjectModel.readOnly: true
       BookingNumber,
       @ObjectModel.mandatory: true
       FlightClass,
       @ObjectModel.mandatory: true
       PassengerName,
       CreatedAt,
       CreatedBy,
       ChangedAt,
       ChangedBy,
       @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
       _Travel
}
