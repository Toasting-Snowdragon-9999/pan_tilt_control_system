library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity small_duty_cycle_lut is
    Port ( spi_in : in STD_LOGIC_VECTOR(1 downto 0);
           duty_constant : out STD_LOGIC_VECTOR(26 downto 0));
end small_duty_cycle_lut;

architecture Behavioral of small_duty_cycle_lut is

    signal duty_tmp : UNSIGNED(26 downto 0);  -- Declaring an unsigned temporary signal
begin
        with spi_in select
            duty_tmp <= 
                    TO_UNSIGNED(0,27) when "00",  -- 0% duty cycle
                    TO_UNSIGNED(1,27) when "01",  -- 25% duty cycle
                    TO_UNSIGNED(2,27) when "10",  -- 50% duty cycle
--                    TO_UNSIGNED(3,27) when "10",  -- 75% duty cycle
                    TO_UNSIGNED(5,27) when "11",  -- 100% duty cycle (+1 since comparator is >=)
                    TO_UNSIGNED(0,27) when others;  -- turn off all LEDs
        duty_constant <= STD_LOGIC_VECTOR(duty_tmp);        
end Behavioral;