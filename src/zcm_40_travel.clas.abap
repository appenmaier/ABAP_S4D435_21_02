CLASS zcm_40_travel DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cm_frw
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS:
      BEGIN OF message1,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '100',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF message1.

    CONSTANTS:
      BEGIN OF cancel_success,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '120',
        attr1 TYPE scx_attrname VALUE 'TRAVEL_NUMBER',
        attr2 TYPE scx_attrname VALUE 'START_DATE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF cancel_success.

    CONSTANTS:
      BEGIN OF already_cancelled,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '130',
        attr1 TYPE scx_attrname VALUE 'TRAVEL_NUMBER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF already_cancelled .

    CONSTANTS:
      BEGIN OF customer_not_exist,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '200',
        attr1 TYPE scx_attrname VALUE 'CUSTOMER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF customer_not_exist.

    CONSTANTS:
      BEGIN OF dates_wrong_sequence,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '210',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF dates_wrong_sequence.

    CONSTANTS:
      BEGIN OF end_date_past,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '220',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF end_date_past.

    CONSTANTS:
      BEGIN OF start_date_past,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '230',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF start_date_past.

    CONSTANTS:
      BEGIN OF class_invalid,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '300',
        attr1 TYPE scx_attrname VALUE 'FLIGHTCLASS',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF class_invalid.

    CONSTANTS:
      BEGIN OF flight_date_past,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '310',
        attr1 TYPE scx_attrname VALUE ' ',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF flight_date_past.

    CONSTANTS:
      BEGIN OF flight_not_exist,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '320',
        attr1 TYPE scx_attrname VALUE 'AIRLINEID',
        attr2 TYPE scx_attrname VALUE 'CONNECTIONNUMBER',
        attr3 TYPE scx_attrname VALUE 'FLIGHTDATE_TXT',
        attr4 TYPE scx_attrname VALUE '',
      END OF flight_not_exist.

    METHODS constructor
      IMPORTING
        !textid                  LIKE if_t100_message=>t100key OPTIONAL
        !previous                LIKE previous OPTIONAL
        !severity                TYPE ty_message_severity OPTIONAL
        !symptom                 TYPE ty_message_symptom OPTIONAL
        !lifetime                TYPE ty_message_lifetime DEFAULT co_lifetime_transition
        !ms_origin_location      TYPE /bobf/s_frw_location OPTIONAL
        !mt_environment_location TYPE /bobf/t_frw_location OPTIONAL
        !mv_act_key              TYPE /bobf/act_key OPTIONAL
        !mv_assoc_key            TYPE /bobf/obm_assoc_key OPTIONAL
        !mv_bopf_location        TYPE /bobf/conf_key OPTIONAL
        !mv_det_key              TYPE /bobf/det_key OPTIONAL
        !mv_query_key            TYPE /bobf/obm_query_key OPTIONAL
        !mv_val_key              TYPE /bobf/val_key OPTIONAL
        !i_travel_number         TYPE s_travelid OPTIONAL
        !i_start_date            TYPE s_stdat OPTIONAL
        !i_customer              TYPE s_customer OPTIONAL
        !i_flightclass           TYPE s_class OPTIONAL
        !i_airlineid             TYPE s_carr_id OPTIONAL
        !i_connectionnumber      TYPE s_conn_id OPTIONAL
        !i_flightdate            TYPE s_date OPTIONAL.

    DATA travel_number TYPE s_travelid.
    DATA start_date TYPE s_stdat.
    DATA customer       TYPE s_customer.
    DATA flightclass    TYPE s_class.
    DATA airlineid TYPE s_carr_id.
    DATA connectionnumber TYPE s_conn_id.
    DATA flightdate_txt     TYPE c LENGTH 10.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcm_40_travel IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous                = previous
        severity                = severity
        symptom                 = symptom
        lifetime                = lifetime
        ms_origin_location      = ms_origin_location
        mt_environment_location = mt_environment_location
        mv_act_key              = mv_act_key
        mv_assoc_key            = mv_assoc_key
        mv_bopf_location        = mv_bopf_location
        mv_det_key              = mv_det_key
        mv_query_key            = mv_query_key
        mv_val_key              = mv_val_key.
    CLEAR me->textid.

    travel_number = i_travel_number.
    start_date = i_start_date.
    customer =  i_customer.
    flightclass = i_flightclass.
    airlineid = i_airlineid.
    connectionnumber = i_connectionnumber.
    flightdate_txt = i_flightdate.

    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
