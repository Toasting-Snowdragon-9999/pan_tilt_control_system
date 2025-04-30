--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed Apr  9 10:52:16 2025
--Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
--Command     : generate_target pwm_generator.bd
--Design      : pwm_generator
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator is
  port (
    clk : in STD_LOGIC;
    led_0 : out STD_LOGIC;
    led_1 : out STD_LOGIC;
    sw_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    sw_1 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of pwm_generator : entity is "pwm_generator,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pwm_generator,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=20,numReposBlks=20,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=8,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of pwm_generator : entity is "pwm_generator.hwdef";
end pwm_generator;

architecture STRUCTURE of pwm_generator is
  component pwm_generator_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_generator_xlconstant_0_0;
  component pwm_generator_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_generator_xlconstant_0_1;
  component pwm_generator_counter_2_1 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_counter_2_1;
  component pwm_generator_xlconstant_0_2 is
  port (
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_xlconstant_0_2;
  component pwm_generator_reset_comparator_0_3 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    b : in STD_LOGIC_VECTOR ( 4 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_reset_comparator_0_3;
  component pwm_generator_big_duty_cycle_lut_0_0 is
  port (
    spi_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    en : in STD_LOGIC;
    duty_constant : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_big_duty_cycle_lut_0_0;
  component pwm_generator_comparator_1_1 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    b : in STD_LOGIC_VECTOR ( 4 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_comparator_1_1;
  component pwm_generator_big_duty_cycle_lut_0_1 is
  port (
    spi_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    en : in STD_LOGIC;
    duty_constant : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_big_duty_cycle_lut_0_1;
  component pwm_generator_clear_comparator_1_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    b : in STD_LOGIC_VECTOR ( 4 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_clear_comparator_1_0;
  component pwm_generator_comparator_3_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    b : in STD_LOGIC_VECTOR ( 4 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_comparator_3_0;
  component pwm_generator_disabled_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_generator_disabled_0_0;
  component pwm_generator_enabled_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_generator_enabled_0_0;
  component pwm_generator_twentyone_constant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_twentyone_constant_0_0;
  component pwm_generator_twentyone_counter_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_twentyone_counter_0_0;
  component pwm_generator_xlconstant_0_3 is
  port (
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component pwm_generator_xlconstant_0_3;
  component pwm_generator_xlconstant_0_4 is
  port (
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component pwm_generator_xlconstant_0_4;
  component pwm_generator_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_xlconcat_0_0;
  component pwm_generator_xlconcat_0_1 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_xlconcat_0_1;
  component pwm_generator_xlconstant_0_5 is
  port (
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component pwm_generator_xlconstant_0_5;
  component pwm_generator_xlconstant_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component pwm_generator_xlconstant_1_0;
  signal big_duty_cycle_lut_0_duty_constant : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal big_duty_cycle_lut_0_duty_constant1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal disabled_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal disabled_0_dout1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal four_constant_0_dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal four_constant_0_dout1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal four_counter_0_cnt : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal four_counter_0_cnt1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal reset_comparator_2_c : STD_LOGIC;
  signal reset_comparator_2_c1 : STD_LOGIC;
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_0_dout1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_0_dout2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlconstant_2_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlconstant_3_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN pwm_generator_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
big_duty_cycle_lut_0: component pwm_generator_big_duty_cycle_lut_0_0
     port map (
      duty_constant(4 downto 0) => big_duty_cycle_lut_0_duty_constant(4 downto 0),
      en => xlconstant_0_dout(0),
      spi_in(4 downto 0) => xlconcat_0_dout(4 downto 0)
    );
big_duty_cycle_lut_1: component pwm_generator_big_duty_cycle_lut_0_1
     port map (
      duty_constant(4 downto 0) => big_duty_cycle_lut_0_duty_constant1(4 downto 0),
      en => xlconstant_0_dout1(0),
      spi_in(4 downto 0) => xlconcat_1_dout(4 downto 0)
    );
clear_comparator_1: component pwm_generator_reset_comparator_0_3
     port map (
      a(4 downto 0) => four_counter_0_cnt(4 downto 0),
      b(4 downto 0) => four_constant_0_dout(4 downto 0),
      c => reset_comparator_2_c
    );
clear_comparator_2: component pwm_generator_clear_comparator_1_0
     port map (
      a(4 downto 0) => four_counter_0_cnt1(4 downto 0),
      b(4 downto 0) => four_constant_0_dout1(4 downto 0),
      c => reset_comparator_2_c1
    );
comparator_3: component pwm_generator_comparator_1_1
     port map (
      a(4 downto 0) => big_duty_cycle_lut_0_duty_constant(4 downto 0),
      b(4 downto 0) => four_counter_0_cnt(4 downto 0),
      c => led_0
    );
comparator_4: component pwm_generator_comparator_3_0
     port map (
      a(4 downto 0) => big_duty_cycle_lut_0_duty_constant1(4 downto 0),
      b(4 downto 0) => four_counter_0_cnt1(4 downto 0),
      c => led_1
    );
disabled_0: component pwm_generator_xlconstant_0_1
     port map (
      dout(0) => disabled_0_dout(0)
    );
disabled_1: component pwm_generator_disabled_0_0
     port map (
      dout(0) => disabled_0_dout1(0)
    );
enabled_0: component pwm_generator_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
enabled_1: component pwm_generator_enabled_0_0
     port map (
      dout(0) => xlconstant_0_dout1(0)
    );
twentyone_constant_0: component pwm_generator_xlconstant_0_2
     port map (
      dout(4 downto 0) => four_constant_0_dout(4 downto 0)
    );
twentyone_constant_1: component pwm_generator_twentyone_constant_0_0
     port map (
      dout(4 downto 0) => four_constant_0_dout1(4 downto 0)
    );
twentyone_counter_0: component pwm_generator_counter_2_1
     port map (
      clk => clk,
      clr => reset_comparator_2_c,
      cnt(4 downto 0) => four_counter_0_cnt(4 downto 0),
      en => xlconstant_0_dout(0),
      rst => disabled_0_dout(0)
    );
twentyone_counter_1: component pwm_generator_twentyone_counter_0_0
     port map (
      clk => clk,
      clr => reset_comparator_2_c1,
      cnt(4 downto 0) => four_counter_0_cnt1(4 downto 0),
      en => xlconstant_0_dout1(0),
      rst => disabled_0_dout1(0)
    );
xlconcat_0: component pwm_generator_xlconcat_0_0
     port map (
      In0(1 downto 0) => xlconstant_1_dout(1 downto 0),
      In1(0) => sw_0(0),
      In2(1 downto 0) => xlconstant_0_dout2(1 downto 0),
      dout(4 downto 0) => xlconcat_0_dout(4 downto 0)
    );
xlconcat_1: component pwm_generator_xlconcat_0_1
     port map (
      In0(1 downto 0) => xlconstant_3_dout(1 downto 0),
      In1(1 downto 0) => xlconstant_2_dout(1 downto 0),
      In2(0) => sw_1(0),
      dout(4 downto 0) => xlconcat_1_dout(4 downto 0)
    );
xlconstant_0: component pwm_generator_xlconstant_0_3
     port map (
      dout(1 downto 0) => xlconstant_0_dout2(1 downto 0)
    );
xlconstant_1: component pwm_generator_xlconstant_0_4
     port map (
      dout(1 downto 0) => xlconstant_1_dout(1 downto 0)
    );
xlconstant_2: component pwm_generator_xlconstant_0_5
     port map (
      dout(1 downto 0) => xlconstant_2_dout(1 downto 0)
    );
xlconstant_3: component pwm_generator_xlconstant_1_0
     port map (
      dout(1 downto 0) => xlconstant_3_dout(1 downto 0)
    );
end STRUCTURE;
