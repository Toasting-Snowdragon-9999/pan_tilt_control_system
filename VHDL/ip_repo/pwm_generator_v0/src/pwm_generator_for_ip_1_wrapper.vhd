--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed May 14 11:19:33 2025
--Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
--Command     : generate_target pwm_generator_for_ip_1_wrapper.bd
--Design      : pwm_generator_for_ip_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_for_ip_1_wrapper is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    pan_duty : out STD_LOGIC;
    pan_ready : out STD_LOGIC;
    pan_speed : in STD_LOGIC_VECTOR ( 4 downto 0 );
    rst : in STD_LOGIC;
    tilt_duty : out STD_LOGIC;
    tilt_ready : out STD_LOGIC;
    tilt_speed : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
end pwm_generator_for_ip_1_wrapper;

architecture STRUCTURE of pwm_generator_for_ip_1_wrapper is
  component pwm_generator_for_ip_1 is
  port (
    tilt_duty : out STD_LOGIC;
    clk : in STD_LOGIC;
    pan_duty : out STD_LOGIC;
    rst : in STD_LOGIC;
    pan_speed : in STD_LOGIC_VECTOR ( 4 downto 0 );
    tilt_speed : in STD_LOGIC_VECTOR ( 4 downto 0 );
    pan_ready : out STD_LOGIC;
    tilt_ready : out STD_LOGIC;
    en : in STD_LOGIC
  );
  end component pwm_generator_for_ip_1;
begin
pwm_generator_for_ip_1_i: component pwm_generator_for_ip_1
     port map (
      clk => clk,
      en => en,
      pan_duty => pan_duty,
      pan_ready => pan_ready,
      pan_speed(4 downto 0) => pan_speed(4 downto 0),
      rst => rst,
      tilt_duty => tilt_duty,
      tilt_ready => tilt_ready,
      tilt_speed(4 downto 0) => tilt_speed(4 downto 0)
    );
end STRUCTURE;
