-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed Apr  2 12:53:02 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_counter_2_1/pwm_generator_counter_2_1_stub.vhdl
-- Design      : pwm_generator_counter_2_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pwm_generator_counter_2_1 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_counter_2_1 : entity is "pwm_generator_counter_2_1,counter,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of pwm_generator_counter_2_1 : entity is "pwm_generator_counter_2_1,counter,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=counter,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,n_bits=3}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_counter_2_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_counter_2_1 : entity is "module_ref";
end pwm_generator_counter_2_1;

architecture stub of pwm_generator_counter_2_1 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,rst,clr,en,cnt[2:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN pwm_generator_clk_0, INSERT_VIP 0";
  attribute x_interface_info of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute x_interface_mode of rst : signal is "slave rst";
  attribute x_interface_parameter of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "counter,Vivado 2024.2";
begin
end;
