--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
--Date        : Thu Mar 13 16:14:24 2025
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
    a_in_0 : in STD_LOGIC;
    b_in_0 : in STD_LOGIC;
    c_out_0 : out STD_LOGIC;
    clk_0 : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    dir : out STD_LOGIC;
    en : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of better_read_hall_sensor : entity is "better_read_hall_sensor,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=better_read_hall_sensor,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
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
    count : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component better_read_hall_sensor_advanced_counter_0_0;
  component better_read_hall_sensor_comparator_equal_0_0 is
  port (
    a_in : in STD_LOGIC_VECTOR ( 10 downto 0 );
    b_in : in STD_LOGIC_VECTOR ( 10 downto 0 );
    c_out : out STD_LOGIC
  );
  end component better_read_hall_sensor_comparator_equal_0_0;
  component better_read_hall_sensor_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component better_read_hall_sensor_xlconstant_0_1;
  component better_read_hall_sensor_xlconstant_0_2 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component better_read_hall_sensor_xlconstant_0_2;
  component better_read_hall_sensor_generate_clock_0_0 is
  port (
    pwm_a : in STD_LOGIC;
    pwm_b : in STD_LOGIC;
    internal_clock : in STD_LOGIC;
    gen_clk : out STD_LOGIC
  );
  end component better_read_hall_sensor_generate_clock_0_0;
  signal \^count\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \^dir\ : STD_LOGIC;
  signal \^en\ : STD_LOGIC;
  signal xlconstant_0_dout1 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal xlconstant_0_dout2 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN better_read_hall_sensor_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  count(10 downto 0) <= \^count\(10 downto 0);
  dir <= \^dir\;
  en <= \^en\;
determin_direction: component better_read_hall_sensor_advanced_compare_0_0
     port map (
      a_in => a_in_0,
      b_in => b_in_0,
      direction => \^dir\
    );
external_sensor: component better_read_hall_sensor_xlconstant_0_2
     port map (
      dout(0) => xlconstant_0_dout2(0)
    );
generate_clock_0: component better_read_hall_sensor_generate_clock_0_0
     port map (
      gen_clk => \^en\,
      internal_clock => clk_0,
      pwm_a => a_in_0,
      pwm_b => b_in_0
    );
get_deg: component better_read_hall_sensor_advanced_counter_0_0
     port map (
      clk => clk_0,
      count(10 downto 0) => \^count\(10 downto 0),
      en => \^en\,
      rst => xlconstant_0_dout2(0),
      up => \^dir\
    );
max_deg: component better_read_hall_sensor_xlconstant_0_1
     port map (
      dout(10 downto 0) => xlconstant_0_dout1(10 downto 0)
    );
over_max: component better_read_hall_sensor_comparator_equal_0_0
     port map (
      a_in(10 downto 0) => \^count\(10 downto 0),
      b_in(10 downto 0) => xlconstant_0_dout1(10 downto 0),
      c_out => c_out_0
    );
end STRUCTURE;
