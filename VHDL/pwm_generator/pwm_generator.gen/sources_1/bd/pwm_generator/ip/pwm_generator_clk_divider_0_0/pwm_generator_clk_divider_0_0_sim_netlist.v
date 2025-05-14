// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Wed May  7 16:50:09 2025
// Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_clk_divider_0_0/pwm_generator_clk_divider_0_0_sim_netlist.v
// Design      : pwm_generator_clk_divider_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_generator_clk_divider_0_0,clk_divider,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "clk_divider,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module pwm_generator_clk_divider_0_0
   (clk,
    rst,
    clk_div);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN pwm_generator_clk, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_mode = "slave rst" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  output clk_div;

  wire clk;
  wire clk_div;
  wire rst;

  pwm_generator_clk_divider_0_0_clk_divider U0
       (.clk(clk),
        .clk_div(clk_div),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "clk_divider" *) 
module pwm_generator_clk_divider_0_0_clk_divider
   (clk_div,
    rst,
    clk);
  output clk_div;
  input rst;
  input clk;

  wire clk;
  wire clk_div;
  wire clk_div_sig_i_1_n_0;
  wire clk_div_sig_i_2_n_0;
  wire clk_div_sig_i_3_n_0;
  wire clk_div_sig_i_4_n_0;
  wire clk_div_sig_i_5_n_0;
  wire [15:0]count_sig;
  wire [15:0]count_sig_0;
  wire \count_sig_reg[12]_i_2_n_0 ;
  wire \count_sig_reg[12]_i_2_n_1 ;
  wire \count_sig_reg[12]_i_2_n_2 ;
  wire \count_sig_reg[12]_i_2_n_3 ;
  wire \count_sig_reg[15]_i_2_n_2 ;
  wire \count_sig_reg[15]_i_2_n_3 ;
  wire \count_sig_reg[4]_i_2_n_0 ;
  wire \count_sig_reg[4]_i_2_n_1 ;
  wire \count_sig_reg[4]_i_2_n_2 ;
  wire \count_sig_reg[4]_i_2_n_3 ;
  wire \count_sig_reg[8]_i_2_n_0 ;
  wire \count_sig_reg[8]_i_2_n_1 ;
  wire \count_sig_reg[8]_i_2_n_2 ;
  wire \count_sig_reg[8]_i_2_n_3 ;
  wire [15:1]data0;
  wire rst;
  wire [3:2]\NLW_count_sig_reg[15]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_count_sig_reg[15]_i_2_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
    clk_div_sig_i_1
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(rst),
        .I5(clk_div),
        .O(clk_div_sig_i_1_n_0));
  LUT4 #(
    .INIT(16'hEFFF)) 
    clk_div_sig_i_2
       (.I0(count_sig[5]),
        .I1(count_sig[4]),
        .I2(count_sig[7]),
        .I3(count_sig[6]),
        .O(clk_div_sig_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    clk_div_sig_i_3
       (.I0(count_sig[1]),
        .I1(count_sig[0]),
        .I2(count_sig[3]),
        .I3(count_sig[2]),
        .O(clk_div_sig_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    clk_div_sig_i_4
       (.I0(count_sig[13]),
        .I1(count_sig[12]),
        .I2(count_sig[15]),
        .I3(count_sig[14]),
        .O(clk_div_sig_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFDF)) 
    clk_div_sig_i_5
       (.I0(count_sig[8]),
        .I1(count_sig[9]),
        .I2(count_sig[11]),
        .I3(count_sig[10]),
        .O(clk_div_sig_i_5_n_0));
  FDRE #(
    .INIT(1'b1)) 
    clk_div_sig_reg
       (.C(clk),
        .CE(1'b1),
        .D(clk_div_sig_i_1_n_0),
        .Q(clk_div),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count_sig[0]_i_1 
       (.I0(count_sig[0]),
        .O(count_sig_0[0]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[10]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[10]),
        .O(count_sig_0[10]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[11]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[11]),
        .O(count_sig_0[11]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[12]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[12]),
        .O(count_sig_0[12]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[13]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[13]),
        .O(count_sig_0[13]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[14]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[14]),
        .O(count_sig_0[14]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[15]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[15]),
        .O(count_sig_0[15]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[1]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[1]),
        .O(count_sig_0[1]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[2]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[2]),
        .O(count_sig_0[2]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[3]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[3]),
        .O(count_sig_0[3]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[4]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[4]),
        .O(count_sig_0[4]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[5]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[5]),
        .O(count_sig_0[5]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[6]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[6]),
        .O(count_sig_0[6]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[7]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[7]),
        .O(count_sig_0[7]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[8]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[8]),
        .O(count_sig_0[8]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \count_sig[9]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(clk_div_sig_i_3_n_0),
        .I2(clk_div_sig_i_4_n_0),
        .I3(clk_div_sig_i_5_n_0),
        .I4(data0[9]),
        .O(count_sig_0[9]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[0]),
        .Q(count_sig[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[10]),
        .Q(count_sig[10]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[11]),
        .Q(count_sig[11]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[12]),
        .Q(count_sig[12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \count_sig_reg[12]_i_2 
       (.CI(\count_sig_reg[8]_i_2_n_0 ),
        .CO({\count_sig_reg[12]_i_2_n_0 ,\count_sig_reg[12]_i_2_n_1 ,\count_sig_reg[12]_i_2_n_2 ,\count_sig_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(count_sig[12:9]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[13]),
        .Q(count_sig[13]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[14]),
        .Q(count_sig[14]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[15]),
        .Q(count_sig[15]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \count_sig_reg[15]_i_2 
       (.CI(\count_sig_reg[12]_i_2_n_0 ),
        .CO({\NLW_count_sig_reg[15]_i_2_CO_UNCONNECTED [3:2],\count_sig_reg[15]_i_2_n_2 ,\count_sig_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count_sig_reg[15]_i_2_O_UNCONNECTED [3],data0[15:13]}),
        .S({1'b0,count_sig[15:13]}));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[1]),
        .Q(count_sig[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[2]),
        .Q(count_sig[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[3]),
        .Q(count_sig[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[4]),
        .Q(count_sig[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \count_sig_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\count_sig_reg[4]_i_2_n_0 ,\count_sig_reg[4]_i_2_n_1 ,\count_sig_reg[4]_i_2_n_2 ,\count_sig_reg[4]_i_2_n_3 }),
        .CYINIT(count_sig[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(count_sig[4:1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[5]),
        .Q(count_sig[5]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[6]),
        .Q(count_sig[6]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[7]),
        .Q(count_sig[7]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[8]),
        .Q(count_sig[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \count_sig_reg[8]_i_2 
       (.CI(\count_sig_reg[4]_i_2_n_0 ),
        .CO({\count_sig_reg[8]_i_2_n_0 ,\count_sig_reg[8]_i_2_n_1 ,\count_sig_reg[8]_i_2_n_2 ,\count_sig_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(count_sig[8:5]));
  FDCE #(
    .INIT(1'b0)) 
    \count_sig_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(count_sig_0[9]),
        .Q(count_sig[9]));
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
