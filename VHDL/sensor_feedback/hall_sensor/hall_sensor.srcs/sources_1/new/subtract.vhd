

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity subtract is           
    generic (
           n_bits: positive:= 1
    );    
    
    Port ( a_in : in STD_LOGIC_VECTOR (n_bits-1 downto 0);
           b_in : in STD_LOGIC_VECTOR (n_bits-1 downto 0);
           clk  : in STD_LOGIC;
           result : out STD_LOGIC_VECTOR (n_bits-1 downto 0));
           
end subtract;

architecture Behavioral of subtract is
    signal a_value, b_value : SIGNED(n_bits-1 downto 0);
    signal temp_result : SIGNED(n_bits-1 downto 0);

begin
    process(clk, a_in, b_in)
    begin
        -- Convert input vectors to UNSIGNED
        a_value <= SIGNED(a_in);
        b_value <= SIGNED(b_in);
        
        -- Perform subtraction either a-b or b-a 
        -- and then set the sign accordingly 
        if(rising_edge(clk)) then
            temp_result <= a_value - b_value;
        end if;
        
        result <= STD_LOGIC_VECTOR(temp_result);
        
    end process;

end Behavioral;
