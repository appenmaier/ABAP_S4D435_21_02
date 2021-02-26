@AbapCatalog.sqlViewName: 'ZI40FLIGHT2TP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View: Flight'
@ObjectModel:{
//    compositionRoot: true,
//    transactionalProcessingEnabled: true,
    writeActivePersistence: 'SFLIGHT',

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,

//    modelCategory: #BUSINESS_OBJECT,
    representativeKey: ['CARRID', 'CONNID', 'FLDATE'],
    semanticKey: ['CARRID', 'CONNID', 'FLDATE']
}
define view ZI_40_Flight2TP
  as select from ZI_40_Flight2
  association [1] to ZI_40_ConnectionTP as _Connection on  $projection.carrid = _Connection.CarrierId
                                                       and $projection.connid = _Connection.ConnectionId
{
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
