CLASS zcl_i_d_city_and_country DEFINITION
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



CLASS zcl_i_d_city_and_country IMPLEMENTATION.

  METHOD /bobf/if_frw_determination~execute.
    DATA connections TYPE zti40_connectiontp1.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
      IMPORTING
        eo_message              = eo_message
        et_data                 = connections
        et_failed_key           = et_failed_key ).

    LOOP AT connections REFERENCE INTO DATA(connection).
      SELECT SINGLE FROM scitairp FIELDS *
        WHERE airport = @connection->departureairport
        INTO @DATA(departure_location).
      connection->departurecity = departure_location-city.
      connection->departurecountry = departure_location-country.

      SELECT SINGLE FROM scitairp FIELDS *
        WHERE airport = @connection->arrivalairport
        INTO @DATA(arrival_location).
      connection->arrivalcity = arrival_location-city.
      connection->arrivalcountry = arrival_location-country.

      io_modify->update(
        EXPORTING
          iv_node           = is_ctx-node_key
          iv_key            = connection->key
          is_data           = connection ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
