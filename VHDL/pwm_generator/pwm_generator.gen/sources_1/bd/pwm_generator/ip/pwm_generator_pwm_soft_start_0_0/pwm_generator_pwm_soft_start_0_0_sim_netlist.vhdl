-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed May  7 17:11:55 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_pwm_soft_start_0_0/pwm_generator_pwm_soft_start_0_0_sim_netlist.vhdl
-- Design      : pwm_generator_pwm_soft_start_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_pwm_soft_start_0_0_pwm_soft_start is
  port (
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    ready_o : out STD_LOGIC;
    pwm_period_pulse_i : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    target_duty_i : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_generator_pwm_soft_start_0_0_pwm_soft_start : entity is "pwm_soft_start";
end pwm_generator_pwm_soft_start_0_0_pwm_soft_start;

architecture STRUCTURE of pwm_generator_pwm_soft_start_0_0_pwm_soft_start is
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \duty_reg[4]_i_10_n_0\ : STD_LOGIC;
  signal \duty_reg[4]_i_11_n_0\ : STD_LOGIC;
  signal \duty_reg[4]_i_12_n_0\ : STD_LOGIC;
  signal \duty_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \duty_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \duty_reg[4]_i_4_n_0\ : STD_LOGIC;
  signal \duty_reg[4]_i_5_n_0\ : STD_LOGIC;
  signal \duty_reg[4]_i_6_n_0\ : STD_LOGIC;
  signal \duty_reg[4]_i_7_n_0\ : STD_LOGIC;
  signal \duty_reg[4]_i_8_n_0\ : STD_LOGIC;
  signal \duty_reg[4]_i_9_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ready_o_INST_0_i_1_n_0 : STD_LOGIC;
  signal ready_o_INST_0_i_2_n_0 : STD_LOGIC;
  signal update_cnt : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal update_cnt_0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \update_cnt_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \update_cnt_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \update_cnt_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \update_cnt_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \update_cnt_reg[15]_i_2_n_2\ : STD_LOGIC;
  signal \update_cnt_reg[15]_i_2_n_3\ : STD_LOGIC;
  signal \update_cnt_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \update_cnt_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \update_cnt_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \update_cnt_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \update_cnt_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \update_cnt_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \update_cnt_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \update_cnt_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \NLW_update_cnt_reg[15]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_update_cnt_reg[15]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \duty_reg[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \duty_reg[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \duty_reg[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \duty_reg[4]_i_11\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \duty_reg[4]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \duty_reg[4]_i_5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \duty_reg[4]_i_9\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \update_cnt[0]_i_1\ : label is "soft_lutpair2";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \update_cnt_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \update_cnt_reg[15]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \update_cnt_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \update_cnt_reg[8]_i_2\ : label is 35;
begin
  Q(4 downto 0) <= \^q\(4 downto 0);
\duty_reg[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => p_0_in(0)
    );
\duty_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \duty_reg[4]_i_10_n_0\,
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => p_0_in(1)
    );
\duty_reg[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9CC6"
    )
        port map (
      I0 => \duty_reg[4]_i_10_n_0\,
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      O => p_0_in(2)
    );
\duty_reg[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE7F0180"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \duty_reg[4]_i_10_n_0\,
      I4 => \^q\(3),
      O => p_0_in(3)
    );
\duty_reg[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rst,
      I1 => \duty_reg[4]_i_4_n_0\,
      O => \duty_reg[4]_i_1_n_0\
    );
\duty_reg[4]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4F04DF0D"
    )
        port map (
      I0 => target_duty_i(3),
      I1 => \^q\(3),
      I2 => target_duty_i(4),
      I3 => \^q\(4),
      I4 => \duty_reg[4]_i_12_n_0\,
      O => \duty_reg[4]_i_10_n_0\
    );
\duty_reg[4]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"95555555"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      O => \duty_reg[4]_i_11_n_0\
    );
\duty_reg[4]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44D4DDDD444444D4"
    )
        port map (
      I0 => \^q\(2),
      I1 => target_duty_i(2),
      I2 => target_duty_i(0),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => target_duty_i(1),
      O => \duty_reg[4]_i_12_n_0\
    );
\duty_reg[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000000000000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => ready_o_INST_0_i_1_n_0,
      I5 => pwm_period_pulse_i,
      O => \duty_reg[4]_i_2_n_0\
    );
\duty_reg[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => \duty_reg[4]_i_9_n_0\,
      I1 => \duty_reg[4]_i_10_n_0\,
      I2 => \duty_reg[4]_i_11_n_0\,
      O => p_0_in(4)
    );
\duty_reg[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => target_duty_i(3),
      I1 => target_duty_i(4),
      I2 => target_duty_i(2),
      I3 => pwm_period_pulse_i,
      I4 => target_duty_i(1),
      I5 => target_duty_i(0),
      O => \duty_reg[4]_i_4_n_0\
    );
\duty_reg[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => update_cnt(12),
      I1 => update_cnt(15),
      I2 => update_cnt(0),
      I3 => update_cnt(6),
      O => \duty_reg[4]_i_5_n_0\
    );
\duty_reg[4]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => update_cnt(3),
      I1 => update_cnt(1),
      I2 => update_cnt(10),
      I3 => update_cnt(8),
      O => \duty_reg[4]_i_6_n_0\
    );
\duty_reg[4]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => update_cnt(11),
      I1 => update_cnt(4),
      I2 => update_cnt(2),
      I3 => update_cnt(13),
      O => \duty_reg[4]_i_7_n_0\
    );
\duty_reg[4]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => update_cnt(5),
      I1 => update_cnt(7),
      I2 => update_cnt(14),
      I3 => update_cnt(9),
      O => \duty_reg[4]_i_8_n_0\
    );
\duty_reg[4]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \duty_reg[4]_i_9_n_0\
    );
\duty_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \duty_reg[4]_i_2_n_0\,
      D => p_0_in(0),
      Q => \^q\(0),
      R => \duty_reg[4]_i_1_n_0\
    );
\duty_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \duty_reg[4]_i_2_n_0\,
      D => p_0_in(1),
      Q => \^q\(1),
      R => \duty_reg[4]_i_1_n_0\
    );
\duty_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \duty_reg[4]_i_2_n_0\,
      D => p_0_in(2),
      Q => \^q\(2),
      R => \duty_reg[4]_i_1_n_0\
    );
\duty_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \duty_reg[4]_i_2_n_0\,
      D => p_0_in(3),
      Q => \^q\(3),
      R => \duty_reg[4]_i_1_n_0\
    );
\duty_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \duty_reg[4]_i_2_n_0\,
      D => p_0_in(4),
      Q => \^q\(4),
      R => \duty_reg[4]_i_1_n_0\
    );
ready_o_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ready_o_INST_0_i_1_n_0,
      O => ready_o
    );
ready_o_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F6FFFFF6"
    )
        port map (
      I0 => target_duty_i(3),
      I1 => \^q\(3),
      I2 => ready_o_INST_0_i_2_n_0,
      I3 => \^q\(4),
      I4 => target_duty_i(4),
      O => ready_o_INST_0_i_1_n_0
    );
ready_o_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \^q\(0),
      I1 => target_duty_i(0),
      I2 => \^q\(1),
      I3 => target_duty_i(1),
      I4 => \^q\(2),
      I5 => target_duty_i(2),
      O => ready_o_INST_0_i_2_n_0
    );
\update_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => update_cnt(0),
      O => update_cnt_0(0)
    );
\update_cnt[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(10),
      O => update_cnt_0(10)
    );
\update_cnt[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(11),
      O => update_cnt_0(11)
    );
\update_cnt[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(12),
      O => update_cnt_0(12)
    );
\update_cnt[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(13),
      O => update_cnt_0(13)
    );
\update_cnt[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(14),
      O => update_cnt_0(14)
    );
\update_cnt[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(15),
      O => update_cnt_0(15)
    );
\update_cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(1),
      O => update_cnt_0(1)
    );
\update_cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(2),
      O => update_cnt_0(2)
    );
\update_cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(3),
      O => update_cnt_0(3)
    );
\update_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(4),
      O => update_cnt_0(4)
    );
\update_cnt[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(5),
      O => update_cnt_0(5)
    );
\update_cnt[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(6),
      O => update_cnt_0(6)
    );
\update_cnt[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(7),
      O => update_cnt_0(7)
    );
\update_cnt[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(8),
      O => update_cnt_0(8)
    );
\update_cnt[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0000"
    )
        port map (
      I0 => \duty_reg[4]_i_5_n_0\,
      I1 => \duty_reg[4]_i_6_n_0\,
      I2 => \duty_reg[4]_i_7_n_0\,
      I3 => \duty_reg[4]_i_8_n_0\,
      I4 => data0(9),
      O => update_cnt_0(9)
    );
\update_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(0),
      Q => update_cnt(0),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(10),
      Q => update_cnt(10),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(11),
      Q => update_cnt(11),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(12),
      Q => update_cnt(12),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \update_cnt_reg[8]_i_2_n_0\,
      CO(3) => \update_cnt_reg[12]_i_2_n_0\,
      CO(2) => \update_cnt_reg[12]_i_2_n_1\,
      CO(1) => \update_cnt_reg[12]_i_2_n_2\,
      CO(0) => \update_cnt_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => update_cnt(12 downto 9)
    );
\update_cnt_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(13),
      Q => update_cnt(13),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(14),
      Q => update_cnt(14),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(15),
      Q => update_cnt(15),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[15]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \update_cnt_reg[12]_i_2_n_0\,
      CO(3 downto 2) => \NLW_update_cnt_reg[15]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \update_cnt_reg[15]_i_2_n_2\,
      CO(0) => \update_cnt_reg[15]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_update_cnt_reg[15]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(15 downto 13),
      S(3) => '0',
      S(2 downto 0) => update_cnt(15 downto 13)
    );
\update_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(1),
      Q => update_cnt(1),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(2),
      Q => update_cnt(2),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(3),
      Q => update_cnt(3),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(4),
      Q => update_cnt(4),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \update_cnt_reg[4]_i_2_n_0\,
      CO(2) => \update_cnt_reg[4]_i_2_n_1\,
      CO(1) => \update_cnt_reg[4]_i_2_n_2\,
      CO(0) => \update_cnt_reg[4]_i_2_n_3\,
      CYINIT => update_cnt(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => update_cnt(4 downto 1)
    );
\update_cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(5),
      Q => update_cnt(5),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(6),
      Q => update_cnt(6),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(7),
      Q => update_cnt(7),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(8),
      Q => update_cnt(8),
      R => \duty_reg[4]_i_1_n_0\
    );
\update_cnt_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \update_cnt_reg[4]_i_2_n_0\,
      CO(3) => \update_cnt_reg[8]_i_2_n_0\,
      CO(2) => \update_cnt_reg[8]_i_2_n_1\,
      CO(1) => \update_cnt_reg[8]_i_2_n_2\,
      CO(0) => \update_cnt_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => update_cnt(8 downto 5)
    );
\update_cnt_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => pwm_period_pulse_i,
      D => update_cnt_0(9),
      Q => update_cnt(9),
      R => \duty_reg[4]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_pwm_soft_start_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    target_duty_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    pwm_period_pulse_i : in STD_LOGIC;
    duty_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    ready_o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_generator_pwm_soft_start_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_pwm_soft_start_0_0 : entity is "pwm_generator_pwm_soft_start_0_0,pwm_soft_start,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_pwm_soft_start_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_pwm_soft_start_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_generator_pwm_soft_start_0_0 : entity is "pwm_soft_start,Vivado 2024.2";
end pwm_generator_pwm_soft_start_0_0;

architecture STRUCTURE of pwm_generator_pwm_soft_start_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute x_interface_mode of rst : signal is "slave rst";
  attribute x_interface_parameter of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.pwm_generator_pwm_soft_start_0_0_pwm_soft_start
     port map (
      Q(4 downto 0) => duty_o(4 downto 0),
      clk => clk,
      pwm_period_pulse_i => pwm_period_pulse_i,
      ready_o => ready_o,
      rst => rst,
      target_duty_i(4 downto 0) => target_duty_i(4 downto 0)
    );
end STRUCTURE;
