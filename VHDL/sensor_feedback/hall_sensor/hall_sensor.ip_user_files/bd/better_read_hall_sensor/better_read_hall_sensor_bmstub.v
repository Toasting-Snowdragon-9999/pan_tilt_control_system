// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module better_read_hall_sensor (
  a_in_0,
  b_in_0,
  clk_0,
  count,
  c_out_0,
  dir,
  en
);

  (* X_INTERFACE_IGNORE = "true" *)
  input a_in_0;
  (* X_INTERFACE_IGNORE = "true" *)
  input b_in_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN better_read_hall_sensor_clk_0, INSERT_VIP 0" *)
  input clk_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output [10:0]count;
  (* X_INTERFACE_IGNORE = "true" *)
  output c_out_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output dir;
  (* X_INTERFACE_IGNORE = "true" *)
  output en;

  // stub module has no contents

endmodule
