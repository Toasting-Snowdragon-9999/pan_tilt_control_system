--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed May  7 18:01:44 2025
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
    EN_A : out STD_LOGIC;
    ar : in STD_LOGIC_VECTOR ( 4 downto 0 );
    clk : in STD_LOGIC;
    ja_7 : out STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 3 downto 0 );
    led4_b : out STD_LOGIC;
    led5_g : out STD_LOGIC;
    rpio_12_r : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of pwm_generator : entity is "pwm_generator,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pwm_generator,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=17,numReposBlks=17,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=10,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=1,synth_mode=Hierarchical}";
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
  component pwm_generator_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component pwm_generator_xlslice_0_0;
  component pwm_generator_clk_divider_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clk_div : out STD_LOGIC
  );
  end component pwm_generator_clk_divider_0_0;
  component pwm_generator_pwm_soft_start_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    target_duty_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    pwm_period_pulse_i : in STD_LOGIC;
    duty_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    ready_o : out STD_LOGIC
  );
  end component pwm_generator_pwm_soft_start_0_0;
  signal big_duty_cycle_lut_0_duty_constant : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal big_duty_cycle_lut_1_duty_constant : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal clk_divider_0_clk_div : STD_LOGIC;
  signal disabled_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal disabled_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal four_constant_0_dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal four_constant_0_dout1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal four_counter_0_cnt : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal four_counter_0_cnt1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^led4_b\ : STD_LOGIC;
  signal pwm_soft_start_0_duty_o : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal reset_comparator_2_c : STD_LOGIC;
  signal reset_comparator_2_c1 : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_0_dout1 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN pwm_generator_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  EN_A <= \^led4_b\;
  led4_b <= \^led4_b\;
  rpio_12_r <= \^led4_b\;
big_duty_cycle_lut_0: component pwm_generator_big_duty_cycle_lut_0_0
     port map (
      duty_constant(4 downto 0) => big_duty_cycle_lut_0_duty_constant(4 downto 0),
      en => xlconstant_0_dout(0),
      spi_in(4 downto 0) => ar(4 downto 0)
    );
big_duty_cycle_lut_1: component pwm_generator_big_duty_cycle_lut_0_1
     port map (
      duty_constant(4 downto 0) => big_duty_cycle_lut_1_duty_constant(4 downto 0),
      en => xlconstant_0_dout1(0),
      spi_in(4 downto 0) => ar(4 downto 0)
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
clk_divider_0: component pwm_generator_clk_divider_0_0
     port map (
      clk => clk,
      clk_div => clk_divider_0_clk_div,
      rst => disabled_1_dout(0)
    );
comparator_3: component pwm_generator_comparator_1_1
     port map (
      a(4 downto 0) => big_duty_cycle_lut_0_duty_constant(4 downto 0),
      b(4 downto 0) => four_counter_0_cnt(4 downto 0),
      c => ja_7
    );
comparator_4: component pwm_generator_comparator_3_0
     port map (
      a(4 downto 0) => pwm_soft_start_0_duty_o(4 downto 0),
      b(4 downto 0) => four_counter_0_cnt1(4 downto 0),
      c => \^led4_b\
    );
disabled_0: component pwm_generator_xlconstant_0_1
     port map (
      dout(0) => disabled_0_dout(0)
    );
disabled_1: component pwm_generator_disabled_0_0
     port map (
      dout(0) => disabled_1_dout(0)
    );
enabled_0: component pwm_generator_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
enabled_1: component pwm_generator_enabled_0_0
     port map (
      dout(0) => xlconstant_0_dout1(0)
    );
led_slice: component pwm_generator_xlslice_0_0
     port map (
      Din(4 downto 0) => ar(4 downto 0),
      Dout(3 downto 0) => led(3 downto 0)
    );
pwm_soft_start_0: component pwm_generator_pwm_soft_start_0_0
     port map (
      clk => clk_divider_0_clk_div,
      duty_o(4 downto 0) => pwm_soft_start_0_duty_o(4 downto 0),
      pwm_period_pulse_i => four_counter_0_cnt1(0),
      ready_o => led5_g,
      rst => disabled_1_dout(0),
      target_duty_i(4 downto 0) => big_duty_cycle_lut_1_duty_constant(4 downto 0)
    );
twenty_constant_0: component pwm_generator_xlconstant_0_2
     port map (
      dout(4 downto 0) => four_constant_0_dout(4 downto 0)
    );
twenty_constant_1: component pwm_generator_twentyone_constant_0_0
     port map (
      dout(4 downto 0) => four_constant_0_dout1(4 downto 0)
    );
twenty_counter_1: component pwm_generator_twentyone_counter_0_0
     port map (
      clk => clk_divider_0_clk_div,
      clr => reset_comparator_2_c1,
      cnt(4 downto 0) => four_counter_0_cnt1(4 downto 0),
      en => xlconstant_0_dout1(0),
      rst => disabled_1_dout(0)
    );
twentyone_counter_0: component pwm_generator_counter_2_1
     port map (
      clk => clk_divider_0_clk_div,
      clr => reset_comparator_2_c,
      cnt(4 downto 0) => four_counter_0_cnt(4 downto 0),
      en => xlconstant_0_dout(0),
      rst => disabled_0_dout(0)
    );
end STRUCTURE;
