--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed Apr  9 11:02:43 2025
--Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
--Command     : generate_target pwm_generator_wrapper.bd
--Design      : pwm_generator_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_wrapper is
  port (
    clk : in STD_LOGIC;
    led_0 : out STD_LOGIC;
    led_1 : out STD_LOGIC;
    sw_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    sw_1 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end pwm_generator_wrapper;

architecture STRUCTURE of pwm_generator_wrapper is
  component pwm_generator is
  port (
    clk : in STD_LOGIC;
    led_0 : out STD_LOGIC;
    led_1 : out STD_LOGIC;
    sw_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    sw_1 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_generator;
begin
pwm_generator_i: component pwm_generator
     port map (
      clk => clk,
      led_0 => led_0,
      led_1 => led_1,
      sw_0(0) => sw_0(0),
      sw_1(0) => sw_1(0)
    );
end STRUCTURE;
