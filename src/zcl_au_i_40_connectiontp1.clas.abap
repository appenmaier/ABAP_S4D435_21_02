CLASS zcl_au_i_40_connectiontp1 DEFINITION
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



CLASS zcl_au_i_40_connectiontp1 IMPLEMENTATION.

  METHOD /bobf/if_lib_auth_draft_active~check_instance_authority.
    DATA connections TYPE zti40_connectiontp1.

    io_read->retrieve(
      EXPORTING
        iv_node       = is_ctx-node_key
        it_key        = it_key
      IMPORTING
        eo_message    = eo_message
        et_data       = connections
        et_failed_key = et_failed_key ).

    IF is_ctx-activity = sc_activity-change
     OR ( is_ctx-activity = sc_activity-execute AND is_ctx-action_name = 'SET_FLIGHT_TYPE_TO_X' ).
      LOOP AT connections REFERENCE INTO DATA(connection).
        AUTHORITY-CHECK OBJECT 'S_CARRID'
           ID 'CARRID' FIELD connection->carrierid
           ID 'ACTVT' FIELD '02'.
        IF sy-subrc <> 0.
          et_failed_key = VALUE #( BASE et_failed_key ( key = connection->key ) ).
        ENDIF.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.

  METHOD /bobf/if_lib_auth_draft_active~check_static_authority.
  ENDMETHOD.

ENDCLASS.
