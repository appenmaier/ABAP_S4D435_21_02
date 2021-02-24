interface ZIF_I_40_FLIGHTCONNECTIONTP1_C
  public .


  interfaces /BOBF/IF_LIB_CONSTANTS .

  constants:
    BEGIN OF SC_ACTION,
      BEGIN OF ZI_40_FLIGHTCONNECTIONTP,
 CREATE_ZI_40_FLIGHTCONNECTIONT TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F49ADEDEB50A',
 DELETE_ZI_40_FLIGHTCONNECTIONT TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F49ADEDF350A',
 LOCK_ZI_40_FLIGHTCONNECTIONTP  TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F49ADEDDF50A',
 SAVE_ZI_40_FLIGHTCONNECTIONTP  TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F49ADEDFB50A',
 UNLOCK_ZI_40_FLIGHTCONNECTIONT TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F49ADEDE350A',
 UPDATE_ZI_40_FLIGHTCONNECTIONT TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F49ADEDEF50A',
 VALIDATE_ZI_40_FLIGHTCONNECTIO TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F49ADEDF750A',
      END OF ZI_40_FLIGHTCONNECTIONTP,
      BEGIN OF ZI_40_FLIGHTTP,
 CREATE_ZI_40_FLIGHTTP          TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F4F72A53550A',
 DELETE_ZI_40_FLIGHTTP          TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F4F72A53D50A',
 SAVE_ZI_40_FLIGHTTP            TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F4F72A54550A',
 UPDATE_ZI_40_FLIGHTTP          TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F4F72A53950A',
 VALIDATE_ZI_40_FLIGHTTP        TYPE /BOBF/ACT_KEY VALUE '005056044E851EDB9DD5F4F72A54150A',
      END OF ZI_40_FLIGHTTP,
    END OF SC_ACTION .
  constants:
    BEGIN OF SC_ACTION_ATTRIBUTE,
        BEGIN OF ZI_40_FLIGHTCONNECTIONTP,
        BEGIN OF LOCK_ZI_40_FLIGHTCONNECTIONTP,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
 LEGACY_DAC_KEY                 TYPE STRING VALUE 'LEGACY_DAC_KEY',
        END OF LOCK_ZI_40_FLIGHTCONNECTIONTP,
        BEGIN OF UNLOCK_ZI_40_FLIGHTCONNECTIONT,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
 LEGACY_DAC_KEY                 TYPE STRING VALUE 'LEGACY_DAC_KEY',
        END OF UNLOCK_ZI_40_FLIGHTCONNECTIONT,
      END OF ZI_40_FLIGHTCONNECTIONTP,
    END OF SC_ACTION_ATTRIBUTE .
  constants:
    BEGIN OF SC_ALTERNATIVE_KEY,
      BEGIN OF ZI_40_FLIGHTCONNECTIONTP,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '005056044E851EDB9DD5F4F72A49350A',
      END OF ZI_40_FLIGHTCONNECTIONTP,
      BEGIN OF ZI_40_FLIGHTTP,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '005056044E851EDB9DD5F4F72A49750A',
 PARENT_KEY                     TYPE /BOBF/OBM_ALTKEY_KEY VALUE '005056044E851EDB9DD5F4F72A49950A',
      END OF ZI_40_FLIGHTTP,
    END OF SC_ALTERNATIVE_KEY .
  constants:
    BEGIN OF SC_ASSOCIATION,
      BEGIN OF ZI_40_FLIGHTCONNECTIONTP,
 LOCK                           TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F49ADEDDD50A',
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F49ADEDD950A',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F49ADEDE950A',
 _FLIGHTS                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F4F72A52950A',
      END OF ZI_40_FLIGHTCONNECTIONTP,
      BEGIN OF ZI_40_FLIGHTCONNECTIONTP_LOCK,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F49ADEE0150A',
      END OF ZI_40_FLIGHTCONNECTIONTP_LOCK,
      BEGIN OF ZI_40_FLIGHTCONNECTIONTP_MESSA,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F49ADEDFF50A',
      END OF ZI_40_FLIGHTCONNECTIONTP_MESSA,
      BEGIN OF ZI_40_FLIGHTCONNECTIONTP_PROPE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F49ADEE0350A',
      END OF ZI_40_FLIGHTCONNECTIONTP_PROPE,
      BEGIN OF ZI_40_FLIGHTTP,
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F4F72A52F50A',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F4F72A53350A',
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F4F72A54950A',
 TO_ROOT                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F4F72A54B50A',
      END OF ZI_40_FLIGHTTP,
      BEGIN OF ZI_40_FLIGHTTP_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F4F72A54D50A',
      END OF ZI_40_FLIGHTTP_MESSAGE,
      BEGIN OF ZI_40_FLIGHTTP_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '005056044E851EDB9DD5F4F72A54F50A',
      END OF ZI_40_FLIGHTTP_PROPERTY,
    END OF SC_ASSOCIATION .
  constants:
    BEGIN OF SC_ASSOCIATION_ATTRIBUTE,
      BEGIN OF ZI_40_FLIGHTCONNECTIONTP,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZI_40_FLIGHTCONNECTIONTP,
      BEGIN OF ZI_40_FLIGHTTP,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZI_40_FLIGHTTP,
    END OF SC_ASSOCIATION_ATTRIBUTE .
  constants:
    SC_BO_KEY  TYPE /BOBF/OBM_BO_KEY VALUE '005056044E851EDB9DD5F4784C19350A' .
  constants:
    SC_BO_NAME TYPE /BOBF/OBM_NAME VALUE 'ZI_40_FLIGHTCONNECTIONTP' .
  constants:
    BEGIN OF SC_DETERMINATION,
      BEGIN OF ZI_40_FLIGHTCONNECTIONTP,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '005056044E851EDB9DD5F4F72A49550A',
      END OF ZI_40_FLIGHTCONNECTIONTP,
      BEGIN OF ZI_40_FLIGHTTP,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '005056044E851EDB9DD5F4F72A49B50A',
      END OF ZI_40_FLIGHTTP,
    END OF SC_DETERMINATION .
  constants:
    SC_MODEL_VERSION TYPE /BOBF/CONF_VERSION VALUE '00000' .
  constants:
    BEGIN OF SC_NODE,
 ZI_40_FLIGHTCONNECTIONTP       TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD5F49ADEDD350A',
 ZI_40_FLIGHTCONNECTIONTP_LOCK  TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD5F49ADEDDB50A',
 ZI_40_FLIGHTCONNECTIONTP_MESSA TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD5F49ADEDD750A',
 ZI_40_FLIGHTCONNECTIONTP_PROPE TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD5F49ADEDE750A',
 ZI_40_FLIGHTTP                 TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD5F4D1E6D2D50A',
 ZI_40_FLIGHTTP_MESSAGE         TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD5F4F72A52D50A',
 ZI_40_FLIGHTTP_PROPERTY        TYPE /BOBF/OBM_NODE_KEY VALUE '005056044E851EDB9DD5F4F72A53150A',
    END OF SC_NODE .
  constants:
    BEGIN OF SC_NODE_ATTRIBUTE,
      BEGIN OF ZI_40_FLIGHTCONNECTIONTP,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  CARRIERID                      TYPE STRING VALUE 'CARRIERID',
  CONNECTIONID                   TYPE STRING VALUE 'CONNECTIONID',
  DEPARTURECOUNTRY               TYPE STRING VALUE 'DEPARTURECOUNTRY',
  DEPARTURECITY                  TYPE STRING VALUE 'DEPARTURECITY',
  DEPARTUREAIRPORT               TYPE STRING VALUE 'DEPARTUREAIRPORT',
  ARRIVALCOUNTRY                 TYPE STRING VALUE 'ARRIVALCOUNTRY',
  ARRIVALCITY                    TYPE STRING VALUE 'ARRIVALCITY',
  ARRIVALAIRPORT                 TYPE STRING VALUE 'ARRIVALAIRPORT',
  DEPARTURETIME                  TYPE STRING VALUE 'DEPARTURETIME',
  ARRIVALTIME                    TYPE STRING VALUE 'ARRIVALTIME',
  DISTANCE                       TYPE STRING VALUE 'DISTANCE',
  DISTANCEUNIT                   TYPE STRING VALUE 'DISTANCEUNIT',
      END OF ZI_40_FLIGHTCONNECTIONTP,
      BEGIN OF ZI_40_FLIGHTTP,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  CARRIERID                      TYPE STRING VALUE 'CARRIERID',
  CONNECTIONID                   TYPE STRING VALUE 'CONNECTIONID',
  FLIGHTDATE                     TYPE STRING VALUE 'FLIGHTDATE',
  PRICE                          TYPE STRING VALUE 'PRICE',
  CURRENCY                       TYPE STRING VALUE 'CURRENCY',
  PLANETYPE                      TYPE STRING VALUE 'PLANETYPE',
  MAXSEATS                       TYPE STRING VALUE 'MAXSEATS',
  OCCUPIEDSEATS                  TYPE STRING VALUE 'OCCUPIEDSEATS',
      END OF ZI_40_FLIGHTTP,
    END OF SC_NODE_ATTRIBUTE .
  constants:
    BEGIN OF SC_NODE_CATEGORY,
      BEGIN OF ZI_40_FLIGHTCONNECTIONTP,
 ROOT                           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '005056044E851EDB9DD5F49ADEDD550A',
      END OF ZI_40_FLIGHTCONNECTIONTP,
      BEGIN OF ZI_40_FLIGHTTP,
 ZI_40_FLIGHTTP                 TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '005056044E851EDB9DD5F4F72A52750A',
      END OF ZI_40_FLIGHTTP,
    END OF SC_NODE_CATEGORY .
endinterface.