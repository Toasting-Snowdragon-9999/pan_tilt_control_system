--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed May 14 18:05:02 2025
--Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
--Command     : generate_target pwm_generator_for_ip_1.bd
--Design      : pwm_generator_for_ip_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_for_ip_1 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of pwm_generator_for_ip_1 : entity is "pwm_generator_for_ip_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pwm_generator_for_ip_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=13,numReposBlks=13,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=11,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of pwm_generator_for_ip_1 : entity is "pwm_generator_for_ip_1.hwdef";
end pwm_generator_for_ip_1;

architecture STRUCTURE of pwm_generator_for_ip_1 is
  component pwm_generator_for_ip_1_big_duty_cycle_lut_0_0 is
  port (
    spi_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    en : in STD_LOGIC;
    duty_constant : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_for_ip_1_big_duty_cycle_lut_0_0;
  component pwm_generator_for_ip_1_big_duty_cycle_lut_1_0 is
  port (
    spi_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    en : in STD_LOGIC;
    duty_constant : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_for_ip_1_big_duty_cycle_lut_1_0;
  component pwm_generator_for_ip_1_clear_comparator_1_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    b : in STD_LOGIC_VECTOR ( 4 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_for_ip_1_clear_comparator_1_0;
  component pwm_generator_for_ip_1_clear_comparator_2_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    b : in STD_LOGIC_VECTOR ( 4 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_for_ip_1_clear_comparator_2_0;
  component pwm_generator_for_ip_1_clk_divider_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clk_div : out STD_LOGIC
  );
  end component pwm_generator_for_ip_1_clk_divider_0_0;
  component pwm_generator_for_ip_1_comparator_3_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    b : in STD_LOGIC_VECTOR ( 4 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_for_ip_1_comparator_3_0;
  component pwm_generator_for_ip_1_comparator_4_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    b : in STD_LOGIC_VECTOR ( 4 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_for_ip_1_comparator_4_0;
  component pwm_generator_for_ip_1_pwm_soft_start_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    target_duty_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    pwm_period_pulse_i : in STD_LOGIC;
    duty_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    ready_o : out STD_LOGIC
  );
  end component pwm_generator_for_ip_1_pwm_soft_start_0_0;
  component pwm_generator_for_ip_1_twenty_constant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_for_ip_1_twenty_constant_0_0;
  component pwm_generator_for_ip_1_twenty_constant_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_for_ip_1_twenty_constant_1_0;
  component pwm_generator_for_ip_1_twenty_counter_1_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_for_ip_1_twenty_counter_1_0;
  component pwm_generator_for_ip_1_twentyone_counter_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component pwm_generator_for_ip_1_twentyone_counter_0_0;
  component pwm_generator_for_ip_1_pwm_soft_start_0_1 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    target_duty_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    pwm_period_pulse_i : in STD_LOGIC;
    duty_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    ready_o : out STD_LOGIC
  );
  end component pwm_generator_for_ip_1_pwm_soft_start_0_1;
  signal big_duty_cycle_lut_0_duty_constant : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal big_duty_cycle_lut_1_duty_constant : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal clk_divider_0_clk_div : STD_LOGIC;
  signal four_constant_0_dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal four_constant_0_dout1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal four_counter_0_cnt : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal four_counter_0_cnt1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal pwm_soft_start_0_duty_o : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal pwm_soft_start_1_duty_o : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal reset_comparator_2_c : STD_LOGIC;
  signal reset_comparator_2_c1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN pwm_generator_for_ip_1_clk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
big_duty_cycle_lut_0: component pwm_generator_for_ip_1_big_duty_cycle_lut_0_0
     port map (
      duty_constant(4 downto 0) => big_duty_cycle_lut_0_duty_constant(4 downto 0),
      en => en,
      spi_in(4 downto 0) => pan_speed(4 downto 0)
    );
big_duty_cycle_lut_1: component pwm_generator_for_ip_1_big_duty_cycle_lut_1_0
     port map (
      duty_constant(4 downto 0) => big_duty_cycle_lut_1_duty_constant(4 downto 0),
      en => en,
      spi_in(4 downto 0) => tilt_speed(4 downto 0)
    );
clear_comparator_1: component pwm_generator_for_ip_1_clear_comparator_1_0
     port map (
      a(4 downto 0) => four_counter_0_cnt(4 downto 0),
      b(4 downto 0) => four_constant_0_dout(4 downto 0),
      c => reset_comparator_2_c
    );
clear_comparator_2: component pwm_generator_for_ip_1_clear_comparator_2_0
     port map (
      a(4 downto 0) => four_counter_0_cnt1(4 downto 0),
      b(4 downto 0) => four_constant_0_dout1(4 downto 0),
      c => reset_comparator_2_c1
    );
clk_divider_0: component pwm_generator_for_ip_1_clk_divider_0_0
     port map (
      clk => clk,
      clk_div => clk_divider_0_clk_div,
      rst => rst
    );
comparator_3: component pwm_generator_for_ip_1_comparator_3_0
     port map (
      a(4 downto 0) => pwm_soft_start_1_duty_o(4 downto 0),
      b(4 downto 0) => four_counter_0_cnt(4 downto 0),
      c => pan_duty
    );
comparator_4: component pwm_generator_for_ip_1_comparator_4_0
     port map (
      a(4 downto 0) => pwm_soft_start_0_duty_o(4 downto 0),
      b(4 downto 0) => four_counter_0_cnt1(4 downto 0),
      c => tilt_duty
    );
pwm_soft_start_0: component pwm_generator_for_ip_1_pwm_soft_start_0_0
     port map (
      clk => clk_divider_0_clk_div,
      duty_o(4 downto 0) => pwm_soft_start_0_duty_o(4 downto 0),
      pwm_period_pulse_i => four_counter_0_cnt1(0),
      ready_o => tilt_ready,
      rst => rst,
      target_duty_i(4 downto 0) => big_duty_cycle_lut_1_duty_constant(4 downto 0)
    );
pwm_soft_start_1: component pwm_generator_for_ip_1_pwm_soft_start_0_1
     port map (
      clk => clk_divider_0_clk_div,
      duty_o(4 downto 0) => pwm_soft_start_1_duty_o(4 downto 0),
      pwm_period_pulse_i => four_counter_0_cnt(0),
      ready_o => pan_ready,
      rst => rst,
      target_duty_i(4 downto 0) => big_duty_cycle_lut_0_duty_constant(4 downto 0)
    );
twenty_constant_0: component pwm_generator_for_ip_1_twenty_constant_0_0
     port map (
      dout(4 downto 0) => four_constant_0_dout(4 downto 0)
    );
twenty_constant_1: component pwm_generator_for_ip_1_twenty_constant_1_0
     port map (
      dout(4 downto 0) => four_constant_0_dout1(4 downto 0)
    );
twenty_counter_1: component pwm_generator_for_ip_1_twenty_counter_1_0
     port map (
      clk => clk_divider_0_clk_div,
      clr => reset_comparator_2_c1,
      cnt(4 downto 0) => four_counter_0_cnt1(4 downto 0),
      en => en,
      rst => rst
    );
twentyone_counter_0: component pwm_generator_for_ip_1_twentyone_counter_0_0
     port map (
      clk => clk_divider_0_clk_div,
      clr => reset_comparator_2_c,
      cnt(4 downto 0) => four_counter_0_cnt(4 downto 0),
      en => en,
      rst => rst
    );
end STRUCTURE;
