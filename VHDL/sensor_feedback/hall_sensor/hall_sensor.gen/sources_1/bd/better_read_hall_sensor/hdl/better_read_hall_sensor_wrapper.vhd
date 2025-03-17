--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Thu Mar 13 16:14:24 2025
--Host        : Windows_beast running 64-bit major release  (build 9200)
--Command     : generate_target better_read_hall_sensor_wrapper.bd
--Design      : better_read_hall_sensor_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity better_read_hall_sensor_wrapper is
  port (
    a_in_0 : in STD_LOGIC;
    b_in_0 : in STD_LOGIC;
    c_out_0 : out STD_LOGIC;
    clk_0 : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    dir : out STD_LOGIC;
    en : out STD_LOGIC
  );
end better_read_hall_sensor_wrapper;

architecture STRUCTURE of better_read_hall_sensor_wrapper is
  component better_read_hall_sensor is
  port (
    a_in_0 : in STD_LOGIC;
    b_in_0 : in STD_LOGIC;
    clk_0 : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    c_out_0 : out STD_LOGIC;
    dir : out STD_LOGIC;
    en : out STD_LOGIC
  );
  end component better_read_hall_sensor;
begin
better_read_hall_sensor_i: component better_read_hall_sensor
     port map (
      a_in_0 => a_in_0,
      b_in_0 => b_in_0,
      c_out_0 => c_out_0,
      clk_0 => clk_0,
      count(10 downto 0) => count(10 downto 0),
      dir => dir,
      en => en
    );
end STRUCTURE;
