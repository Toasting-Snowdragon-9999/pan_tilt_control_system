
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator_equal is
    generic (
           n_bits: positive:= 1
    );
    Port ( 
           a_in : in STD_LOGIC_VECTOR (n_bits-1 downto 0);
           b_in : in STD_LOGIC_VECTOR (n_bits-1 downto 0);
           c_out : out STD_LOGIC
          );
end comparator_equal;

architecture Behavioral of comparator_equal is

begin
    process(a_in, b_in)
    begin
        -- Check wether a is equal to b
        if(a_in = b_in) 
            then c_out <= '1';
        else 
            c_out <= '0'; 
        end if;
    end process;
    

end Behavioral;
