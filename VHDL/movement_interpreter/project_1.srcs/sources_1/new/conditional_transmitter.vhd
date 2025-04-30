----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2025 02:55:50 PM
-- Design Name: 
-- Module Name: conditional_transmitter - Behavioral
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

entity conditional_transmitter is
    generic (n_bits_0 : positive := 1;
             n_bits_1 : positive := 1
             );
    Port ( in_0 :                   in STD_LOGIC_VECTOR (n_bits_0 - 1 downto 0);
           condition_constant :     in STD_LOGIC_VECTOR (n_bits_0 - 1 downto 0);
           transmission_constant :  in STD_LOGIC_VECTOR (n_bits_1 - 1 downto 0);
           out_0 :                  out STD_LOGIC_VECTOR (n_bits_1 - 1 downto 0)
           );
end conditional_transmitter;

architecture Behavioral of conditional_transmitter is

begin
    process(in_0, condition_constant, transmission_constant)        
        begin
            if in_0 = condition_constant then
                out_0 <= transmission_constant;
            else 
                out_0 <= (others => 'Z');
            end if;
    end process;
end Behavioral;