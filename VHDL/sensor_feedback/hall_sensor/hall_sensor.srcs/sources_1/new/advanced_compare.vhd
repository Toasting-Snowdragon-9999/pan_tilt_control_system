----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2025 11:31:59 AM
-- Design Name: 
-- Module Name: advanced_compare - Behavioral
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

entity advanced_compare is
    Port ( a_in : in STD_LOGIC;
           b_in : in STD_LOGIC;
           direction : out STD_LOGIC);
end advanced_compare;

architecture Behavioral of advanced_compare is
    signal prev_a, prev_b : STD_LOGIC := '0';  -- Previous state storage
begin
    process(a_in, b_in)
    begin
        -- Only act when both a_in and b_in are high
        if (a_in = '1' and b_in = '1') then
            -- Compare with previous state
            if (prev_a = '1' and prev_b = '0') then
                direction <= '1';  -- "10" detected (clockwise)
            elsif (prev_a = '0' and prev_b = '1') then
                direction <= '0';  -- "01" detected (counterclockwise)
            end if;
        end if;
        
        -- Store the current state as previous for the next comparison
        prev_a <= a_in;
        prev_b <= b_in;
    end process;
end Behavioral;
