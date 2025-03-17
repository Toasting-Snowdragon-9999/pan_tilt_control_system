
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
    generic (
           n_bits: positive:= 1
    );
    Port ( 
           a_in : in STD_LOGIC_VECTOR (n_bits-1 downto 0);
           b_in : in STD_LOGIC_VECTOR (n_bits-1 downto 0);
           led : out STD_LOGIC
          );
end comparator;

architecture Behavioral of comparator is

begin
    process(a_in, b_in)
    begin
        -- Checks wether a is less than b
        if(a_in < b_in) 
            then led <= '1';
        else 
            led <= '0'; 
        end if;
    end process;
    

end Behavioral;
