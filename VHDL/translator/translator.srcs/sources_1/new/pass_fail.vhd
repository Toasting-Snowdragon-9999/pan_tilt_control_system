----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2025 12:50:30 PM
-- Design Name: 
-- Module Name: pass_fail - Behavioral
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

entity pass_fail is
    Port ( inp : in STD_LOGIC;
           en  : in STD_LOGIC;
           data_in : STD_LOGIC_VECTOR (7 downto 0);
           pass : out STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           fail : out STD_LOGIC);
end pass_fail;

architecture Behavioral of pass_fail is

begin
    process(en,inp)
        begin
        if(en = '1') then
            if(inp = '1') then
                pass <= '1';
                fail <= '0';
                data_out <= data_in;
            elsif(inp = '0') then
                fail <= '1';
                pass <= '0';
                data_out <= (others => '0');
            end if;     
        end if;
    end process;
end Behavioral;
