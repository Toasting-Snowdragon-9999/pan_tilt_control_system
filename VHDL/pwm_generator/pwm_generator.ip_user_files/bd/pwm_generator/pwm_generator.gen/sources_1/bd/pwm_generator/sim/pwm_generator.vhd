--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed Apr  2 12:39:49 2025
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
    clk_0 : in STD_LOGIC;
    led_0 : out STD_LOGIC;
    led_1 : out STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of pwm_generator : entity is "pwm_generator,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pwm_generator,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=15,numReposBlks=15,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=11,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of pwm_generator : entity is "pwm_generator.hwdef";
end pwm_generator;

architecture STRUCTURE of pwm_generator is
  component pwm_generator_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_generator_xlconstant_0_0;
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
  component pwm_generator_counter_3_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 26 downto 0 )
  );
  end component pwm_generator_counter_3_0;
  component pwm_generator_fpga_2input_copier_0_0 is
  port (
    in_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    out_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    out_1 : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component pwm_generator_fpga_2input_copier_0_0;
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
    cnt : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component pwm_generator_counter_2_1;
  component pwm_generator_xlconstant_0_2 is
  port (
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component pwm_generator_xlconstant_0_2;
  component pwm_generator_reset_comparator_0_3 is
  port (
    a : in STD_LOGIC_VECTOR ( 26 downto 0 );
    b : in STD_LOGIC_VECTOR ( 26 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_reset_comparator_0_3;
  component pwm_generator_comparator_2_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 26 downto 0 );
    b : in STD_LOGIC_VECTOR ( 26 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_comparator_2_0;
  component pwm_generator_comparator_1_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 26 downto 0 );
    b : in STD_LOGIC_VECTOR ( 26 downto 0 );
    c : out STD_LOGIC
  );
  end component pwm_generator_comparator_1_0;
  component pwm_generator_small_duty_cycle_lut_0_0 is
  port (
    spi_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    duty_constant : out STD_LOGIC_VECTOR ( 26 downto 0 )
  );
  end component pwm_generator_small_duty_cycle_lut_0_0;
  signal clk_frq_constant_1_dout : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal comparator_1_c : STD_LOGIC;
  signal comparator_2_c : STD_LOGIC;
  signal counter_0_cnt1 : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal disabled_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal duty_cycle_lut_1_duty_constant : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal four_constant_0_dout : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal four_counter_0_cnt : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal fpga_2input_copier_0_out_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal fpga_2input_copier_0_out_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal reset_comparator_1_c : STD_LOGIC;
  signal reset_comparator_2_c : STD_LOGIC;
  signal small_duty_cycle_lut_0_duty_constant : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN pwm_generator_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
clear_comparator_1: component pwm_generator_reset_comparator_0_2
     port map (
      a(26 downto 0) => clk_frq_constant_1_dout(26 downto 0),
      b(26 downto 0) => counter_0_cnt1(26 downto 0),
      c => reset_comparator_1_c
    );
clear_comparator_2: component pwm_generator_reset_comparator_0_3
     port map (
      a(26 downto 3) => B"000000000000000000000000",
      a(2 downto 0) => four_counter_0_cnt(2 downto 0),
      b(26 downto 3) => B"000000000000000000000000",
      b(2 downto 0) => four_constant_0_dout(2 downto 0),
      c => reset_comparator_2_c
    );
  clk_frq_constant_1_dout <= X"7735940";
comparator_1: component pwm_generator_comparator_1_0
     port map (
      a(26 downto 3) => B"000000000000000000000000",
      a(2 downto 0) => four_counter_0_cnt(2 downto 0),
      b(26 downto 0) => small_duty_cycle_lut_0_duty_constant(26 downto 0),
      c => comparator_1_c
    );
comparator_2: component pwm_generator_comparator_2_0
     port map (
      a(26 downto 0) => counter_0_cnt1(26 downto 0),
      b(26 downto 0) => duty_cycle_lut_1_duty_constant(26 downto 0),
      c => comparator_2_c
    );
counter_1: component pwm_generator_counter_3_0
     port map (
      clk => clk_0,
      clr => reset_comparator_1_c,
      cnt(26 downto 0) => counter_0_cnt1(26 downto 0),
      en => xlconstant_0_dout(0),
      rst => disabled_0_dout(0)
    );
disabled_0: component pwm_generator_xlconstant_0_1
     port map (
      dout(0) => disabled_0_dout(0)
    );
duty_cycle_lut_1: component pwm_generator_duty_cycle_lut_0_1
     port map (
      duty_constant(26 downto 0) => duty_cycle_lut_1_duty_constant(26 downto 0),
      spi_in(1 downto 0) => fpga_2input_copier_0_out_1(1 downto 0)
    );
enabled_0: component pwm_generator_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
four_constant_0: component pwm_generator_xlconstant_0_2
     port map (
      dout(2 downto 0) => four_constant_0_dout(2 downto 0)
    );
four_counter_0: component pwm_generator_counter_2_1
     port map (
      clk => clk_0,
      clr => reset_comparator_2_c,
      cnt(2 downto 0) => four_counter_0_cnt(2 downto 0),
      en => xlconstant_0_dout(0),
      rst => disabled_0_dout(0)
    );
fpga_2input_copier_0: component pwm_generator_fpga_2input_copier_0_0
     port map (
      in_0(1 downto 0) => sw(1 downto 0),
      out_0(1 downto 0) => fpga_2input_copier_0_out_0(1 downto 0),
      out_1(1 downto 0) => fpga_2input_copier_0_out_1(1 downto 0)
    );
not_gate_0: component pwm_generator_not_gate_1_0
     port map (
      in_1 => comparator_1_c,
      out_1 => led_0
    );
not_gate_1: component pwm_generator_not_gate_0_1
     port map (
      in_1 => comparator_2_c,
      out_1 => led_1
    );
small_duty_cycle_lut_0: component pwm_generator_small_duty_cycle_lut_0_0
     port map (
      duty_constant(26 downto 0) => small_duty_cycle_lut_0_duty_constant(26 downto 0),
      spi_in(1 downto 0) => fpga_2input_copier_0_out_0(1 downto 0)
    );
end STRUCTURE;
