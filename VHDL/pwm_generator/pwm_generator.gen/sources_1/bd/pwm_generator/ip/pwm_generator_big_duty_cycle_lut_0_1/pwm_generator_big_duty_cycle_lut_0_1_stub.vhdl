-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed Apr  9 11:03:26 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_big_duty_cycle_lut_0_1/pwm_generator_big_duty_cycle_lut_0_1_stub.vhdl
-- Design      : pwm_generator_big_duty_cycle_lut_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pwm_generator_big_duty_cycle_lut_0_1 is
  Port ( 
    spi_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    en : in STD_LOGIC;
    duty_constant : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_big_duty_cycle_lut_0_1 : entity is "pwm_generator_big_duty_cycle_lut_0_1,big_duty_cycle_lut,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of pwm_generator_big_duty_cycle_lut_0_1 : entity is "pwm_generator_big_duty_cycle_lut_0_1,big_duty_cycle_lut,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=big_duty_cycle_lut,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_big_duty_cycle_lut_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_big_duty_cycle_lut_0_1 : entity is "module_ref";
end pwm_generator_big_duty_cycle_lut_0_1;

architecture stub of pwm_generator_big_duty_cycle_lut_0_1 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "spi_in[4:0],en,duty_constant[4:0]";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "big_duty_cycle_lut,Vivado 2024.2";
begin
end;
