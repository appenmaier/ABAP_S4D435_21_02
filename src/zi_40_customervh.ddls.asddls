@AbapCatalog.sqlViewName: 'ZI40CUSTVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Value Help: Customer'
define view ZI_40_CustomerVH
  as select from D435_I_Customer
{
  key Customer  as CustomerID,
      CustomerName,
      CustomerForm,
      @Semantics.text: true
      full_name as FullName,
      street,
      postbox,
      postcode,
      city,
      country,
      region,
      telephone,
      CustomerType,
      discount,
      langu,
      email,
      webuser
}
