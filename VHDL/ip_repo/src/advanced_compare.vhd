

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

begin
    process(a_in)
    begin
    if(rising_edge(a_in)) then
        if (b_in = '0') then
            -- Compare with previous state
             direction <= '1';  -- "10" detected (clockwise)
        elsif (b_in = '1') then
             direction <= '0';  -- "01" detected (counterclockwise)
        end if;
        end if;
    end process;
end Behavioral;
