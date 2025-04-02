-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed Apr  2 09:40:52 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_reset_comparator_0_2/pwm_generator_reset_comparator_0_2_sim_netlist.vhdl
-- Design      : pwm_generator_reset_comparator_0_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_reset_comparator_0_2_equal_comparator is
  port (
    c : out STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 26 downto 0 );
    b : in STD_LOGIC_VECTOR ( 26 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_generator_reset_comparator_0_2_equal_comparator : entity is "equal_comparator";
end pwm_generator_reset_comparator_0_2_equal_comparator;

architecture STRUCTURE of pwm_generator_reset_comparator_0_2_equal_comparator is
  signal c_INST_0_i_10_n_0 : STD_LOGIC;
  signal c_INST_0_i_11_n_0 : STD_LOGIC;
  signal c_INST_0_i_1_n_0 : STD_LOGIC;
  signal c_INST_0_i_1_n_1 : STD_LOGIC;
  signal c_INST_0_i_1_n_2 : STD_LOGIC;
  signal c_INST_0_i_1_n_3 : STD_LOGIC;
  signal c_INST_0_i_2_n_0 : STD_LOGIC;
  signal c_INST_0_i_3_n_0 : STD_LOGIC;
  signal c_INST_0_i_3_n_1 : STD_LOGIC;
  signal c_INST_0_i_3_n_2 : STD_LOGIC;
  signal c_INST_0_i_3_n_3 : STD_LOGIC;
  signal c_INST_0_i_4_n_0 : STD_LOGIC;
  signal c_INST_0_i_5_n_0 : STD_LOGIC;
  signal c_INST_0_i_6_n_0 : STD_LOGIC;
  signal c_INST_0_i_7_n_0 : STD_LOGIC;
  signal c_INST_0_i_8_n_0 : STD_LOGIC;
  signal c_INST_0_i_9_n_0 : STD_LOGIC;
  signal NLW_c_INST_0_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_c_INST_0_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_c_INST_0_i_1_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_c_INST_0_i_3_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
c_INST_0: unisim.vcomponents.CARRY4
     port map (
      CI => c_INST_0_i_1_n_0,
      CO(3 downto 1) => NLW_c_INST_0_CO_UNCONNECTED(3 downto 1),
      CO(0) => c,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_c_INST_0_O_UNCONNECTED(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => c_INST_0_i_2_n_0
    );
c_INST_0_i_1: unisim.vcomponents.CARRY4
     port map (
      CI => c_INST_0_i_3_n_0,
      CO(3) => c_INST_0_i_1_n_0,
      CO(2) => c_INST_0_i_1_n_1,
      CO(1) => c_INST_0_i_1_n_2,
      CO(0) => c_INST_0_i_1_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_c_INST_0_i_1_O_UNCONNECTED(3 downto 0),
      S(3) => c_INST_0_i_4_n_0,
      S(2) => c_INST_0_i_5_n_0,
      S(1) => c_INST_0_i_6_n_0,
      S(0) => c_INST_0_i_7_n_0
    );
c_INST_0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => a(3),
      I1 => b(3),
      I2 => b(5),
      I3 => a(5),
      I4 => b(4),
      I5 => a(4),
      O => c_INST_0_i_10_n_0
    );
c_INST_0_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => a(0),
      I1 => b(0),
      I2 => b(2),
      I3 => a(2),
      I4 => b(1),
      I5 => a(1),
      O => c_INST_0_i_11_n_0
    );
c_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => a(24),
      I1 => b(24),
      I2 => b(26),
      I3 => a(26),
      I4 => b(25),
      I5 => a(25),
      O => c_INST_0_i_2_n_0
    );
c_INST_0_i_3: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => c_INST_0_i_3_n_0,
      CO(2) => c_INST_0_i_3_n_1,
      CO(1) => c_INST_0_i_3_n_2,
      CO(0) => c_INST_0_i_3_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_c_INST_0_i_3_O_UNCONNECTED(3 downto 0),
      S(3) => c_INST_0_i_8_n_0,
      S(2) => c_INST_0_i_9_n_0,
      S(1) => c_INST_0_i_10_n_0,
      S(0) => c_INST_0_i_11_n_0
    );
c_INST_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => a(21),
      I1 => b(21),
      I2 => b(23),
      I3 => a(23),
      I4 => b(22),
      I5 => a(22),
      O => c_INST_0_i_4_n_0
    );
c_INST_0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => a(18),
      I1 => b(18),
      I2 => b(20),
      I3 => a(20),
      I4 => b(19),
      I5 => a(19),
      O => c_INST_0_i_5_n_0
    );
c_INST_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => a(15),
      I1 => b(15),
      I2 => b(17),
      I3 => a(17),
      I4 => b(16),
      I5 => a(16),
      O => c_INST_0_i_6_n_0
    );
c_INST_0_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => a(12),
      I1 => b(12),
      I2 => b(14),
      I3 => a(14),
      I4 => b(13),
      I5 => a(13),
      O => c_INST_0_i_7_n_0
    );
c_INST_0_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => a(9),
      I1 => b(9),
      I2 => b(11),
      I3 => a(11),
      I4 => b(10),
      I5 => a(10),
      O => c_INST_0_i_8_n_0
    );
c_INST_0_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => a(6),
      I1 => b(6),
      I2 => b(8),
      I3 => a(8),
      I4 => b(7),
      I5 => a(7),
      O => c_INST_0_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_reset_comparator_0_2 is
  port (
    a : in STD_LOGIC_VECTOR ( 26 downto 0 );
    b : in STD_LOGIC_VECTOR ( 26 downto 0 );
    c : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_generator_reset_comparator_0_2 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_reset_comparator_0_2 : entity is "pwm_generator_reset_comparator_0_2,equal_comparator,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_reset_comparator_0_2 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_reset_comparator_0_2 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_generator_reset_comparator_0_2 : entity is "equal_comparator,Vivado 2024.2";
end pwm_generator_reset_comparator_0_2;

architecture STRUCTURE of pwm_generator_reset_comparator_0_2 is
begin
U0: entity work.pwm_generator_reset_comparator_0_2_equal_comparator
     port map (
      a(26 downto 0) => a(26 downto 0),
      b(26 downto 0) => b(26 downto 0),
      c => c
    );
end STRUCTURE;
