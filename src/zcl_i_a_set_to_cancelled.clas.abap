CLASS zcl_i_a_set_to_cancelled DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_action~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_i_a_set_to_cancelled IMPLEMENTATION.

  METHOD /bobf/if_frw_action~execute.
    DATA travels TYPE zti40_traveltp1.

    io_read->retrieve(
      EXPORTING
        iv_node       = is_ctx-node_key
        it_key        = it_key
      IMPORTING
        eo_message    = eo_message
        et_data       = travels
        et_failed_key = et_failed_key ).

    IF eo_message IS NOT BOUND.
      eo_message = /bobf/cl_frw_factory=>get_message( ).
    ENDIF.

    LOOP AT travels REFERENCE INTO DATA(travel).
      DATA location TYPE /bobf/s_frw_location.
      location-node_key = is_ctx-node_key.
      location-bo_key = is_ctx-bo_key.
      location-key = travel->key.
      IF travel->status = 'C'.
        DATA(message) = NEW cm_devs4d435(
          textid             = cm_devs4d435=>already_cancelled
          severity           = cm_devs4d435=>co_severity_error
          ms_origin_location = location ).

        eo_message->add_cm( message ).
        CONTINUE.
      ENDIF.
      travel->status = 'C'.

      io_modify->update(
        EXPORTING
          iv_node = is_ctx-node_key
          iv_key  = travel->key
          is_data = travel ).

      DATA(message2) = NEW zcm_40_travel(
        textid             = zcm_40_travel=>cancel_success
        severity           = zcm_40_travel=>co_severity_success
        ms_origin_location = location
        i_travel_number       = travel->travelnumber
        i_start_date          = travel->startdate ).

      eo_message->add_cm( message2 ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
