----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2025 10:39:56 AM
-- Design Name: 
-- Module Name: subtract - Behavioral
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
           result : out STD_LOGIC_VECTOR (n_bits-1 downto 0);
           sign : std_logic);
           
end subtract;

architecture Behavioral of subtract is
    signal a_value, b_value : UNSIGNED(n_bits-1 downto 0);
    signal temp_result : UNSIGNED(n_bits-1 downto 0);

begin
    process(a_in, b_in)
    begin
        -- Convert input vectors to UNSIGNED
        a_value <= UNSIGNED(a_in);
        b_value <= UNSIGNED(b_in);
        
        -- Perform subtraction either a-b or b-a 
        -- and then set the sign accordingly 
        if a_value < b_value then
            temp_result <= b_value - a_value;
            sign <= '1';  -- Negative result
        else
            temp_result <= a_value - b_value;
            sign <= '0';  -- Positive result
        end if;
        
        result <= STD_LOGIC_VECTOR(temp_result);

    end process;

end Behavioral;
