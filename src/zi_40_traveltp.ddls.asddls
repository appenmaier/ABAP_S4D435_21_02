@AbapCatalog.sqlViewName: 'ZI40TRAVELTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Transactional View'

@VDM.viewType: #TRANSACTIONAL

@ObjectModel:{
    modelCategory: #BUSINESS_OBJECT,
    compositionRoot: true,
    representativeKey: 'TravelNumber',
    semanticKey: ['TravelAgency', 'TravelNumber'],
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'Z40_TRAVEL2',
    updateEnabled: true
}
define view ZI_40_TravelTP
  as select from ZI_40_Travel

{
      @ObjectModel.readOnly: true
  key TravelAgency,
      @ObjectModel.readOnly: true
  key TravelNumber,
      TravelDescription,
      @ObjectModel.mandatory: true
      Customer,
      @ObjectModel.mandatory: true
      StartDate,
      @ObjectModel.mandatory: true
      EndDate,
      @ObjectModel.readOnly: true
      Status,
      @Semantics.systemDateTime.lastChangedAt: true
      ChangedAt,
      @Semantics.user.lastChangedBy: true
      ChangedBy
}
