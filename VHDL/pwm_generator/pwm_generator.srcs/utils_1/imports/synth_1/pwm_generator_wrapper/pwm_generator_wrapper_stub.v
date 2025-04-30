// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module pwm_generator_wrapper(clk_0, led_0, led_1, rpio_08_r, sw);
  input clk_0;
  output led_0;
  output led_1;
  output rpio_08_r;
  input [1:0]sw;
endmodule
