CLASS zcl_i_v_airport_validation DEFINITION
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



CLASS zcl_i_v_airport_validation IMPLEMENTATION.

  METHOD /bobf/if_frw_validation~execute.
    DATA connections TYPE zti40_connectiontp1.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
      IMPORTING
        eo_message              = eo_message
        et_data                 = connections
        et_failed_key           = et_failed_key ).

    SELECT FROM zi_40_airport FIELDS id INTO TABLE @DATA(airport_ids).
    IF sy-subrc <> 0.
      "TODO: Message
    ENDIF.

    LOOP AT connections REFERENCE INTO DATA(connection).
      TRY.
          DATA(airport_id) = airport_ids[ id = connection->departureairport ].
          airport_id = airport_ids[ id = connection->arrivalairport ].
        CATCH cx_sy_itab_line_not_found.
          "TODO: Message
          et_failed_key = VALUE #( BASE et_failed_key ( key = connection->key ) ).
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
