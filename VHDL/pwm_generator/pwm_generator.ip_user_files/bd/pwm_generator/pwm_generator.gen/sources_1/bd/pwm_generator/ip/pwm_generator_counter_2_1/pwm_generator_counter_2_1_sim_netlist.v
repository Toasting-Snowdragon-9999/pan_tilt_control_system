// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Wed Apr  2 15:14:26 2025
// Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_counter_2_1/pwm_generator_counter_2_1_sim_netlist.v
// Design      : pwm_generator_counter_2_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_generator_counter_2_1,counter,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "counter,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module pwm_generator_counter_2_1
   (clk,
    rst,
    clr,
    en,
    cnt);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN pwm_generator_clk_0, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_mode = "slave rst" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input clr;
  input en;
  output [4:0]cnt;

  wire clk;
  wire clr;
  wire [4:0]cnt;
  wire en;
  wire rst;

  pwm_generator_counter_2_1_counter U0
       (.clk(clk),
        .clr(clr),
        .cnt(cnt),
        .en(en),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "counter" *) 
module pwm_generator_counter_2_1_counter
   (cnt,
    en,
    clk,
    rst,
    clr);
  output [4:0]cnt;
  input en;
  input clk;
  input rst;
  input clr;

  wire clk;
  wire clr;
  wire [4:0]cnt;
  wire \cnt_temp[4]_i_1_n_0 ;
  wire en;
  wire [4:0]plusOp;
  wire rst;

  LUT1 #(
    .INIT(2'h1)) 
    \cnt_temp[0]_i_1 
       (.I0(cnt[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_temp[1]_i_1 
       (.I0(cnt[0]),
        .I1(cnt[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt_temp[2]_i_1 
       (.I0(cnt[0]),
        .I1(cnt[1]),
        .I2(cnt[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt_temp[3]_i_1 
       (.I0(cnt[1]),
        .I1(cnt[0]),
        .I2(cnt[2]),
        .I3(cnt[3]),
        .O(plusOp[3]));
  LUT2 #(
    .INIT(4'hE)) 
    \cnt_temp[4]_i_1 
       (.I0(rst),
        .I1(clr),
        .O(\cnt_temp[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt_temp[4]_i_2 
       (.I0(cnt[2]),
        .I1(cnt[0]),
        .I2(cnt[1]),
        .I3(cnt[3]),
        .I4(cnt[4]),
        .O(plusOp[4]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[0] 
       (.C(clk),
        .CE(en),
        .D(plusOp[0]),
        .Q(cnt[0]),
        .R(\cnt_temp[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[1] 
       (.C(clk),
        .CE(en),
        .D(plusOp[1]),
        .Q(cnt[1]),
        .R(\cnt_temp[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[2] 
       (.C(clk),
        .CE(en),
        .D(plusOp[2]),
        .Q(cnt[2]),
        .R(\cnt_temp[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[3] 
       (.C(clk),
        .CE(en),
        .D(plusOp[3]),
        .Q(cnt[3]),
        .R(\cnt_temp[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[4] 
       (.C(clk),
        .CE(en),
        .D(plusOp[4]),
        .Q(cnt[4]),
        .R(\cnt_temp[4]_i_1_n_0 ));
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
