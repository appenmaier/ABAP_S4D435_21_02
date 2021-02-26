CLASS zcl_i_a_set_flight_type_to_x DEFINITION
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



CLASS zcl_i_a_set_flight_type_to_x IMPLEMENTATION.

  METHOD /bobf/if_frw_action~execute.
    DATA connections TYPE zti40_connectiontp1.

    io_read->retrieve(
      EXPORTING
        iv_node       = is_ctx-node_key
        it_key        = it_key
      IMPORTING
        eo_message    = eo_message
        et_data       = connections
        et_failed_key = et_failed_key ).

    LOOP AT connections REFERENCE INTO DATA(connection)
      WHERE flighttype <> 'X'.
      connection->flighttype = 'X'.

      io_modify->update(
        EXPORTING
          iv_node = is_ctx-node_key
          iv_key  = connection->key
          is_data = connection ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
