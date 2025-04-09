-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed Apr  2 15:14:26 2025
-- Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/jrm/git/pan_tilt_control_system/VHDL/pwm_generator/pwm_generator.gen/sources_1/bd/pwm_generator/ip/pwm_generator_counter_2_1/pwm_generator_counter_2_1_sim_netlist.vhdl
-- Design      : pwm_generator_counter_2_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_counter_2_1_counter is
  port (
    cnt : out STD_LOGIC_VECTOR ( 4 downto 0 );
    en : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_generator_counter_2_1_counter : entity is "counter";
end pwm_generator_counter_2_1_counter;

architecture STRUCTURE of pwm_generator_counter_2_1_counter is
  signal \^cnt\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \cnt_temp[4]_i_1_n_0\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_temp[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt_temp[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt_temp[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt_temp[4]_i_2\ : label is "soft_lutpair0";
begin
  cnt(4 downto 0) <= \^cnt\(4 downto 0);
\cnt_temp[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^cnt\(0),
      O => plusOp(0)
    );
\cnt_temp[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^cnt\(0),
      I1 => \^cnt\(1),
      O => plusOp(1)
    );
\cnt_temp[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^cnt\(0),
      I1 => \^cnt\(1),
      I2 => \^cnt\(2),
      O => plusOp(2)
    );
\cnt_temp[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^cnt\(1),
      I1 => \^cnt\(0),
      I2 => \^cnt\(2),
      I3 => \^cnt\(3),
      O => plusOp(3)
    );
\cnt_temp[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rst,
      I1 => clr,
      O => \cnt_temp[4]_i_1_n_0\
    );
\cnt_temp[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^cnt\(2),
      I1 => \^cnt\(0),
      I2 => \^cnt\(1),
      I3 => \^cnt\(3),
      I4 => \^cnt\(4),
      O => plusOp(4)
    );
\cnt_temp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => plusOp(0),
      Q => \^cnt\(0),
      R => \cnt_temp[4]_i_1_n_0\
    );
\cnt_temp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => plusOp(1),
      Q => \^cnt\(1),
      R => \cnt_temp[4]_i_1_n_0\
    );
\cnt_temp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => plusOp(2),
      Q => \^cnt\(2),
      R => \cnt_temp[4]_i_1_n_0\
    );
\cnt_temp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => plusOp(3),
      Q => \^cnt\(3),
      R => \cnt_temp[4]_i_1_n_0\
    );
\cnt_temp_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      D => plusOp(4),
      Q => \^cnt\(4),
      R => \cnt_temp[4]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_generator_counter_2_1 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clr : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_generator_counter_2_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_generator_counter_2_1 : entity is "pwm_generator_counter_2_1,counter,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_generator_counter_2_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_generator_counter_2_1 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_generator_counter_2_1 : entity is "counter,Vivado 2024.2";
end pwm_generator_counter_2_1;

architecture STRUCTURE of pwm_generator_counter_2_1 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN pwm_generator_clk_0, INSERT_VIP 0";
  attribute x_interface_info of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute x_interface_mode of rst : signal is "slave rst";
  attribute x_interface_parameter of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.pwm_generator_counter_2_1_counter
     port map (
      clk => clk,
      clr => clr,
      cnt(4 downto 0) => cnt(4 downto 0),
      en => en,
      rst => rst
    );
end STRUCTURE;
