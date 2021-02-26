@AbapCatalog.sqlViewName: 'ZI40AIRPORT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Value Help: Airport'
define view ZI_40_Airport
  as select from sairport
{
//      @ObjectModel.text.element: ['Name']
  key id   as Id,
//      @Semantics.text: true
      name as Name
}
