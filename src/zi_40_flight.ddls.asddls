@AbapCatalog.sqlViewName: 'ZI40FLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Flight'
@VDM.viewType: #BASIC
define view ZI_40_Flight
  as select from sflight
{
  key carrid    as CarrierID,
  key connid    as ConnectionID,
  key fldate    as FlightDate,
      price     as Price,
      currency  as Currency,
      planetype as PlaneType,
      seatsmax  as MaxSeats,
      seatsocc  as OccupiedSeats
} 
 