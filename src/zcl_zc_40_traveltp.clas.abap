class ZCL_ZC_40_TRAVELTP definition
  public
  inheriting from CL_SADL_GTK_EXPOSURE_MPC
  final
  create public .

public section.
protected section.

  methods GET_PATHS
    redefinition .
  methods GET_TIMESTAMP
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZC_40_TRAVELTP IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~ZC_40_TRAVELTP| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20210225082014.
  endmethod.
ENDCLASS.
