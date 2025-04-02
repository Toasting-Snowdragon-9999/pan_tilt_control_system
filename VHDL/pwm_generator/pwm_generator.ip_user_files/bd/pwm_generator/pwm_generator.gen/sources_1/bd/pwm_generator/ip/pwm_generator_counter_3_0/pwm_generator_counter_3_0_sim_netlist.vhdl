-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed Apr  2 09:40:58 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_counter_3_0/pwm_generator_counter_3_0_sim_netlist.vhdl
-- Design      : pwm_generator_counter_3_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_counter_3_0_counter is
  port (
    cnt : out STD_LOGIC_VECTOR ( 26 downto 0 );
    en : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_generator_counter_3_0_counter : entity is "counter";
end pwm_generator_counter_3_0_counter;

architecture STRUCTURE of pwm_generator_counter_3_0_counter is
  signal \^cnt\ : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal \cnt_temp[26]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_temp[3]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_temp_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_temp_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_temp_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_temp_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_temp_reg[11]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_temp_reg[11]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_temp_reg[11]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_temp_reg[11]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_temp_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_temp_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_temp_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_temp_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_temp_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_temp_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_temp_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_temp_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_temp_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_temp_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_temp_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_temp_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_temp_reg[19]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_temp_reg[19]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_temp_reg[19]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_temp_reg[19]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_temp_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_temp_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_temp_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_temp_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_temp_reg[23]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_temp_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_temp_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_temp_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_temp_reg[26]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_temp_reg[26]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_temp_reg[26]_i_2_n_5\ : STD_LOGIC;
  signal \cnt_temp_reg[26]_i_2_n_6\ : STD_LOGIC;
  signal \cnt_temp_reg[26]_i_2_n_7\ : STD_LOGIC;
  signal \cnt_temp_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_temp_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_temp_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_temp_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_temp_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_temp_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_temp_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_temp_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \cnt_temp_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_temp_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \cnt_temp_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \cnt_temp_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \cnt_temp_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \cnt_temp_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \cnt_temp_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \cnt_temp_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_cnt_temp_reg[26]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_cnt_temp_reg[26]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \cnt_temp_reg[11]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_temp_reg[15]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_temp_reg[19]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_temp_reg[23]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_temp_reg[26]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_temp_reg[3]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \cnt_temp_reg[7]_i_1\ : label is 11;
begin
  cnt(26 downto 0) <= \^cnt\(26 downto 0);
\cnt_temp[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rst,
      I1 => clr,
      O => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^cnt\(0),
      O => \cnt_temp[3]_i_2_n_0\
    );
\cnt_temp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[3]_i_1_n_7\,
      Q => \^cnt\(0),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[11]_i_1_n_5\,
      Q => \^cnt\(10),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[11]_i_1_n_4\,
      Q => \^cnt\(11),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_temp_reg[7]_i_1_n_0\,
      CO(3) => \cnt_temp_reg[11]_i_1_n_0\,
      CO(2) => \cnt_temp_reg[11]_i_1_n_1\,
      CO(1) => \cnt_temp_reg[11]_i_1_n_2\,
      CO(0) => \cnt_temp_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_temp_reg[11]_i_1_n_4\,
      O(2) => \cnt_temp_reg[11]_i_1_n_5\,
      O(1) => \cnt_temp_reg[11]_i_1_n_6\,
      O(0) => \cnt_temp_reg[11]_i_1_n_7\,
      S(3 downto 0) => \^cnt\(11 downto 8)
    );
\cnt_temp_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[15]_i_1_n_7\,
      Q => \^cnt\(12),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[15]_i_1_n_6\,
      Q => \^cnt\(13),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[15]_i_1_n_5\,
      Q => \^cnt\(14),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[15]_i_1_n_4\,
      Q => \^cnt\(15),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_temp_reg[11]_i_1_n_0\,
      CO(3) => \cnt_temp_reg[15]_i_1_n_0\,
      CO(2) => \cnt_temp_reg[15]_i_1_n_1\,
      CO(1) => \cnt_temp_reg[15]_i_1_n_2\,
      CO(0) => \cnt_temp_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_temp_reg[15]_i_1_n_4\,
      O(2) => \cnt_temp_reg[15]_i_1_n_5\,
      O(1) => \cnt_temp_reg[15]_i_1_n_6\,
      O(0) => \cnt_temp_reg[15]_i_1_n_7\,
      S(3 downto 0) => \^cnt\(15 downto 12)
    );
\cnt_temp_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[19]_i_1_n_7\,
      Q => \^cnt\(16),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[19]_i_1_n_6\,
      Q => \^cnt\(17),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[19]_i_1_n_5\,
      Q => \^cnt\(18),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[19]_i_1_n_4\,
      Q => \^cnt\(19),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_temp_reg[15]_i_1_n_0\,
      CO(3) => \cnt_temp_reg[19]_i_1_n_0\,
      CO(2) => \cnt_temp_reg[19]_i_1_n_1\,
      CO(1) => \cnt_temp_reg[19]_i_1_n_2\,
      CO(0) => \cnt_temp_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_temp_reg[19]_i_1_n_4\,
      O(2) => \cnt_temp_reg[19]_i_1_n_5\,
      O(1) => \cnt_temp_reg[19]_i_1_n_6\,
      O(0) => \cnt_temp_reg[19]_i_1_n_7\,
      S(3 downto 0) => \^cnt\(19 downto 16)
    );
\cnt_temp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[3]_i_1_n_6\,
      Q => \^cnt\(1),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[23]_i_1_n_7\,
      Q => \^cnt\(20),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[23]_i_1_n_6\,
      Q => \^cnt\(21),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[23]_i_1_n_5\,
      Q => \^cnt\(22),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[23]_i_1_n_4\,
      Q => \^cnt\(23),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_temp_reg[19]_i_1_n_0\,
      CO(3) => \cnt_temp_reg[23]_i_1_n_0\,
      CO(2) => \cnt_temp_reg[23]_i_1_n_1\,
      CO(1) => \cnt_temp_reg[23]_i_1_n_2\,
      CO(0) => \cnt_temp_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_temp_reg[23]_i_1_n_4\,
      O(2) => \cnt_temp_reg[23]_i_1_n_5\,
      O(1) => \cnt_temp_reg[23]_i_1_n_6\,
      O(0) => \cnt_temp_reg[23]_i_1_n_7\,
      S(3 downto 0) => \^cnt\(23 downto 20)
    );
\cnt_temp_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[26]_i_2_n_7\,
      Q => \^cnt\(24),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[26]_i_2_n_6\,
      Q => \^cnt\(25),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[26]_i_2_n_5\,
      Q => \^cnt\(26),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[26]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_temp_reg[23]_i_1_n_0\,
      CO(3 downto 2) => \NLW_cnt_temp_reg[26]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \cnt_temp_reg[26]_i_2_n_2\,
      CO(0) => \cnt_temp_reg[26]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_cnt_temp_reg[26]_i_2_O_UNCONNECTED\(3),
      O(2) => \cnt_temp_reg[26]_i_2_n_5\,
      O(1) => \cnt_temp_reg[26]_i_2_n_6\,
      O(0) => \cnt_temp_reg[26]_i_2_n_7\,
      S(3) => '0',
      S(2 downto 0) => \^cnt\(26 downto 24)
    );
\cnt_temp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[3]_i_1_n_5\,
      Q => \^cnt\(2),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[3]_i_1_n_4\,
      Q => \^cnt\(3),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cnt_temp_reg[3]_i_1_n_0\,
      CO(2) => \cnt_temp_reg[3]_i_1_n_1\,
      CO(1) => \cnt_temp_reg[3]_i_1_n_2\,
      CO(0) => \cnt_temp_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \cnt_temp_reg[3]_i_1_n_4\,
      O(2) => \cnt_temp_reg[3]_i_1_n_5\,
      O(1) => \cnt_temp_reg[3]_i_1_n_6\,
      O(0) => \cnt_temp_reg[3]_i_1_n_7\,
      S(3 downto 1) => \^cnt\(3 downto 1),
      S(0) => \cnt_temp[3]_i_2_n_0\
    );
\cnt_temp_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[7]_i_1_n_7\,
      Q => \^cnt\(4),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[7]_i_1_n_6\,
      Q => \^cnt\(5),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[7]_i_1_n_5\,
      Q => \^cnt\(6),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[7]_i_1_n_4\,
      Q => \^cnt\(7),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_temp_reg[3]_i_1_n_0\,
      CO(3) => \cnt_temp_reg[7]_i_1_n_0\,
      CO(2) => \cnt_temp_reg[7]_i_1_n_1\,
      CO(1) => \cnt_temp_reg[7]_i_1_n_2\,
      CO(0) => \cnt_temp_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_temp_reg[7]_i_1_n_4\,
      O(2) => \cnt_temp_reg[7]_i_1_n_5\,
      O(1) => \cnt_temp_reg[7]_i_1_n_6\,
      O(0) => \cnt_temp_reg[7]_i_1_n_7\,
      S(3 downto 0) => \^cnt\(7 downto 4)
    );
\cnt_temp_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[11]_i_1_n_7\,
      Q => \^cnt\(8),
      R => \cnt_temp[26]_i_1_n_0\
    );
\cnt_temp_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => \cnt_temp_reg[11]_i_1_n_6\,
      Q => \^cnt\(9),
      R => \cnt_temp[26]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_counter_3_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 26 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_generator_counter_3_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_counter_3_0 : entity is "pwm_generator_counter_3_0,counter,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_counter_3_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_counter_3_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_generator_counter_3_0 : entity is "counter,Vivado 2024.2";
end pwm_generator_counter_3_0;

architecture STRUCTURE of pwm_generator_counter_3_0 is
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
U0: entity work.pwm_generator_counter_3_0_counter
     port map (
      clk => clk,
      clr => clr,
      cnt(26 downto 0) => cnt(26 downto 0),
      en => en,
      rst => rst
    );
end STRUCTURE;
