// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module pwm_generator (
  led_0,
  led_1,
  sw,
  clk,
  rpio_08_r
);

  (* X_INTERFACE_IGNORE = "true" *)
  output led_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output led_1;
  (* X_INTERFACE_IGNORE = "true" *)
  input [1:0]sw;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN pwm_generator_clk_0, INSERT_VIP 0" *)
  input clk;
  (* X_INTERFACE_IGNORE = "true" *)
  output rpio_08_r;

  // stub module has no contents

endmodule
