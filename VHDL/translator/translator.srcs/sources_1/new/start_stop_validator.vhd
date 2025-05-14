----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2025 02:49:12 PM
-- Design Name: 
-- Module Name: start_stop_validator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity start_stop_validator is
    Port ( data : in STD_LOGIC_VECTOR (10 downto 0);
           en   : in STD_LOGIC;
           commands : out STD_LOGIC_VECTOR (9 downto 1);
           fail : out STD_LOGIC_VECTOR (1 downto 0));
end start_stop_validator;

architecture Behavioral of start_stop_validator is

begin
    process(en)
        begin
        if(en = '1') then
            if(data(0) = '1' and data(10) = '1') then
                fail <= "00";
                commands <= data(9 downto 1);
            end if;
        end if;
    end process;
end Behavioral;
