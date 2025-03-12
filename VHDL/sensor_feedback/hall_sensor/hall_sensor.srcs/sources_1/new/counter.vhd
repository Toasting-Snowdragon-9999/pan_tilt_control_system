----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 03:01:30 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    generic (
           n_bits: positive:= 1
    );
    Port (
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR(n_bits-1 downto 0)
          );
end counter;

architecture Behavioral of counter is
    
    signal  cnt_int :   UNSIGNED(n_bits-1 downto 0) :=  (others => '0');
    
begin
    
    process(clk, rst, en)
    begin 
        -- Check if the reset is set high
        if (rst = '1') 
            then cnt_int <= (others => '0');
        -- Check if we are on a risign edge of the clock
        -- Only count on rising edge
        elsif(rising_edge(clk))
            -- only count if enabled   
            then if(en = '1') 
                then cnt_int <= cnt_int + "1";
            end if;
        end if;
    end process;
    count <= STD_LOGIC_VECTOR(cnt_int);

end Behavioral;


