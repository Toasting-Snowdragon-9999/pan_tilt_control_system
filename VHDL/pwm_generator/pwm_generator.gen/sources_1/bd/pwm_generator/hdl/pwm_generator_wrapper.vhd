--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed Mar 19 14:59:00 2025
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
    en_a : out STD_LOGIC;
    en_b : out STD_LOGIC;
    spi_in_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    spi_in_1 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end pwm_generator_wrapper;

architecture STRUCTURE of pwm_generator_wrapper is
  component pwm_generator is
  port (
    clk : in STD_LOGIC;
    spi_in_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    spi_in_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    en_a : out STD_LOGIC;
    en_b : out STD_LOGIC
  );
  end component pwm_generator;
begin
pwm_generator_i: component pwm_generator
     port map (
      clk => clk,
      en_a => en_a,
      en_b => en_b,
      spi_in_0(1 downto 0) => spi_in_0(1 downto 0),
      spi_in_1(1 downto 0) => spi_in_1(1 downto 0)
    );
end STRUCTURE;
