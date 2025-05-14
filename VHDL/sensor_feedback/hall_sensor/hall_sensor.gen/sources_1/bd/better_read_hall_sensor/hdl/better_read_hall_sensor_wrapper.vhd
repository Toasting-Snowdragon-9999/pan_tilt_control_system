--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Wed May 14 10:09:54 2025
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
    clk : in STD_LOGIC;
    count_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    external_sensor : in STD_LOGIC;
    motor_a : in STD_LOGIC;
    motor_b : in STD_LOGIC;
    rst : in STD_LOGIC
  );
end better_read_hall_sensor_wrapper;

architecture STRUCTURE of better_read_hall_sensor_wrapper is
  component better_read_hall_sensor is
  port (
    motor_a : in STD_LOGIC;
    motor_b : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    external_sensor : in STD_LOGIC;
    count_0 : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component better_read_hall_sensor;
begin
better_read_hall_sensor_i: component better_read_hall_sensor
     port map (
      clk => clk,
      count_0(7 downto 0) => count_0(7 downto 0),
      external_sensor => external_sensor,
      motor_a => motor_a,
      motor_b => motor_b,
      rst => rst
    );
end STRUCTURE;
