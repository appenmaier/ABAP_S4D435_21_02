@AbapCatalog.sqlViewName: 'ZC40FLIGHT2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Flight'
define view ZC_40_Flight2
  as select from ZI_40_Flight2TP
  association [1] to ZC_40_ConnectionTP as _Connection on  $projection.carrid = _Connection.CarrierId
                                                       and $projection.connid = _Connection.ConnectionId
{
      @UI.lineItem: [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
  key carrid,
  key connid,
  key fldate,
      price,
      currency,
      planetype,
      seatsmax,
      seatsocc,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Connection
}
