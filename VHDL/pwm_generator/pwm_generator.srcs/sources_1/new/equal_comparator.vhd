library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity equal_comparator is
    generic(n_bits : positive:= 1);
    Port ( a : in STD_LOGIC_VECTOR(n_bits-1 downto 0);
           b : in STD_LOGIC_VECTOR(n_bits-1 downto 0);
           c : out STD_LOGIC);
end equal_comparator;

architecture Behavioral of equal_comparator is

begin
    process (a,b)
        begin if a = b then
                c <= '1';
            else c <= '0';
        end if;
    end process;
end Behavioral;
