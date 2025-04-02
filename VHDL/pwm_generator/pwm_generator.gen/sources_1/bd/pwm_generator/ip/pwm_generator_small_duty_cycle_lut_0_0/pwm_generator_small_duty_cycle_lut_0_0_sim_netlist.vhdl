-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed Apr  2 12:53:03 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_small_duty_cycle_lut_0_0/pwm_generator_small_duty_cycle_lut_0_0_sim_netlist.vhdl
-- Design      : pwm_generator_small_duty_cycle_lut_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_small_duty_cycle_lut_0_0 is
  port (
    spi_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    duty_constant : out STD_LOGIC_VECTOR ( 26 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_generator_small_duty_cycle_lut_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_small_duty_cycle_lut_0_0 : entity is "pwm_generator_small_duty_cycle_lut_0_0,small_duty_cycle_lut,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_small_duty_cycle_lut_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_small_duty_cycle_lut_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_generator_small_duty_cycle_lut_0_0 : entity is "small_duty_cycle_lut,Vivado 2024.2";
end pwm_generator_small_duty_cycle_lut_0_0;

architecture STRUCTURE of pwm_generator_small_duty_cycle_lut_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^duty_constant\ : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal \^spi_in\ : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  \^spi_in\(1 downto 0) <= spi_in(1 downto 0);
  duty_constant(26) <= \<const0>\;
  duty_constant(25) <= \<const0>\;
  duty_constant(24) <= \<const0>\;
  duty_constant(23) <= \<const0>\;
  duty_constant(22) <= \<const0>\;
  duty_constant(21) <= \<const0>\;
  duty_constant(20) <= \<const0>\;
  duty_constant(19) <= \<const0>\;
  duty_constant(18) <= \<const0>\;
  duty_constant(17) <= \<const0>\;
  duty_constant(16) <= \<const0>\;
  duty_constant(15) <= \<const0>\;
  duty_constant(14) <= \<const0>\;
  duty_constant(13) <= \<const0>\;
  duty_constant(12) <= \<const0>\;
  duty_constant(11) <= \<const0>\;
  duty_constant(10) <= \<const0>\;
  duty_constant(9) <= \<const0>\;
  duty_constant(8) <= \<const0>\;
  duty_constant(7) <= \<const0>\;
  duty_constant(6) <= \<const0>\;
  duty_constant(5) <= \<const0>\;
  duty_constant(4) <= \<const0>\;
  duty_constant(3) <= \<const0>\;
  duty_constant(2 downto 1) <= \^duty_constant\(2 downto 1);
  duty_constant(0) <= \^spi_in\(0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\duty_constant[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^spi_in\(1),
      I1 => \^spi_in\(0),
      O => \^duty_constant\(1)
    );
\duty_constant[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^spi_in\(0),
      I1 => \^spi_in\(1),
      O => \^duty_constant\(2)
    );
end STRUCTURE;
