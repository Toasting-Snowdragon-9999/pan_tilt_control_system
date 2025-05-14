--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Wed May 14 09:54:31 2025
--Host        : Windows_beast running 64-bit major release  (build 9200)
--Command     : generate_target better_read_hall_sensor.bd
--Design      : better_read_hall_sensor
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity better_read_hall_sensor is
  port (
    clk : in STD_LOGIC;
    count_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    external_sensor : in STD_LOGIC;
    motor_a : in STD_LOGIC;
    motor_b : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of better_read_hall_sensor : entity is "better_read_hall_sensor,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=better_read_hall_sensor,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of better_read_hall_sensor : entity is "better_read_hall_sensor.hwdef";
end better_read_hall_sensor;

architecture STRUCTURE of better_read_hall_sensor is
  component better_read_hall_sensor_advanced_compare_0_0 is
  port (
    a_in : in STD_LOGIC;
    b_in : in STD_LOGIC;
    direction : out STD_LOGIC
  );
  end component better_read_hall_sensor_advanced_compare_0_0;
  component better_read_hall_sensor_advanced_counter_0_0 is
  port (
    clk : in STD_LOGIC;
    up : in STD_LOGIC;
    en : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component better_read_hall_sensor_advanced_counter_0_0;
  component better_read_hall_sensor_generate_clock_0_0 is
  port (
    pwm_a : in STD_LOGIC;
    pwm_b : in STD_LOGIC;
    internal_clock : in STD_LOGIC;
    gen_clk : out STD_LOGIC
  );
  end component better_read_hall_sensor_generate_clock_0_0;
  signal advanced_compare_0_direction : STD_LOGIC;
  signal generate_clock_0_gen_clk : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN better_read_hall_sensor_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 RST.RST RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
determin_direction: component better_read_hall_sensor_advanced_compare_0_0
     port map (
      a_in => motor_a,
      b_in => motor_b,
      direction => advanced_compare_0_direction
    );
generate_clock_0: component better_read_hall_sensor_generate_clock_0_0
     port map (
      gen_clk => generate_clock_0_gen_clk,
      internal_clock => clk,
      pwm_a => motor_a,
      pwm_b => motor_b
    );
get_deg: component better_read_hall_sensor_advanced_counter_0_0
     port map (
      clk => clk,
      clr => external_sensor,
      count(7 downto 0) => count_0(7 downto 0),
      en => generate_clock_0_gen_clk,
      rst => rst,
      up => advanced_compare_0_direction
    );
end STRUCTURE;
