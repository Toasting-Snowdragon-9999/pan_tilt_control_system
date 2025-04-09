----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2025 09:26:29 AM
-- Design Name: 
-- Module Name: fpga_2input_copier - Behavioral
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

entity fpga_2input_copier is
    Port ( in_0 : in STD_LOGIC_VECTOR(4 downto 0);
           out_0 : out STD_LOGIC_VECTOR (4 downto 0);
           out_1 : out STD_LOGIC_VECTOR (1 downto 0));
end fpga_2input_copier;

architecture Behavioral of fpga_2input_copier is

begin

out_0 <= in_0;
out_1 <= in_0;


end Behavioral;
