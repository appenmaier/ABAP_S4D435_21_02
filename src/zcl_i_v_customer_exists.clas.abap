CLASS zcl_i_v_customer_exists DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_v_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_validation~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_i_v_customer_exists IMPLEMENTATION.

  METHOD /bobf/if_frw_validation~execute.
    DATA travels TYPE zti40_traveltp1.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
      IMPORTING
        eo_message              = eo_message
        et_data                 = travels
        et_failed_key           = et_failed_key ).

    SELECT FROM scustom FIELDS id INTO TABLE @DATA(customer_ids).
    IF sy-subrc <> 0.
      "TODO: Message
    ENDIF.

    LOOP AT travels REFERENCE INTO DATA(travel).
      TRY.
          DATA(customer_id) = customer_ids[ id = travel->customer ].
        CATCH cx_sy_itab_line_not_found.
          et_failed_key = VALUE #( BASE et_failed_key ( key = travel->key ) ).
          IF eo_message IS NOT BOUND.
            eo_message = /bobf/cl_frw_factory=>get_message( ).
          ENDIF.
          DATA(message) = NEW zcm_40_travel(
            textid                  = zcm_40_travel=>customer_not_exist
            severity                = zcm_40_travel=>co_severity_error
            i_customer              = travel->customer ).
          eo_message->add_cm( message ).
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
