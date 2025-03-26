--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed Mar 26 15:48:02 2025
--Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
--Command     : generate_target movement_interpreter_wrapper.bd
--Design      : movement_interpreter_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity movement_interpreter_wrapper is
  port (
    IN1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    IN2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    cruise_duty_cycle : out STD_LOGIC_VECTOR ( 2 downto 0 );
    in_0_0 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end movement_interpreter_wrapper;

architecture STRUCTURE of movement_interpreter_wrapper is
  component movement_interpreter is
  port (
    IN2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    IN1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    cruise_duty_cycle : out STD_LOGIC_VECTOR ( 2 downto 0 );
    in_0_0 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component movement_interpreter;
begin
movement_interpreter_i: component movement_interpreter
     port map (
      IN1(0) => IN1(0),
      IN2(0) => IN2(0),
      cruise_duty_cycle(2 downto 0) => cruise_duty_cycle(2 downto 0),
      in_0_0(1 downto 0) => in_0_0(1 downto 0)
    );
end STRUCTURE;
