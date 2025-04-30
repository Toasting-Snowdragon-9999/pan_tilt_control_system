// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module even_parity_checker (
  data_out,
  fail,
  pass,
  data_in,
  en
);

  (* X_INTERFACE_IGNORE = "true" *)
  output [7:0]data_out;
  (* X_INTERFACE_IGNORE = "true" *)
  output fail;
  (* X_INTERFACE_IGNORE = "true" *)
  output pass;
  (* X_INTERFACE_IGNORE = "true" *)
  input [8:0]data_in;
  (* X_INTERFACE_IGNORE = "true" *)
  input en;

  // stub module has no contents

endmodule
