-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed May  7 16:50:09 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_clk_divider_0_0/pwm_generator_clk_divider_0_0_sim_netlist.vhdl
-- Design      : pwm_generator_clk_divider_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_clk_divider_0_0_clk_divider is
  port (
    clk_div : out STD_LOGIC;
    rst : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_generator_clk_divider_0_0_clk_divider : entity is "clk_divider";
end pwm_generator_clk_divider_0_0_clk_divider;

architecture STRUCTURE of pwm_generator_clk_divider_0_0_clk_divider is
  signal \^clk_div\ : STD_LOGIC;
  signal clk_div_sig_i_1_n_0 : STD_LOGIC;
  signal clk_div_sig_i_2_n_0 : STD_LOGIC;
  signal clk_div_sig_i_3_n_0 : STD_LOGIC;
  signal clk_div_sig_i_4_n_0 : STD_LOGIC;
  signal clk_div_sig_i_5_n_0 : STD_LOGIC;
  signal count_sig : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal count_sig_0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \count_sig_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \count_sig_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \count_sig_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \count_sig_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \count_sig_reg[15]_i_2_n_2\ : STD_LOGIC;
  signal \count_sig_reg[15]_i_2_n_3\ : STD_LOGIC;
  signal \count_sig_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \count_sig_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \count_sig_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \count_sig_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \count_sig_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \count_sig_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \count_sig_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \count_sig_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \NLW_count_sig_reg[15]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_count_sig_reg[15]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of clk_div_sig_i_3 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count_sig[0]_i_1\ : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \count_sig_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \count_sig_reg[15]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \count_sig_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \count_sig_reg[8]_i_2\ : label is 35;
begin
  clk_div <= \^clk_div\;
clk_div_sig_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => rst,
      I5 => \^clk_div\,
      O => clk_div_sig_i_1_n_0
    );
clk_div_sig_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => count_sig(5),
      I1 => count_sig(4),
      I2 => count_sig(7),
      I3 => count_sig(6),
      O => clk_div_sig_i_2_n_0
    );
clk_div_sig_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => count_sig(1),
      I1 => count_sig(0),
      I2 => count_sig(3),
      I3 => count_sig(2),
      O => clk_div_sig_i_3_n_0
    );
clk_div_sig_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => count_sig(13),
      I1 => count_sig(12),
      I2 => count_sig(15),
      I3 => count_sig(14),
      O => clk_div_sig_i_4_n_0
    );
clk_div_sig_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => count_sig(8),
      I1 => count_sig(9),
      I2 => count_sig(11),
      I3 => count_sig(10),
      O => clk_div_sig_i_5_n_0
    );
clk_div_sig_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => clk_div_sig_i_1_n_0,
      Q => \^clk_div\,
      R => '0'
    );
\count_sig[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count_sig(0),
      O => count_sig_0(0)
    );
\count_sig[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(10),
      O => count_sig_0(10)
    );
\count_sig[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(11),
      O => count_sig_0(11)
    );
\count_sig[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(12),
      O => count_sig_0(12)
    );
\count_sig[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(13),
      O => count_sig_0(13)
    );
\count_sig[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(14),
      O => count_sig_0(14)
    );
\count_sig[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(15),
      O => count_sig_0(15)
    );
\count_sig[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(1),
      O => count_sig_0(1)
    );
\count_sig[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(2),
      O => count_sig_0(2)
    );
\count_sig[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(3),
      O => count_sig_0(3)
    );
\count_sig[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(4),
      O => count_sig_0(4)
    );
\count_sig[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(5),
      O => count_sig_0(5)
    );
\count_sig[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(6),
      O => count_sig_0(6)
    );
\count_sig[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(7),
      O => count_sig_0(7)
    );
\count_sig[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(8),
      O => count_sig_0(8)
    );
\count_sig[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => clk_div_sig_i_2_n_0,
      I1 => clk_div_sig_i_3_n_0,
      I2 => clk_div_sig_i_4_n_0,
      I3 => clk_div_sig_i_5_n_0,
      I4 => data0(9),
      O => count_sig_0(9)
    );
\count_sig_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(0),
      Q => count_sig(0)
    );
\count_sig_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(10),
      Q => count_sig(10)
    );
\count_sig_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(11),
      Q => count_sig(11)
    );
\count_sig_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(12),
      Q => count_sig(12)
    );
\count_sig_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_sig_reg[8]_i_2_n_0\,
      CO(3) => \count_sig_reg[12]_i_2_n_0\,
      CO(2) => \count_sig_reg[12]_i_2_n_1\,
      CO(1) => \count_sig_reg[12]_i_2_n_2\,
      CO(0) => \count_sig_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => count_sig(12 downto 9)
    );
\count_sig_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(13),
      Q => count_sig(13)
    );
\count_sig_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(14),
      Q => count_sig(14)
    );
\count_sig_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(15),
      Q => count_sig(15)
    );
\count_sig_reg[15]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_sig_reg[12]_i_2_n_0\,
      CO(3 downto 2) => \NLW_count_sig_reg[15]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \count_sig_reg[15]_i_2_n_2\,
      CO(0) => \count_sig_reg[15]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_count_sig_reg[15]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(15 downto 13),
      S(3) => '0',
      S(2 downto 0) => count_sig(15 downto 13)
    );
\count_sig_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(1),
      Q => count_sig(1)
    );
\count_sig_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(2),
      Q => count_sig(2)
    );
\count_sig_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(3),
      Q => count_sig(3)
    );
\count_sig_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(4),
      Q => count_sig(4)
    );
\count_sig_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_sig_reg[4]_i_2_n_0\,
      CO(2) => \count_sig_reg[4]_i_2_n_1\,
      CO(1) => \count_sig_reg[4]_i_2_n_2\,
      CO(0) => \count_sig_reg[4]_i_2_n_3\,
      CYINIT => count_sig(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => count_sig(4 downto 1)
    );
\count_sig_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(5),
      Q => count_sig(5)
    );
\count_sig_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(6),
      Q => count_sig(6)
    );
\count_sig_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(7),
      Q => count_sig(7)
    );
\count_sig_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(8),
      Q => count_sig(8)
    );
\count_sig_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_sig_reg[4]_i_2_n_0\,
      CO(3) => \count_sig_reg[8]_i_2_n_0\,
      CO(2) => \count_sig_reg[8]_i_2_n_1\,
      CO(1) => \count_sig_reg[8]_i_2_n_2\,
      CO(0) => \count_sig_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => count_sig(8 downto 5)
    );
\count_sig_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => count_sig_0(9),
      Q => count_sig(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_clk_divider_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clk_div : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_generator_clk_divider_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_clk_divider_0_0 : entity is "pwm_generator_clk_divider_0_0,clk_divider,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_clk_divider_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_clk_divider_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_generator_clk_divider_0_0 : entity is "clk_divider,Vivado 2024.2";
end pwm_generator_clk_divider_0_0;

architecture STRUCTURE of pwm_generator_clk_divider_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN pwm_generator_clk, INSERT_VIP 0";
  attribute x_interface_info of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute x_interface_mode of rst : signal is "slave rst";
  attribute x_interface_parameter of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.pwm_generator_clk_divider_0_0_clk_divider
     port map (
      clk => clk,
      clk_div => clk_div,
      rst => rst
    );
end STRUCTURE;
