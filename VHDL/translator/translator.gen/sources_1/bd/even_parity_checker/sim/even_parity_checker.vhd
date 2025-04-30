--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed Apr 23 14:56:59 2025
--Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
--Command     : generate_target even_parity_checker.bd
--Design      : even_parity_checker
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity even_parity_checker is
  port (
    data_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    en : in STD_LOGIC;
    fail : out STD_LOGIC;
    pass : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of even_parity_checker : entity is "even_parity_checker,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=even_parity_checker,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=20,numReposBlks=20,numNonXlnxBlks=9,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of even_parity_checker : entity is "even_parity_checker.hwdef";
end even_parity_checker;

architecture STRUCTURE of even_parity_checker is
  component even_parity_checker_xor_gate_0_0 is
  port (
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    c : out STD_LOGIC
  );
  end component even_parity_checker_xor_gate_0_0;
  component even_parity_checker_xor_gate_0_1 is
  port (
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    c : out STD_LOGIC
  );
  end component even_parity_checker_xor_gate_0_1;
  component even_parity_checker_xor_gate_0_2 is
  port (
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    c : out STD_LOGIC
  );
  end component even_parity_checker_xor_gate_0_2;
  component even_parity_checker_xor_gate_0_3 is
  port (
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    c : out STD_LOGIC
  );
  end component even_parity_checker_xor_gate_0_3;
  component even_parity_checker_xor_gate_0_4 is
  port (
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    c : out STD_LOGIC
  );
  end component even_parity_checker_xor_gate_0_4;
  component even_parity_checker_xor_gate_0_5 is
  port (
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    c : out STD_LOGIC
  );
  end component even_parity_checker_xor_gate_0_5;
  component even_parity_checker_xor_gate_0_6 is
  port (
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    c : out STD_LOGIC
  );
  end component even_parity_checker_xor_gate_0_6;
  component even_parity_checker_pass_fail_0_0 is
  port (
    inp : in STD_LOGIC;
    en : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pass : out STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    fail : out STD_LOGIC
  );
  end component even_parity_checker_pass_fail_0_0;
  component even_parity_checker_not_gate_0_0 is
  port (
    a : in STD_LOGIC;
    b : out STD_LOGIC
  );
  end component even_parity_checker_not_gate_0_0;
  component even_parity_checker_xor_gate_8_0 is
  port (
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    c : out STD_LOGIC
  );
  end component even_parity_checker_xor_gate_8_0;
  component even_parity_checker_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component even_parity_checker_xlslice_0_0;
  component even_parity_checker_bit_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component even_parity_checker_bit_0_0;
  component even_parity_checker_bit_1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component even_parity_checker_bit_1_0;
  component even_parity_checker_bit_2_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component even_parity_checker_bit_2_0;
  component even_parity_checker_bit_2_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component even_parity_checker_bit_2_1;
  component even_parity_checker_bit_2_2 is
  port (
    Din : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component even_parity_checker_bit_2_2;
  component even_parity_checker_bit_2_3 is
  port (
    Din : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component even_parity_checker_bit_2_3;
  component even_parity_checker_bit_2_4 is
  port (
    Din : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component even_parity_checker_bit_2_4;
  component even_parity_checker_bit_2_5 is
  port (
    Din : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component even_parity_checker_bit_2_5;
  component even_parity_checker_xlslice_0_2 is
  port (
    Din : in STD_LOGIC_VECTOR ( 8 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component even_parity_checker_xlslice_0_2;
  signal bit_0_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bit_1_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bit_2_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bit_3_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bit_4_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bit_5_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bit_6_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bit_7_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal bit_8_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal not_gate_0_b : STD_LOGIC;
  signal parity_off_0_Dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xor_gate_0_c : STD_LOGIC;
  signal xor_gate_1_c : STD_LOGIC;
  signal xor_gate_2_c : STD_LOGIC;
  signal xor_gate_3_c : STD_LOGIC;
  signal xor_gate_4_c : STD_LOGIC;
  signal xor_gate_5_c : STD_LOGIC;
  signal xor_gate_6_c : STD_LOGIC;
  signal xor_gate_8_c : STD_LOGIC;
begin
bit_0: component even_parity_checker_xlslice_0_0
     port map (
      Din(8 downto 0) => data_in(8 downto 0),
      Dout(0) => bit_0_Dout(0)
    );
bit_1: component even_parity_checker_bit_0_0
     port map (
      Din(8 downto 0) => data_in(8 downto 0),
      Dout(0) => bit_1_Dout(0)
    );
bit_2: component even_parity_checker_bit_1_0
     port map (
      Din(8 downto 0) => data_in(8 downto 0),
      Dout(0) => bit_2_Dout(0)
    );
bit_3: component even_parity_checker_bit_2_0
     port map (
      Din(8 downto 0) => data_in(8 downto 0),
      Dout(0) => bit_3_Dout(0)
    );
bit_4: component even_parity_checker_bit_2_1
     port map (
      Din(8 downto 0) => data_in(8 downto 0),
      Dout(0) => bit_4_Dout(0)
    );
bit_5: component even_parity_checker_bit_2_2
     port map (
      Din(8 downto 0) => data_in(8 downto 0),
      Dout(0) => bit_5_Dout(0)
    );
bit_6: component even_parity_checker_bit_2_3
     port map (
      Din(8 downto 0) => data_in(8 downto 0),
      Dout(0) => bit_6_Dout(0)
    );
bit_7: component even_parity_checker_bit_2_4
     port map (
      Din(8 downto 0) => data_in(8 downto 0),
      Dout(0) => bit_7_Dout(0)
    );
bit_8: component even_parity_checker_bit_2_5
     port map (
      Din(8 downto 0) => data_in(8 downto 0),
      Dout(0) => bit_8_Dout(0)
    );
not_gate_0: component even_parity_checker_not_gate_0_0
     port map (
      a => xor_gate_8_c,
      b => not_gate_0_b
    );
parity_off_0: component even_parity_checker_xlslice_0_2
     port map (
      Din(8 downto 0) => data_in(8 downto 0),
      Dout(7 downto 0) => parity_off_0_Dout(7 downto 0)
    );
pass_fail_0: component even_parity_checker_pass_fail_0_0
     port map (
      data_in(7 downto 0) => parity_off_0_Dout(7 downto 0),
      data_out(7 downto 0) => data_out(7 downto 0),
      en => en,
      fail => fail,
      inp => not_gate_0_b,
      pass => pass
    );
xor_gate_0: component even_parity_checker_xor_gate_0_0
     port map (
      a => bit_0_Dout(0),
      b => bit_1_Dout(0),
      c => xor_gate_0_c
    );
xor_gate_1: component even_parity_checker_xor_gate_0_1
     port map (
      a => bit_2_Dout(0),
      b => bit_3_Dout(0),
      c => xor_gate_1_c
    );
xor_gate_2: component even_parity_checker_xor_gate_0_2
     port map (
      a => bit_4_Dout(0),
      b => bit_5_Dout(0),
      c => xor_gate_2_c
    );
xor_gate_3: component even_parity_checker_xor_gate_0_3
     port map (
      a => bit_6_Dout(0),
      b => bit_7_Dout(0),
      c => xor_gate_3_c
    );
xor_gate_4: component even_parity_checker_xor_gate_0_4
     port map (
      a => xor_gate_5_c,
      b => xor_gate_6_c,
      c => xor_gate_4_c
    );
xor_gate_5: component even_parity_checker_xor_gate_0_5
     port map (
      a => xor_gate_0_c,
      b => xor_gate_1_c,
      c => xor_gate_5_c
    );
xor_gate_6: component even_parity_checker_xor_gate_0_6
     port map (
      a => xor_gate_2_c,
      b => xor_gate_3_c,
      c => xor_gate_6_c
    );
xor_gate_7: component even_parity_checker_xor_gate_8_0
     port map (
      a => bit_8_Dout(0),
      b => xor_gate_4_c,
      c => xor_gate_8_c
    );
end STRUCTURE;
