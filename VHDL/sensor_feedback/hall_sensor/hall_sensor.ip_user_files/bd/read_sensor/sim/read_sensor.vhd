--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Wed Mar 12 11:43:28 2025
--Host        : Windows_beast running 64-bit major release  (build 9200)
--Command     : generate_target read_sensor.bd
--Design      : read_sensor
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity read_sensor is
  port (
    a_in_0 : in STD_LOGIC;
    b_in_0 : in STD_LOGIC;
    direction_0 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of read_sensor : entity is "read_sensor,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=read_sensor,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of read_sensor : entity is "read_sensor.hwdef";
end read_sensor;

architecture STRUCTURE of read_sensor is
  component read_sensor_advanced_compare_0_0 is
  port (
    a_in : in STD_LOGIC;
    b_in : in STD_LOGIC;
    direction : out STD_LOGIC
  );
  end component read_sensor_advanced_compare_0_0;
begin
advanced_compare_0: component read_sensor_advanced_compare_0_0
     port map (
      a_in => a_in_0,
      b_in => b_in_0,
      direction => direction_0
    );
end STRUCTURE;
