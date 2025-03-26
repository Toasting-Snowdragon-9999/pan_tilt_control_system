----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2025 02:33:16 PM
-- Design Name: 
-- Module Name: mode_selector - Behavioral
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

entity mode_selector is
    Port ( in_0 : in STD_LOGIC_VECTOR (1 downto 0);
           h_bridge : out STD_LOGIC_VECTOR (1 downto 0);
           cruise : out STD_LOGIC_VECTOR (1 downto 0));
end mode_selector;

architecture Behavioral of mode_selector is

begin
    process (in_0)
    begin
        if in_0 = "11" then
            cruise <= in_0;
            h_bridge <= (others => 'Z');
        else 
            cruise <= (others => 'Z');
            h_bridge <= in_0;
        end if; 
    end process;
end Behavioral;
