// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module better_read_hall_sensor (
  motor_a,
  motor_b,
  clk,
  rst,
  external_sensor,
  count_0
);

  (* X_INTERFACE_IGNORE = "true" *)
  input motor_a;
  (* X_INTERFACE_IGNORE = "true" *)
  input motor_b;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN better_read_hall_sensor_clk, ASSOCIATED_RESET rst, INSERT_VIP 0" *)
  input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *)
  (* X_INTERFACE_MODE = "slave RST.RST" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input rst;
  (* X_INTERFACE_IGNORE = "true" *)
  input external_sensor;
  (* X_INTERFACE_IGNORE = "true" *)
  output [7:0]count_0;

  // stub module has no contents

endmodule
