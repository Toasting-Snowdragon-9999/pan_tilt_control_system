library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pwm_test_switcher is
    Port (
        sw    : in  STD_LOGIC_VECTOR(1 downto 0);
        out_1 : out STD_LOGIC_VECTOR(4 downto 0)
    );
end pwm_test_switcher;

architecture Behavioral of pwm_test_switcher is
begin
    process(sw)
    begin
        case sw is
            when "00" =>
                --out_1 <= "00000";  -- 0 -> 0% duty cycle
                --out_1 <= "00010";  -- 2 -> 10% duty cycle -- Didn't work at 25kHz or 12.5kHz
                out_1 <= "01010";  -- 3 -> 50% duty cycle -- 
            when "01" =>
                --out_1 <= "00001";  -- 1 -> 5% duty cycle
                --out_1 <= "00011";  -- 3 -> 15% duty cycle -- Didn't work at 25kHz
                out_1 <= "01100";  -- 3 -> 60% duty cycle -- 
            when "10" =>
                --out_1 <= "01010";  -- 10 -> 50% duty cycle
                --out_1 <= "00101";  -- 5 -> 25% duty cycle - virkede lidt men ik helt ved 25kHz
                out_1 <= "01110";  -- 5 -> 70% duty cycle
            when "11" =>
                out_1 <= "10100";  -- 20 -> 100% duty cycle
                --out_1 <= "01001";  -- 20 -> 45% duty cycle
            when others =>
                out_1 <= "00000";  
        end case;
    end process;
end Behavioral;
