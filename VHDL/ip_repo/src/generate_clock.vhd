

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generate_clock is
    Port ( pwm_a : in STD_LOGIC;
           pwm_b : in STD_LOGIC;
           internal_clock : in STD_LOGIC;
           gen_clk : out STD_LOGIC);
end generate_clock;

architecture Behavioral of generate_clock is

begin
    process(internal_clock, pwm_a, pwm_b) is
    begin
        -- store old states
        
        if(rising_edge(pwm_a) or rising_edge(pwm_b)) then
            gen_clk <= '1';
        else gen_clk <= '0'; 
        
    end if;
end process;

end Behavioral;
