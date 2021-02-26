CLASS zcl_i_d_travelagency DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_i_d_travelagency IMPLEMENTATION.

  METHOD /bobf/if_frw_determination~execute.
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
      DATA(travel_agency) = cl_s4d435_model=>get_agency_by_user( ).

      travel->travelagency = travel_agency.

      io_modify->update(
        EXPORTING
          iv_node = is_ctx-node_key
          iv_key  = travel->key
          is_data = travel
          it_changed_fields = VALUE #( ( zif_i_40_traveltp1_c=>sc_node_attribute-zi_40_traveltp-travelagency ) ) ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
