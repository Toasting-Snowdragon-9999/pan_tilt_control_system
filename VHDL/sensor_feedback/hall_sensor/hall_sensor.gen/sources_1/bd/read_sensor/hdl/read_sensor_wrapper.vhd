--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Thu Mar 13 15:12:56 2025
--Host        : Windows_beast running 64-bit major release  (build 9200)
--Command     : generate_target read_sensor_wrapper.bd
--Design      : read_sensor_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity read_sensor_wrapper is
  port (
    a_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    a_in_0 : in STD_LOGIC;
    b_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    b_in_0 : in STD_LOGIC;
    gen_clk_0 : out STD_LOGIC;
    internal_clock_0 : in STD_LOGIC;
    result_0 : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
end read_sensor_wrapper;

architecture STRUCTURE of read_sensor_wrapper is
  component read_sensor is
  port (
    a_in_0 : in STD_LOGIC;
    b_in_0 : in STD_LOGIC;
    internal_clock_0 : in STD_LOGIC;
    gen_clk_0 : out STD_LOGIC;
    result_0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    a_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    b_count : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component read_sensor;
begin
read_sensor_i: component read_sensor
     port map (
      a_count(10 downto 0) => a_count(10 downto 0),
      a_in_0 => a_in_0,
      b_count(10 downto 0) => b_count(10 downto 0),
      b_in_0 => b_in_0,
      gen_clk_0 => gen_clk_0,
      internal_clock_0 => internal_clock_0,
      result_0(10 downto 0) => result_0(10 downto 0)
    );
end STRUCTURE;
