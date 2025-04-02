// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Wed Apr  2 09:40:58 2025
// Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_counter_3_0/pwm_generator_counter_3_0_sim_netlist.v
// Design      : pwm_generator_counter_3_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_generator_counter_3_0,counter,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "counter,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module pwm_generator_counter_3_0
   (clk,
    rst,
    clr,
    en,
    cnt);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN pwm_generator_clk, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_mode = "slave rst" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input clr;
  input en;
  output [26:0]cnt;

  wire clk;
  wire clr;
  wire [26:0]cnt;
  wire en;
  wire rst;

  pwm_generator_counter_3_0_counter U0
       (.clk(clk),
        .clr(clr),
        .cnt(cnt),
        .en(en),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "counter" *) 
module pwm_generator_counter_3_0_counter
   (cnt,
    en,
    clk,
    rst,
    clr);
  output [26:0]cnt;
  input en;
  input clk;
  input rst;
  input clr;

  wire clk;
  wire clr;
  wire [26:0]cnt;
  wire \cnt_temp[26]_i_1_n_0 ;
  wire \cnt_temp[3]_i_2_n_0 ;
  wire \cnt_temp_reg[11]_i_1_n_0 ;
  wire \cnt_temp_reg[11]_i_1_n_1 ;
  wire \cnt_temp_reg[11]_i_1_n_2 ;
  wire \cnt_temp_reg[11]_i_1_n_3 ;
  wire \cnt_temp_reg[11]_i_1_n_4 ;
  wire \cnt_temp_reg[11]_i_1_n_5 ;
  wire \cnt_temp_reg[11]_i_1_n_6 ;
  wire \cnt_temp_reg[11]_i_1_n_7 ;
  wire \cnt_temp_reg[15]_i_1_n_0 ;
  wire \cnt_temp_reg[15]_i_1_n_1 ;
  wire \cnt_temp_reg[15]_i_1_n_2 ;
  wire \cnt_temp_reg[15]_i_1_n_3 ;
  wire \cnt_temp_reg[15]_i_1_n_4 ;
  wire \cnt_temp_reg[15]_i_1_n_5 ;
  wire \cnt_temp_reg[15]_i_1_n_6 ;
  wire \cnt_temp_reg[15]_i_1_n_7 ;
  wire \cnt_temp_reg[19]_i_1_n_0 ;
  wire \cnt_temp_reg[19]_i_1_n_1 ;
  wire \cnt_temp_reg[19]_i_1_n_2 ;
  wire \cnt_temp_reg[19]_i_1_n_3 ;
  wire \cnt_temp_reg[19]_i_1_n_4 ;
  wire \cnt_temp_reg[19]_i_1_n_5 ;
  wire \cnt_temp_reg[19]_i_1_n_6 ;
  wire \cnt_temp_reg[19]_i_1_n_7 ;
  wire \cnt_temp_reg[23]_i_1_n_0 ;
  wire \cnt_temp_reg[23]_i_1_n_1 ;
  wire \cnt_temp_reg[23]_i_1_n_2 ;
  wire \cnt_temp_reg[23]_i_1_n_3 ;
  wire \cnt_temp_reg[23]_i_1_n_4 ;
  wire \cnt_temp_reg[23]_i_1_n_5 ;
  wire \cnt_temp_reg[23]_i_1_n_6 ;
  wire \cnt_temp_reg[23]_i_1_n_7 ;
  wire \cnt_temp_reg[26]_i_2_n_2 ;
  wire \cnt_temp_reg[26]_i_2_n_3 ;
  wire \cnt_temp_reg[26]_i_2_n_5 ;
  wire \cnt_temp_reg[26]_i_2_n_6 ;
  wire \cnt_temp_reg[26]_i_2_n_7 ;
  wire \cnt_temp_reg[3]_i_1_n_0 ;
  wire \cnt_temp_reg[3]_i_1_n_1 ;
  wire \cnt_temp_reg[3]_i_1_n_2 ;
  wire \cnt_temp_reg[3]_i_1_n_3 ;
  wire \cnt_temp_reg[3]_i_1_n_4 ;
  wire \cnt_temp_reg[3]_i_1_n_5 ;
  wire \cnt_temp_reg[3]_i_1_n_6 ;
  wire \cnt_temp_reg[3]_i_1_n_7 ;
  wire \cnt_temp_reg[7]_i_1_n_0 ;
  wire \cnt_temp_reg[7]_i_1_n_1 ;
  wire \cnt_temp_reg[7]_i_1_n_2 ;
  wire \cnt_temp_reg[7]_i_1_n_3 ;
  wire \cnt_temp_reg[7]_i_1_n_4 ;
  wire \cnt_temp_reg[7]_i_1_n_5 ;
  wire \cnt_temp_reg[7]_i_1_n_6 ;
  wire \cnt_temp_reg[7]_i_1_n_7 ;
  wire en;
  wire rst;
  wire [3:2]\NLW_cnt_temp_reg[26]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_cnt_temp_reg[26]_i_2_O_UNCONNECTED ;

  LUT2 #(
    .INIT(4'hE)) 
    \cnt_temp[26]_i_1 
       (.I0(rst),
        .I1(clr),
        .O(\cnt_temp[26]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_temp[3]_i_2 
       (.I0(cnt[0]),
        .O(\cnt_temp[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[0] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[3]_i_1_n_7 ),
        .Q(cnt[0]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[10] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[11]_i_1_n_5 ),
        .Q(cnt[10]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[11] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[11]_i_1_n_4 ),
        .Q(cnt[11]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_temp_reg[11]_i_1 
       (.CI(\cnt_temp_reg[7]_i_1_n_0 ),
        .CO({\cnt_temp_reg[11]_i_1_n_0 ,\cnt_temp_reg[11]_i_1_n_1 ,\cnt_temp_reg[11]_i_1_n_2 ,\cnt_temp_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_temp_reg[11]_i_1_n_4 ,\cnt_temp_reg[11]_i_1_n_5 ,\cnt_temp_reg[11]_i_1_n_6 ,\cnt_temp_reg[11]_i_1_n_7 }),
        .S(cnt[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[12] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[15]_i_1_n_7 ),
        .Q(cnt[12]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[13] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[15]_i_1_n_6 ),
        .Q(cnt[13]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[14] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[15]_i_1_n_5 ),
        .Q(cnt[14]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[15] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[15]_i_1_n_4 ),
        .Q(cnt[15]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_temp_reg[15]_i_1 
       (.CI(\cnt_temp_reg[11]_i_1_n_0 ),
        .CO({\cnt_temp_reg[15]_i_1_n_0 ,\cnt_temp_reg[15]_i_1_n_1 ,\cnt_temp_reg[15]_i_1_n_2 ,\cnt_temp_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_temp_reg[15]_i_1_n_4 ,\cnt_temp_reg[15]_i_1_n_5 ,\cnt_temp_reg[15]_i_1_n_6 ,\cnt_temp_reg[15]_i_1_n_7 }),
        .S(cnt[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[16] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[19]_i_1_n_7 ),
        .Q(cnt[16]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[17] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[19]_i_1_n_6 ),
        .Q(cnt[17]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[18] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[19]_i_1_n_5 ),
        .Q(cnt[18]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[19] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[19]_i_1_n_4 ),
        .Q(cnt[19]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_temp_reg[19]_i_1 
       (.CI(\cnt_temp_reg[15]_i_1_n_0 ),
        .CO({\cnt_temp_reg[19]_i_1_n_0 ,\cnt_temp_reg[19]_i_1_n_1 ,\cnt_temp_reg[19]_i_1_n_2 ,\cnt_temp_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_temp_reg[19]_i_1_n_4 ,\cnt_temp_reg[19]_i_1_n_5 ,\cnt_temp_reg[19]_i_1_n_6 ,\cnt_temp_reg[19]_i_1_n_7 }),
        .S(cnt[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[1] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[3]_i_1_n_6 ),
        .Q(cnt[1]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[20] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[23]_i_1_n_7 ),
        .Q(cnt[20]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[21] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[23]_i_1_n_6 ),
        .Q(cnt[21]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[22] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[23]_i_1_n_5 ),
        .Q(cnt[22]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[23] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[23]_i_1_n_4 ),
        .Q(cnt[23]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_temp_reg[23]_i_1 
       (.CI(\cnt_temp_reg[19]_i_1_n_0 ),
        .CO({\cnt_temp_reg[23]_i_1_n_0 ,\cnt_temp_reg[23]_i_1_n_1 ,\cnt_temp_reg[23]_i_1_n_2 ,\cnt_temp_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_temp_reg[23]_i_1_n_4 ,\cnt_temp_reg[23]_i_1_n_5 ,\cnt_temp_reg[23]_i_1_n_6 ,\cnt_temp_reg[23]_i_1_n_7 }),
        .S(cnt[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[24] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[26]_i_2_n_7 ),
        .Q(cnt[24]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[25] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[26]_i_2_n_6 ),
        .Q(cnt[25]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[26] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[26]_i_2_n_5 ),
        .Q(cnt[26]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_temp_reg[26]_i_2 
       (.CI(\cnt_temp_reg[23]_i_1_n_0 ),
        .CO({\NLW_cnt_temp_reg[26]_i_2_CO_UNCONNECTED [3:2],\cnt_temp_reg[26]_i_2_n_2 ,\cnt_temp_reg[26]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_temp_reg[26]_i_2_O_UNCONNECTED [3],\cnt_temp_reg[26]_i_2_n_5 ,\cnt_temp_reg[26]_i_2_n_6 ,\cnt_temp_reg[26]_i_2_n_7 }),
        .S({1'b0,cnt[26:24]}));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[2] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[3]_i_1_n_5 ),
        .Q(cnt[2]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[3] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[3]_i_1_n_4 ),
        .Q(cnt[3]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_temp_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\cnt_temp_reg[3]_i_1_n_0 ,\cnt_temp_reg[3]_i_1_n_1 ,\cnt_temp_reg[3]_i_1_n_2 ,\cnt_temp_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\cnt_temp_reg[3]_i_1_n_4 ,\cnt_temp_reg[3]_i_1_n_5 ,\cnt_temp_reg[3]_i_1_n_6 ,\cnt_temp_reg[3]_i_1_n_7 }),
        .S({cnt[3:1],\cnt_temp[3]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[4] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[7]_i_1_n_7 ),
        .Q(cnt[4]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[5] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[7]_i_1_n_6 ),
        .Q(cnt[5]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[6] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[7]_i_1_n_5 ),
        .Q(cnt[6]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[7] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[7]_i_1_n_4 ),
        .Q(cnt[7]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \cnt_temp_reg[7]_i_1 
       (.CI(\cnt_temp_reg[3]_i_1_n_0 ),
        .CO({\cnt_temp_reg[7]_i_1_n_0 ,\cnt_temp_reg[7]_i_1_n_1 ,\cnt_temp_reg[7]_i_1_n_2 ,\cnt_temp_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_temp_reg[7]_i_1_n_4 ,\cnt_temp_reg[7]_i_1_n_5 ,\cnt_temp_reg[7]_i_1_n_6 ,\cnt_temp_reg[7]_i_1_n_7 }),
        .S(cnt[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[8] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[11]_i_1_n_7 ),
        .Q(cnt[8]),
        .R(\cnt_temp[26]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_temp_reg[9] 
       (.C(clk),
        .CE(en),
        .D(\cnt_temp_reg[11]_i_1_n_6 ),
        .Q(cnt[9]),
        .R(\cnt_temp[26]_i_1_n_0 ));
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
