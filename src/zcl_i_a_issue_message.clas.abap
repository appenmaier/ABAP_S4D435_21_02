CLASS zcl_i_a_issue_message DEFINITION
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



CLASS zcl_i_a_issue_message IMPLEMENTATION.

  METHOD /bobf/if_frw_action~execute.
      IF eo_message IS NOT BOUND.
      eo_message = /bobf/cl_frw_factory=>get_message( ).
    ENDIF.

    DATA location TYPE /bobf/s_frw_location.
    location-node_key = is_ctx-node_key.

    DATA(message) = NEW zcm_40_travel(
      textid             = zcm_40_travel=>message1
      severity           = zcm_40_travel=>co_severity_info
      ms_origin_location = location ).

    eo_message->add_cm( message ).

    ev_static_action_failed = abap_false.
  ENDMETHOD.

ENDCLASS.
