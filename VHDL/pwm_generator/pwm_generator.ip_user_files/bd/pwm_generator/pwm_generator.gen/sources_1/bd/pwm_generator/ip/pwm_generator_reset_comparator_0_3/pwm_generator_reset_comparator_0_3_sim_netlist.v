// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Wed Apr  2 12:53:02 2025
// Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_reset_comparator_0_3/pwm_generator_reset_comparator_0_3_sim_netlist.v
// Design      : pwm_generator_reset_comparator_0_3
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_generator_reset_comparator_0_3,equal_comparator,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "equal_comparator,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module pwm_generator_reset_comparator_0_3
   (a,
    b,
    c);
  input [26:0]a;
  input [26:0]b;
  output c;

  wire [26:0]a;
  wire [26:0]b;
  wire c;

  pwm_generator_reset_comparator_0_3_equal_comparator U0
       (.a(a),
        .b(b),
        .c(c));
endmodule

(* ORIG_REF_NAME = "equal_comparator" *) 
module pwm_generator_reset_comparator_0_3_equal_comparator
   (c,
    a,
    b);
  output c;
  input [26:0]a;
  input [26:0]b;

  wire [26:0]a;
  wire [26:0]b;
  wire c;
  wire c_INST_0_i_10_n_0;
  wire c_INST_0_i_11_n_0;
  wire c_INST_0_i_1_n_0;
  wire c_INST_0_i_1_n_1;
  wire c_INST_0_i_1_n_2;
  wire c_INST_0_i_1_n_3;
  wire c_INST_0_i_2_n_0;
  wire c_INST_0_i_3_n_0;
  wire c_INST_0_i_3_n_1;
  wire c_INST_0_i_3_n_2;
  wire c_INST_0_i_3_n_3;
  wire c_INST_0_i_4_n_0;
  wire c_INST_0_i_5_n_0;
  wire c_INST_0_i_6_n_0;
  wire c_INST_0_i_7_n_0;
  wire c_INST_0_i_8_n_0;
  wire c_INST_0_i_9_n_0;
  wire [3:1]NLW_c_INST_0_CO_UNCONNECTED;
  wire [3:0]NLW_c_INST_0_O_UNCONNECTED;
  wire [3:0]NLW_c_INST_0_i_1_O_UNCONNECTED;
  wire [3:0]NLW_c_INST_0_i_3_O_UNCONNECTED;

  CARRY4 c_INST_0
       (.CI(c_INST_0_i_1_n_0),
        .CO({NLW_c_INST_0_CO_UNCONNECTED[3:1],c}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_c_INST_0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,c_INST_0_i_2_n_0}));
  CARRY4 c_INST_0_i_1
       (.CI(c_INST_0_i_3_n_0),
        .CO({c_INST_0_i_1_n_0,c_INST_0_i_1_n_1,c_INST_0_i_1_n_2,c_INST_0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_c_INST_0_i_1_O_UNCONNECTED[3:0]),
        .S({c_INST_0_i_4_n_0,c_INST_0_i_5_n_0,c_INST_0_i_6_n_0,c_INST_0_i_7_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    c_INST_0_i_10
       (.I0(a[3]),
        .I1(b[3]),
        .I2(b[5]),
        .I3(a[5]),
        .I4(b[4]),
        .I5(a[4]),
        .O(c_INST_0_i_10_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    c_INST_0_i_11
       (.I0(a[0]),
        .I1(b[0]),
        .I2(b[2]),
        .I3(a[2]),
        .I4(b[1]),
        .I5(a[1]),
        .O(c_INST_0_i_11_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    c_INST_0_i_2
       (.I0(a[24]),
        .I1(b[24]),
        .I2(b[26]),
        .I3(a[26]),
        .I4(b[25]),
        .I5(a[25]),
        .O(c_INST_0_i_2_n_0));
  CARRY4 c_INST_0_i_3
       (.CI(1'b0),
        .CO({c_INST_0_i_3_n_0,c_INST_0_i_3_n_1,c_INST_0_i_3_n_2,c_INST_0_i_3_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_c_INST_0_i_3_O_UNCONNECTED[3:0]),
        .S({c_INST_0_i_8_n_0,c_INST_0_i_9_n_0,c_INST_0_i_10_n_0,c_INST_0_i_11_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    c_INST_0_i_4
       (.I0(a[21]),
        .I1(b[21]),
        .I2(b[23]),
        .I3(a[23]),
        .I4(b[22]),
        .I5(a[22]),
        .O(c_INST_0_i_4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    c_INST_0_i_5
       (.I0(a[18]),
        .I1(b[18]),
        .I2(b[20]),
        .I3(a[20]),
        .I4(b[19]),
        .I5(a[19]),
        .O(c_INST_0_i_5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    c_INST_0_i_6
       (.I0(a[15]),
        .I1(b[15]),
        .I2(b[17]),
        .I3(a[17]),
        .I4(b[16]),
        .I5(a[16]),
        .O(c_INST_0_i_6_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    c_INST_0_i_7
       (.I0(a[12]),
        .I1(b[12]),
        .I2(b[14]),
        .I3(a[14]),
        .I4(b[13]),
        .I5(a[13]),
        .O(c_INST_0_i_7_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    c_INST_0_i_8
       (.I0(a[9]),
        .I1(b[9]),
        .I2(b[11]),
        .I3(a[11]),
        .I4(b[10]),
        .I5(a[10]),
        .O(c_INST_0_i_8_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    c_INST_0_i_9
       (.I0(a[6]),
        .I1(b[6]),
        .I2(b[8]),
        .I3(a[8]),
        .I4(b[7]),
        .I5(a[7]),
        .O(c_INST_0_i_9_n_0));
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
