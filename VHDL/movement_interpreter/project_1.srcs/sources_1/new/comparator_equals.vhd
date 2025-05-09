library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator_equals is
    generic(n_bits : positive:= 1);
    Port ( a : in STD_LOGIC_VECTOR(n_bits-1 downto 0);
           b : in STD_LOGIC_VECTOR(n_bits-1 downto 0);
           c : out STD_LOGIC);
end comparator_equals;

architecture Behavioral of comparator_equals is

begin
    process (a,b)
        begin if a = b then
                c <= '1';
            else c <= '0';
        end if;
    end process;
end Behavioral;