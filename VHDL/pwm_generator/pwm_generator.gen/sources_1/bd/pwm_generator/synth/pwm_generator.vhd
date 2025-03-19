--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed Mar 19 14:58:59 2025
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
    en_a : out STD_LOGIC;
    en_b : out STD_LOGIC;
    spi_in_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    spi_in_1 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of pwm_generator : entity is "pwm_generator,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pwm_generator,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=14,numReposBlks=14,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=6,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of pwm_generator : entity is "pwm_generator.hwdef";
end pwm_generator;

architecture STRUCTURE of pwm_generator is
  component pwm_generator_counter_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 26 downto 0 )
  );
  end component pwm_generator_counter_0_0;
  component pwm_generator_comparator_0_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 26 downto 0 );
    b : in STD_LOGIC_VECTOR ( 26 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_comparator_0_0;
  component pwm_generator_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_generator_xlconstant_0_0;
  component pwm_generator_comparator_0_2 is
  port (
    a : in STD_LOGIC_VECTOR ( 26 downto 0 );
    b : in STD_LOGIC_VECTOR ( 26 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_comparator_0_2;
  component pwm_generator_counter_0_2 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 26 downto 0 )
  );
  end component pwm_generator_counter_0_2;
  component pwm_generator_enabled_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_generator_enabled_0_1;
  component pwm_generator_duty_cycle_lut_0_0 is
  port (
    spi_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    duty_constant : out STD_LOGIC_VECTOR ( 26 downto 0 )
  );
  end component pwm_generator_duty_cycle_lut_0_0;
  component pwm_generator_duty_cycle_lut_0_1 is
  port (
    spi_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    duty_constant : out STD_LOGIC_VECTOR ( 26 downto 0 )
  );
  end component pwm_generator_duty_cycle_lut_0_1;
  component pwm_generator_reset_comparator_0_2 is
  port (
    a : in STD_LOGIC_VECTOR ( 26 downto 0 );
    b : in STD_LOGIC_VECTOR ( 26 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_reset_comparator_0_2;
  component pwm_generator_equal_comparator_0_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 26 downto 0 );
    b : in STD_LOGIC_VECTOR ( 26 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_equal_comparator_0_0;
  component pwm_generator_not_gate_0_1 is
  port (
    in_1 : in STD_LOGIC;
    out_1 : out STD_LOGIC
  );
  end component pwm_generator_not_gate_0_1;
  component pwm_generator_not_gate_1_0 is
  port (
    in_1 : in STD_LOGIC;
    out_1 : out STD_LOGIC
  );
  end component pwm_generator_not_gate_1_0;
  signal clk_frq_constant_0_dout : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal clk_frq_constant_1_dout : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal comparator_0_c : STD_LOGIC;
  signal comparator_1_c : STD_LOGIC;
  signal counter_0_cnt : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal counter_0_cnt1 : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal duty_cycle_lut_0_duty_constant : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal duty_cycle_lut_1_duty_constant : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal reset_comparator_0_c : STD_LOGIC;
  signal reset_comparator_1_c : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_0_dout1 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN pwm_generator_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  clk_frq_constant_0_dout <= X"7735940";
  clk_frq_constant_1_dout <= X"7735940";
comparator_0: component pwm_generator_comparator_0_0
     port map (
      a(26 downto 0) => counter_0_cnt(26 downto 0),
      b(26 downto 0) => duty_cycle_lut_0_duty_constant(26 downto 0),
      c => comparator_0_c
    );
comparator_1: component pwm_generator_comparator_0_2
     port map (
      a(26 downto 0) => counter_0_cnt1(26 downto 0),
      b(26 downto 0) => duty_cycle_lut_1_duty_constant(26 downto 0),
      c => comparator_1_c
    );
counter_0: component pwm_generator_counter_0_0
     port map (
      clk => clk,
      cnt(26 downto 0) => counter_0_cnt(26 downto 0),
      en => xlconstant_0_dout(0),
      rst => reset_comparator_0_c
    );
counter_1: component pwm_generator_counter_0_2
     port map (
      clk => clk,
      cnt(26 downto 0) => counter_0_cnt1(26 downto 0),
      en => xlconstant_0_dout1(0),
      rst => reset_comparator_1_c
    );
duty_cycle_lut_0: component pwm_generator_duty_cycle_lut_0_0
     port map (
      duty_constant(26 downto 0) => duty_cycle_lut_0_duty_constant(26 downto 0),
      spi_in(1 downto 0) => spi_in_0(1 downto 0)
    );
duty_cycle_lut_1: component pwm_generator_duty_cycle_lut_0_1
     port map (
      duty_constant(26 downto 0) => duty_cycle_lut_1_duty_constant(26 downto 0),
      spi_in(1 downto 0) => spi_in_1(1 downto 0)
    );
enabled_0: component pwm_generator_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
enabled_1: component pwm_generator_enabled_0_1
     port map (
      dout(0) => xlconstant_0_dout1(0)
    );
not_gate_0: component pwm_generator_not_gate_1_0
     port map (
      in_1 => comparator_0_c,
      out_1 => en_a
    );
not_gate_1: component pwm_generator_not_gate_0_1
     port map (
      in_1 => comparator_1_c,
      out_1 => en_b
    );
reset_comparator_0: component pwm_generator_equal_comparator_0_0
     port map (
      a(26 downto 0) => clk_frq_constant_0_dout(26 downto 0),
      b(26 downto 0) => counter_0_cnt(26 downto 0),
      c => reset_comparator_0_c
    );
reset_comparator_1: component pwm_generator_reset_comparator_0_2
     port map (
      a(26 downto 0) => clk_frq_constant_1_dout(26 downto 0),
      b(26 downto 0) => counter_0_cnt1(26 downto 0),
      c => reset_comparator_1_c
    );
end STRUCTURE;
