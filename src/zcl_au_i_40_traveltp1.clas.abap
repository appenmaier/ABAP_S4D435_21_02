CLASS zcl_au_i_40_traveltp1 DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_auth_draft_active
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_lib_auth_draft_active~check_instance_authority
        REDEFINITION .
    METHODS /bobf/if_lib_auth_draft_active~check_static_authority
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_au_i_40_traveltp1 IMPLEMENTATION.


  METHOD /bobf/if_lib_auth_draft_active~check_instance_authority.
    DATA travels TYPE zti40_traveltp1.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
      IMPORTING
        eo_message              = eo_message
        et_data                 = travels
        et_failed_key           = et_failed_key ).

    IF eo_message IS NOT BOUND.
      eo_message = /bobf/cl_frw_factory=>get_message( ).
    ENDIF.

    IF is_ctx-activity = sc_activity-change OR
     ( is_ctx-activity = sc_activity-execute AND is_ctx-action_name = 'SET_TO_CANCELLED' ).
      LOOP AT travels REFERENCE INTO DATA(travel).
        AUTHORITY-CHECK OBJECT 'S_AGENCY'
            ID 'AGENCYNUM' FIELD travel->travelagency
            ID 'ACTVT' FIELD '02'.
        IF sy-subrc <> 0.
          DATA(message) = NEW zcm_40_travel(
            textid                  = zcm_40_travel=>message1
            severity                = zcm_40_travel=>co_severity_error ).
*          i_travel_number         = ).

          eo_message->add_cm(  message ).
          et_failed_key = VALUE #( BASE et_failed_key ( key = travel->key ) ).
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.


  METHOD /bobf/if_lib_auth_draft_active~check_static_authority.
  ENDMETHOD.

ENDCLASS.
