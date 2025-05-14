library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity clk_divider is
    Port ( clk,rst : in STD_LOGIC;
           clk_div : out STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
signal divisor: unsigned(15 downto 0);
signal count_sig: unsigned(15 downto 0) := (others => '0');
signal clk_div_sig: std_logic :='1';
begin

-- divisor <= "0000000000011000";  -- 12₁₀ -> 10.42 MHz-----------------------------------------------------------
--divisor <= "0000000000000101";  -- 5 -> 25 MHz-----------------------------------------------------------
divisor <= "0001001110001000";  -- 50000 -> 25 kHz-----------------------------------------------------------
--divisor <= "0000001111101000";  -- 10000 -> 12.5 kHz-----------------------------------------------------------


    process(clk, rst)
-----------------------------------------------------------
        begin
        if(rst='1') then
        count_sig <= (others=>'0');
        elsif(rising_edge(clk))then
            if(count_sig=divisor(15 downto 1)-1) then
                clk_div_sig<=not(clk_div_sig);
                count_sig <=(others=>'0');
            else
                count_sig<=count_sig+1;
            end if;
        end if;
    end process;
clk_div<=clk_div_sig;
            
end Behavioral;
