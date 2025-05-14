// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module pwm_generator (
  clk,
  ja_7,
  EN_A,
  led,
  led5_g,
  rpio_12_r,
  ar,
  led4_b
);

  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN pwm_generator_clk, INSERT_VIP 0" *)
  input clk;
  (* X_INTERFACE_IGNORE = "true" *)
  output ja_7;
  (* X_INTERFACE_IGNORE = "true" *)
  output EN_A;
  (* X_INTERFACE_IGNORE = "true" *)
  output [3:0]led;
  (* X_INTERFACE_IGNORE = "true" *)
  output led5_g;
  (* X_INTERFACE_IGNORE = "true" *)
  output rpio_12_r;
  (* X_INTERFACE_IGNORE = "true" *)
  input [4:0]ar;
  (* X_INTERFACE_IGNORE = "true" *)
  output led4_b;

  // stub module has no contents

endmodule
