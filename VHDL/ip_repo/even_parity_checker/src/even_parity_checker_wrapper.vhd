--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Wed Apr 23 14:56:59 2025
--Host        : jrm-HP-Spectre-x360-2-in-1-Laptop-14-eu0xxx running 64-bit Ubuntu 24.04.2 LTS
--Command     : generate_target even_parity_checker_wrapper.bd
--Design      : even_parity_checker_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity even_parity_checker_wrapper is
  port (
    data_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    en : in STD_LOGIC;
    fail : out STD_LOGIC;
    pass : out STD_LOGIC
  );
end even_parity_checker_wrapper;

architecture STRUCTURE of even_parity_checker_wrapper is
  component even_parity_checker is
  port (
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    fail : out STD_LOGIC;
    pass : out STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    en : in STD_LOGIC
  );
  end component even_parity_checker;
begin
even_parity_checker_i: component even_parity_checker
     port map (
      data_in(8 downto 0) => data_in(8 downto 0),
      data_out(7 downto 0) => data_out(7 downto 0),
      en => en,
      fail => fail,
      pass => pass
    );
end STRUCTURE;
