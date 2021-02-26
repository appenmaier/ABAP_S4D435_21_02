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
    semanticKey: ['TravelAgency', 'TravelNumber'],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZC_40_TravelTP
  as select from ZI_40_TravelTP
  association [1] to ZI_40_CustomerVH   as _CustomerValueHelp on  $projection.Customer = _CustomerValueHelp.CustomerID
  association [*] to ZC_40_TravelItemTP as _TravelItems       on  $projection.TravelNumber = _TravelItems.TravelNumber
                                                              and $projection.TravelAgency = _TravelItems.TravelAgency
{
  key TravelAgency,
  key TravelNumber,

      @Search: { defaultSearchElement: true,
                 fuzzinessThreshold: 0.8
               }

      TravelDescription,
      @Consumption.valueHelp: '_CustomerValueHelp'
      Customer,
      StartDate,
      EndDate,
      Status,
      ChangedAt,
      ChangedBy,
      _CustomerValueHelp,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _TravelItems
}
