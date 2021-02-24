class ZCL_ZC_40_CONNECTIONTP definition
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



CLASS ZCL_ZC_40_CONNECTIONTP IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~ZC_40_CONNECTIONTP| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20210224153912.
  endmethod.
ENDCLASS.
