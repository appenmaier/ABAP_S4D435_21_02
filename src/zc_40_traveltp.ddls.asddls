@AbapCatalog.sqlViewName: 'ZC40TRAVELTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Consumption View'

@VDM.viewType: #CONSUMPTION
@OData.publish: true

@Search.searchable: true

@Metadata.allowExtensions: true

@ObjectModel:{
    transactionalProcessingDelegated: true,
    semanticKey: ['TravelAgency', 'TravelNumber'] 
}
define view ZC_40_TravelTP
  as select from ZI_40_TravelTP
{
  key TravelAgency,
  key TravelNumber,

      @Search: { defaultSearchElement: true,
                 fuzzinessThreshold: 0.8
               }

      TravelDescription,
      Customer,
      StartDate,
      EndDate,
      Status,
      ChangedAt,
      ChangedBy
}
