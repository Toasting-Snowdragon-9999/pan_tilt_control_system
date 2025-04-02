// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Wed Apr  2 12:53:03 2025
// Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_small_duty_cycle_lut_0_0/pwm_generator_small_duty_cycle_lut_0_0_sim_netlist.v
// Design      : pwm_generator_small_duty_cycle_lut_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_generator_small_duty_cycle_lut_0_0,small_duty_cycle_lut,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "small_duty_cycle_lut,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module pwm_generator_small_duty_cycle_lut_0_0
   (spi_in,
    duty_constant);
  input [1:0]spi_in;
  output [26:0]duty_constant;

  wire \<const0> ;
  wire [2:1]\^duty_constant ;
  wire [1:0]spi_in;

  assign duty_constant[26] = \<const0> ;
  assign duty_constant[25] = \<const0> ;
  assign duty_constant[24] = \<const0> ;
  assign duty_constant[23] = \<const0> ;
  assign duty_constant[22] = \<const0> ;
  assign duty_constant[21] = \<const0> ;
  assign duty_constant[20] = \<const0> ;
  assign duty_constant[19] = \<const0> ;
  assign duty_constant[18] = \<const0> ;
  assign duty_constant[17] = \<const0> ;
  assign duty_constant[16] = \<const0> ;
  assign duty_constant[15] = \<const0> ;
  assign duty_constant[14] = \<const0> ;
  assign duty_constant[13] = \<const0> ;
  assign duty_constant[12] = \<const0> ;
  assign duty_constant[11] = \<const0> ;
  assign duty_constant[10] = \<const0> ;
  assign duty_constant[9] = \<const0> ;
  assign duty_constant[8] = \<const0> ;
  assign duty_constant[7] = \<const0> ;
  assign duty_constant[6] = \<const0> ;
  assign duty_constant[5] = \<const0> ;
  assign duty_constant[4] = \<const0> ;
  assign duty_constant[3] = \<const0> ;
  assign duty_constant[2:1] = \^duty_constant [2:1];
  assign duty_constant[0] = spi_in[0];
  GND GND
       (.G(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    \duty_constant[1]_INST_0 
       (.I0(spi_in[1]),
        .I1(spi_in[0]),
        .O(\^duty_constant [1]));
  LUT2 #(
    .INIT(4'h8)) 
    \duty_constant[2]_INST_0 
       (.I0(spi_in[0]),
        .I1(spi_in[1]),
        .O(\^duty_constant [2]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
