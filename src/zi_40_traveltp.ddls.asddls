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
    writeActivePersistence: 'Z40_TRAVEL2'
}
define view ZI_40_TravelTP
  as select from ZI_40_Travel

{
  key TravelAgency,
  key TravelNumber,
      TravelDescription,
      Customer,
      StartDate,
      EndDate,
      Status,
      ChangedAt,
      ChangedBy
}
