--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed May  7 18:01:44 2025
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
    EN_A : out STD_LOGIC;
    ar : in STD_LOGIC_VECTOR ( 4 downto 0 );
    clk : in STD_LOGIC;
    ja_7 : out STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 3 downto 0 );
    led4_b : out STD_LOGIC;
    led5_g : out STD_LOGIC;
    rpio_12_r : out STD_LOGIC
  );
end pwm_generator_wrapper;

architecture STRUCTURE of pwm_generator_wrapper is
  component pwm_generator is
  port (
    clk : in STD_LOGIC;
    ja_7 : out STD_LOGIC;
    EN_A : out STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 3 downto 0 );
    led5_g : out STD_LOGIC;
    rpio_12_r : out STD_LOGIC;
    ar : in STD_LOGIC_VECTOR ( 4 downto 0 );
    led4_b : out STD_LOGIC
  );
  end component pwm_generator;
begin
pwm_generator_i: component pwm_generator
     port map (
      EN_A => EN_A,
      ar(4 downto 0) => ar(4 downto 0),
      clk => clk,
      ja_7 => ja_7,
      led(3 downto 0) => led(3 downto 0),
      led4_b => led4_b,
      led5_g => led5_g,
      rpio_12_r => rpio_12_r
    );
end STRUCTURE;
