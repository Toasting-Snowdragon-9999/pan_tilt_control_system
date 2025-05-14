----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2025 02:52:25 PM
-- Design Name: 
-- Module Name: advanced_counter - Behavioral
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

entity advanced_counter is
    generic (
           n_bits: positive:= 1
    );
    Port ( clk : in STD_LOGIC;
           up : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           clr : in STD_LOGIC;
           count : out std_logic_vector(n_bits-1 downto 0)
           );
end advanced_counter;

architecture Behavioral of advanced_counter is
    
    signal  cnt_int :   SIGNED(n_bits-1 downto 0) :=  (others => '0');
    
begin
    
    process(clk, rst, en, clr)
    begin 
        -- Check if the reset is set high
        if (rst = '1' or clr = '1') 
            then cnt_int <= (others => '0');
        -- Check if we are on a risign edge of the clock
        -- Only count on rising edge
        elsif(rising_edge(en))
            -- only count if enabled   
            then if(up = '1') 
                -- count upwards
                    then cnt_int <= cnt_int + "0001";     
             elsif(up = '0') 
                -- count downwards 
                    then cnt_int <= cnt_int - "0001";
            end if;
        end if;
    end process;
    count <= STD_LOGIC_VECTOR(cnt_int);
end Behavioral;
