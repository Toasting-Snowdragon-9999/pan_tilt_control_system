// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Wed May  7 17:11:55 2025
// Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_pwm_soft_start_0_0/pwm_generator_pwm_soft_start_0_0_sim_netlist.v
// Design      : pwm_generator_pwm_soft_start_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_generator_pwm_soft_start_0_0,pwm_soft_start,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "pwm_soft_start,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module pwm_generator_pwm_soft_start_0_0
   (clk,
    rst,
    target_duty_i,
    pwm_period_pulse_i,
    duty_o,
    ready_o);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_mode = "slave rst" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input [4:0]target_duty_i;
  input pwm_period_pulse_i;
  output [4:0]duty_o;
  output ready_o;

  wire clk;
  wire [4:0]duty_o;
  wire pwm_period_pulse_i;
  wire ready_o;
  wire rst;
  wire [4:0]target_duty_i;

  pwm_generator_pwm_soft_start_0_0_pwm_soft_start U0
       (.Q(duty_o),
        .clk(clk),
        .pwm_period_pulse_i(pwm_period_pulse_i),
        .ready_o(ready_o),
        .rst(rst),
        .target_duty_i(target_duty_i));
endmodule

(* ORIG_REF_NAME = "pwm_soft_start" *) 
module pwm_generator_pwm_soft_start_0_0_pwm_soft_start
   (Q,
    ready_o,
    pwm_period_pulse_i,
    clk,
    rst,
    target_duty_i);
  output [4:0]Q;
  output ready_o;
  input pwm_period_pulse_i;
  input clk;
  input rst;
  input [4:0]target_duty_i;

  wire [4:0]Q;
  wire clk;
  wire [15:1]data0;
  wire \duty_reg[4]_i_10_n_0 ;
  wire \duty_reg[4]_i_11_n_0 ;
  wire \duty_reg[4]_i_12_n_0 ;
  wire \duty_reg[4]_i_1_n_0 ;
  wire \duty_reg[4]_i_2_n_0 ;
  wire \duty_reg[4]_i_4_n_0 ;
  wire \duty_reg[4]_i_5_n_0 ;
  wire \duty_reg[4]_i_6_n_0 ;
  wire \duty_reg[4]_i_7_n_0 ;
  wire \duty_reg[4]_i_8_n_0 ;
  wire \duty_reg[4]_i_9_n_0 ;
  wire [4:0]p_0_in;
  wire pwm_period_pulse_i;
  wire ready_o;
  wire ready_o_INST_0_i_1_n_0;
  wire ready_o_INST_0_i_2_n_0;
  wire rst;
  wire [4:0]target_duty_i;
  wire [15:0]update_cnt;
  wire [15:0]update_cnt_0;
  wire \update_cnt_reg[12]_i_2_n_0 ;
  wire \update_cnt_reg[12]_i_2_n_1 ;
  wire \update_cnt_reg[12]_i_2_n_2 ;
  wire \update_cnt_reg[12]_i_2_n_3 ;
  wire \update_cnt_reg[15]_i_2_n_2 ;
  wire \update_cnt_reg[15]_i_2_n_3 ;
  wire \update_cnt_reg[4]_i_2_n_0 ;
  wire \update_cnt_reg[4]_i_2_n_1 ;
  wire \update_cnt_reg[4]_i_2_n_2 ;
  wire \update_cnt_reg[4]_i_2_n_3 ;
  wire \update_cnt_reg[8]_i_2_n_0 ;
  wire \update_cnt_reg[8]_i_2_n_1 ;
  wire \update_cnt_reg[8]_i_2_n_2 ;
  wire \update_cnt_reg[8]_i_2_n_3 ;
  wire [3:2]\NLW_update_cnt_reg[15]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_update_cnt_reg[15]_i_2_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \duty_reg[0]_i_1 
       (.I0(Q[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \duty_reg[1]_i_1 
       (.I0(\duty_reg[4]_i_10_n_0 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h9CC6)) 
    \duty_reg[2]_i_1 
       (.I0(\duty_reg[4]_i_10_n_0 ),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFE7F0180)) 
    \duty_reg[3]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\duty_reg[4]_i_10_n_0 ),
        .I4(Q[3]),
        .O(p_0_in[3]));
  LUT2 #(
    .INIT(4'hE)) 
    \duty_reg[4]_i_1 
       (.I0(rst),
        .I1(\duty_reg[4]_i_4_n_0 ),
        .O(\duty_reg[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h4F04DF0D)) 
    \duty_reg[4]_i_10 
       (.I0(target_duty_i[3]),
        .I1(Q[3]),
        .I2(target_duty_i[4]),
        .I3(Q[4]),
        .I4(\duty_reg[4]_i_12_n_0 ),
        .O(\duty_reg[4]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h95555555)) 
    \duty_reg[4]_i_11 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[3]),
        .O(\duty_reg[4]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h44D4DDDD444444D4)) 
    \duty_reg[4]_i_12 
       (.I0(Q[2]),
        .I1(target_duty_i[2]),
        .I2(target_duty_i[0]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(target_duty_i[1]),
        .O(\duty_reg[4]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0004000000000000)) 
    \duty_reg[4]_i_2 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(ready_o_INST_0_i_1_n_0),
        .I5(pwm_period_pulse_i),
        .O(\duty_reg[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \duty_reg[4]_i_3 
       (.I0(\duty_reg[4]_i_9_n_0 ),
        .I1(\duty_reg[4]_i_10_n_0 ),
        .I2(\duty_reg[4]_i_11_n_0 ),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    \duty_reg[4]_i_4 
       (.I0(target_duty_i[3]),
        .I1(target_duty_i[4]),
        .I2(target_duty_i[2]),
        .I3(pwm_period_pulse_i),
        .I4(target_duty_i[1]),
        .I5(target_duty_i[0]),
        .O(\duty_reg[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hEFFF)) 
    \duty_reg[4]_i_5 
       (.I0(update_cnt[12]),
        .I1(update_cnt[15]),
        .I2(update_cnt[0]),
        .I3(update_cnt[6]),
        .O(\duty_reg[4]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \duty_reg[4]_i_6 
       (.I0(update_cnt[3]),
        .I1(update_cnt[1]),
        .I2(update_cnt[10]),
        .I3(update_cnt[8]),
        .O(\duty_reg[4]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \duty_reg[4]_i_7 
       (.I0(update_cnt[11]),
        .I1(update_cnt[4]),
        .I2(update_cnt[2]),
        .I3(update_cnt[13]),
        .O(\duty_reg[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \duty_reg[4]_i_8 
       (.I0(update_cnt[5]),
        .I1(update_cnt[7]),
        .I2(update_cnt[14]),
        .I3(update_cnt[9]),
        .O(\duty_reg[4]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hAAAAAAA9)) 
    \duty_reg[4]_i_9 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\duty_reg[4]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \duty_reg_reg[0] 
       (.C(clk),
        .CE(\duty_reg[4]_i_2_n_0 ),
        .D(p_0_in[0]),
        .Q(Q[0]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \duty_reg_reg[1] 
       (.C(clk),
        .CE(\duty_reg[4]_i_2_n_0 ),
        .D(p_0_in[1]),
        .Q(Q[1]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \duty_reg_reg[2] 
       (.C(clk),
        .CE(\duty_reg[4]_i_2_n_0 ),
        .D(p_0_in[2]),
        .Q(Q[2]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \duty_reg_reg[3] 
       (.C(clk),
        .CE(\duty_reg[4]_i_2_n_0 ),
        .D(p_0_in[3]),
        .Q(Q[3]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \duty_reg_reg[4] 
       (.C(clk),
        .CE(\duty_reg[4]_i_2_n_0 ),
        .D(p_0_in[4]),
        .Q(Q[4]),
        .R(\duty_reg[4]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    ready_o_INST_0
       (.I0(ready_o_INST_0_i_1_n_0),
        .O(ready_o));
  LUT5 #(
    .INIT(32'hF6FFFFF6)) 
    ready_o_INST_0_i_1
       (.I0(target_duty_i[3]),
        .I1(Q[3]),
        .I2(ready_o_INST_0_i_2_n_0),
        .I3(Q[4]),
        .I4(target_duty_i[4]),
        .O(ready_o_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    ready_o_INST_0_i_2
       (.I0(Q[0]),
        .I1(target_duty_i[0]),
        .I2(Q[1]),
        .I3(target_duty_i[1]),
        .I4(Q[2]),
        .I5(target_duty_i[2]),
        .O(ready_o_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \update_cnt[0]_i_1 
       (.I0(update_cnt[0]),
        .O(update_cnt_0[0]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[10]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[10]),
        .O(update_cnt_0[10]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[11]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[11]),
        .O(update_cnt_0[11]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[12]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[12]),
        .O(update_cnt_0[12]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[13]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[13]),
        .O(update_cnt_0[13]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[14]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[14]),
        .O(update_cnt_0[14]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[15]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[15]),
        .O(update_cnt_0[15]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[1]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[1]),
        .O(update_cnt_0[1]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[2]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[2]),
        .O(update_cnt_0[2]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[3]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[3]),
        .O(update_cnt_0[3]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[4]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[4]),
        .O(update_cnt_0[4]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[5]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[5]),
        .O(update_cnt_0[5]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[6]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[6]),
        .O(update_cnt_0[6]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[7]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[7]),
        .O(update_cnt_0[7]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[8]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[8]),
        .O(update_cnt_0[8]));
  LUT5 #(
    .INIT(32'hFFFB0000)) 
    \update_cnt[9]_i_1 
       (.I0(\duty_reg[4]_i_5_n_0 ),
        .I1(\duty_reg[4]_i_6_n_0 ),
        .I2(\duty_reg[4]_i_7_n_0 ),
        .I3(\duty_reg[4]_i_8_n_0 ),
        .I4(data0[9]),
        .O(update_cnt_0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[0] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[0]),
        .Q(update_cnt[0]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[10] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[10]),
        .Q(update_cnt[10]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[11] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[11]),
        .Q(update_cnt[11]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[12] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[12]),
        .Q(update_cnt[12]),
        .R(\duty_reg[4]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \update_cnt_reg[12]_i_2 
       (.CI(\update_cnt_reg[8]_i_2_n_0 ),
        .CO({\update_cnt_reg[12]_i_2_n_0 ,\update_cnt_reg[12]_i_2_n_1 ,\update_cnt_reg[12]_i_2_n_2 ,\update_cnt_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(update_cnt[12:9]));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[13] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[13]),
        .Q(update_cnt[13]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[14] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[14]),
        .Q(update_cnt[14]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[15] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[15]),
        .Q(update_cnt[15]),
        .R(\duty_reg[4]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \update_cnt_reg[15]_i_2 
       (.CI(\update_cnt_reg[12]_i_2_n_0 ),
        .CO({\NLW_update_cnt_reg[15]_i_2_CO_UNCONNECTED [3:2],\update_cnt_reg[15]_i_2_n_2 ,\update_cnt_reg[15]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_update_cnt_reg[15]_i_2_O_UNCONNECTED [3],data0[15:13]}),
        .S({1'b0,update_cnt[15:13]}));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[1] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[1]),
        .Q(update_cnt[1]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[2] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[2]),
        .Q(update_cnt[2]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[3] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[3]),
        .Q(update_cnt[3]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[4] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[4]),
        .Q(update_cnt[4]),
        .R(\duty_reg[4]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \update_cnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\update_cnt_reg[4]_i_2_n_0 ,\update_cnt_reg[4]_i_2_n_1 ,\update_cnt_reg[4]_i_2_n_2 ,\update_cnt_reg[4]_i_2_n_3 }),
        .CYINIT(update_cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(update_cnt[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[5] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[5]),
        .Q(update_cnt[5]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[6] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[6]),
        .Q(update_cnt[6]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[7] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[7]),
        .Q(update_cnt[7]),
        .R(\duty_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[8] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[8]),
        .Q(update_cnt[8]),
        .R(\duty_reg[4]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \update_cnt_reg[8]_i_2 
       (.CI(\update_cnt_reg[4]_i_2_n_0 ),
        .CO({\update_cnt_reg[8]_i_2_n_0 ,\update_cnt_reg[8]_i_2_n_1 ,\update_cnt_reg[8]_i_2_n_2 ,\update_cnt_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(update_cnt[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \update_cnt_reg[9] 
       (.C(clk),
        .CE(pwm_period_pulse_i),
        .D(update_cnt_0[9]),
        .Q(update_cnt[9]),
        .R(\duty_reg[4]_i_1_n_0 ));
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
