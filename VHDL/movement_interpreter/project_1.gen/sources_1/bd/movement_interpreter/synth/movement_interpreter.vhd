--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed Mar 26 15:48:01 2025
--Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
--Command     : generate_target movement_interpreter.bd
--Design      : movement_interpreter
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity movement_interpreter is
  port (
    IN1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    IN2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    cruise_duty_cycle : out STD_LOGIC_VECTOR ( 2 downto 0 );
    in_0_0 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of movement_interpreter : entity is "movement_interpreter,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=movement_interpreter,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=8,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of movement_interpreter : entity is "movement_interpreter.hwdef";
end movement_interpreter;

architecture STRUCTURE of movement_interpreter is
  component movement_interpreter_mode_selector_0_0 is
  port (
    in_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    h_bridge : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cruise : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component movement_interpreter_mode_selector_0_0;
  component movement_interpreter_comparator_equals_0_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 1 downto 0 );
    b : in STD_LOGIC_VECTOR ( 1 downto 0 );
    c : out STD_LOGIC
  );
  end component movement_interpreter_comparator_equals_0_0;
  component movement_interpreter_conditional_transmit_0_0 is
  port (
    in_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    condition_constant : in STD_LOGIC_VECTOR ( 0 to 0 );
    transmission_constant : in STD_LOGIC_VECTOR ( 2 downto 0 );
    out_0 : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component movement_interpreter_conditional_transmit_0_0;
  component movement_interpreter_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component movement_interpreter_xlconstant_0_0;
  component movement_interpreter_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component movement_interpreter_xlconstant_0_1;
  component movement_interpreter_xlconstant_0_2 is
  port (
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component movement_interpreter_xlconstant_0_2;
  signal comparator_equals_0_c : STD_LOGIC;
  signal mode_selector_0_cruise : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal mode_selector_0_h_bridge : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xlconstant_2_dout : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  IN1 <= mode_selector_0_h_bridge(0 downto 0);
  IN2 <= mode_selector_0_h_bridge(1 downto 1);
comparator_equals_0: component movement_interpreter_comparator_equals_0_0
     port map (
      a(1 downto 0) => mode_selector_0_cruise(1 downto 0),
      b(1 downto 0) => xlconstant_2_dout(1 downto 0),
      c => comparator_equals_0_c
    );
condition_constant_0: component movement_interpreter_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
conditional_transmit_0: component movement_interpreter_conditional_transmit_0_0
     port map (
      condition_constant(0) => xlconstant_0_dout(0),
      in_0(0) => comparator_equals_0_c,
      out_0(2 downto 0) => cruise_duty_cycle(2 downto 0),
      transmission_constant(2 downto 0) => xlconstant_1_dout(2 downto 0)
    );
cruise_constant_2: component movement_interpreter_xlconstant_0_2
     port map (
      dout(3 downto 0) => xlconstant_2_dout(3 downto 0)
    );
mode_selector_0: component movement_interpreter_mode_selector_0_0
     port map (
      cruise(1 downto 0) => mode_selector_0_cruise(1 downto 0),
      h_bridge(1 downto 0) => mode_selector_0_h_bridge(1 downto 0),
      in_0(1 downto 0) => in_0_0(1 downto 0)
    );
transmission_constant_0: component movement_interpreter_xlconstant_0_1
     port map (
      dout(2 downto 0) => xlconstant_1_dout(2 downto 0)
    );
end STRUCTURE;
