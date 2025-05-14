// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module pwm_generator_for_ip_1 (
  tilt_duty,
  clk,
  pan_duty,
  rst,
  pan_speed,
  tilt_speed,
  pan_ready,
  tilt_ready,
  en
);

  (* X_INTERFACE_IGNORE = "true" *)
  output tilt_duty;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN pwm_generator_for_ip_1_clk, ASSOCIATED_RESET rst, INSERT_VIP 0" *)
  input clk;
  (* X_INTERFACE_IGNORE = "true" *)
  output pan_duty;
  (* X_INTERFACE_IGNORE = "true" *)
  input rst;
  (* X_INTERFACE_IGNORE = "true" *)
  input [4:0]pan_speed;
  (* X_INTERFACE_IGNORE = "true" *)
  input [4:0]tilt_speed;
  (* X_INTERFACE_IGNORE = "true" *)
  output pan_ready;
  (* X_INTERFACE_IGNORE = "true" *)
  output tilt_ready;
  (* X_INTERFACE_IGNORE = "true" *)
  input en;

  // stub module has no contents

endmodule
