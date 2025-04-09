-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed Apr  9 11:03:23 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_big_duty_cycle_lut_0_0/pwm_generator_big_duty_cycle_lut_0_0_sim_netlist.vhdl
-- Design      : pwm_generator_big_duty_cycle_lut_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_big_duty_cycle_lut_0_0 is
  port (
    spi_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    en : in STD_LOGIC;
    duty_constant : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_generator_big_duty_cycle_lut_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_big_duty_cycle_lut_0_0 : entity is "pwm_generator_big_duty_cycle_lut_0_0,big_duty_cycle_lut,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_big_duty_cycle_lut_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_big_duty_cycle_lut_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_generator_big_duty_cycle_lut_0_0 : entity is "big_duty_cycle_lut,Vivado 2024.2";
end pwm_generator_big_duty_cycle_lut_0_0;

architecture STRUCTURE of pwm_generator_big_duty_cycle_lut_0_0 is
begin
g0_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001AAAAA00000000"
    )
        port map (
      I0 => spi_in(0),
      I1 => spi_in(1),
      I2 => spi_in(2),
      I3 => spi_in(3),
      I4 => spi_in(4),
      I5 => en,
      O => duty_constant(0)
    );
g0_b1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02AA0000"
    )
        port map (
      I0 => spi_in(1),
      I1 => spi_in(2),
      I2 => spi_in(3),
      I3 => spi_in(4),
      I4 => en,
      O => duty_constant(1)
    );
g0_b2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010F0F000000000"
    )
        port map (
      I0 => spi_in(0),
      I1 => spi_in(1),
      I2 => spi_in(2),
      I3 => spi_in(3),
      I4 => spi_in(4),
      I5 => en,
      O => duty_constant(2)
    );
g0_b3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => spi_in(3),
      I1 => spi_in(4),
      I2 => en,
      O => duty_constant(3)
    );
g0_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001F000000000000"
    )
        port map (
      I0 => spi_in(0),
      I1 => spi_in(1),
      I2 => spi_in(2),
      I3 => spi_in(3),
      I4 => spi_in(4),
      I5 => en,
      O => duty_constant(4)
    );
end STRUCTURE;
