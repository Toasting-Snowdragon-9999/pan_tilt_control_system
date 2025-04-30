// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module even_parity_checker (
  data_out_0,
  fail_0,
  pass_0,
  data
);

  (* X_INTERFACE_IGNORE = "true" *)
  output [7:0]data_out_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output fail_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output pass_0;
  (* X_INTERFACE_IGNORE = "true" *)
  input [8:0]data;

  // stub module has no contents

endmodule
