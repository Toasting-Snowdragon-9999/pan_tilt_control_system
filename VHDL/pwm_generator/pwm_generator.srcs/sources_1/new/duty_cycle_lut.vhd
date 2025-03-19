library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity duty_cycle_lut is
    Port ( spi_in : in STD_LOGIC_VECTOR(1 downto 0);
           duty_constant : out STD_LOGIC_VECTOR(26 downto 0));
end duty_cycle_lut;

architecture Behavioral of duty_cycle_lut is

    signal duty_tmp : UNSIGNED(26 downto 0);  -- Declaring an unsigned temporary signal
begin
        with spi_in select
            duty_tmp <= 
                    TO_UNSIGNED(31250000,27) when "00",  -- 25% duty cycle
                    TO_UNSIGNED(62500000,27) when "01",  -- 50% duty cycle
                    TO_UNSIGNED(93750000,27) when "10",  -- 75% duty cycle
                    TO_UNSIGNED(125000000,27) when "11",  -- 100% duty cycle
                    TO_UNSIGNED(0,27) when others;  -- turn off all LEDs
        duty_constant <= STD_LOGIC_VECTOR(duty_tmp);        
end Behavioral;