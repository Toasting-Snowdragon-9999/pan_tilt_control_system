library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity big_duty_cycle_lut is
    Port (
        spi_in : in STD_LOGIC_VECTOR(4 downto 0);  -- 5-bit input for 21 values
        en : in STD_LOGIC;
        duty_constant : out STD_LOGIC_VECTOR(4 downto 0)
    );
end big_duty_cycle_lut;

architecture Behavioral of big_duty_cycle_lut is
    signal duty_tmp : UNSIGNED(4 downto 0);  -- 5-bit unsigned temporary signal
begin
    process(en, spi_in)
    begin
        if (en = '0') then 
            duty_tmp <= TO_UNSIGNED(0, 5);
        elsif(en = '1') then
            case spi_in is
                when "00000" => duty_tmp <= TO_UNSIGNED(0, 5);    -- 00000 = 0%
                when "00001" => duty_tmp <= TO_UNSIGNED(1, 5);    -- 00001 = 5%
                when "00010" => duty_tmp <= TO_UNSIGNED(2, 5);    -- 00010 = 10%
                when "00011" => duty_tmp <= TO_UNSIGNED(3, 5);    -- 00011 = 15%
                when "00100" => duty_tmp <= TO_UNSIGNED(4, 5);    -- 00100 = 20%
                when "00101" => duty_tmp <= TO_UNSIGNED(5, 5);    -- 00101 = 25%
                when "00110" => duty_tmp <= TO_UNSIGNED(6, 5);    -- 00110 = 30%
                when "00111" => duty_tmp <= TO_UNSIGNED(7, 5);    -- 00111 = 35%
                when "01000" => duty_tmp <= TO_UNSIGNED(8, 5);    -- 01000 = 40%
                when "01001" => duty_tmp <= TO_UNSIGNED(9, 5);    -- 01001 = 45%
                when "01010" => duty_tmp <= TO_UNSIGNED(10, 5);   -- 01010 = 50%
                when "01011" => duty_tmp <= TO_UNSIGNED(11, 5);   -- 01011 = 55%
                when "01100" => duty_tmp <= TO_UNSIGNED(12, 5);   -- 01100 = 60%
                when "01101" => duty_tmp <= TO_UNSIGNED(13, 5);   -- 01101 = 65%
                when "01110" => duty_tmp <= TO_UNSIGNED(14, 5);   -- 01110 = 70%
                when "01111" => duty_tmp <= TO_UNSIGNED(15, 5);   -- 01111 = 75%
                when "10000" => duty_tmp <= TO_UNSIGNED(16, 5);   -- 10000 = 80%
                when "10001" => duty_tmp <= TO_UNSIGNED(17, 5);   -- 10001 = 85%
                when "10010" => duty_tmp <= TO_UNSIGNED(18, 5);   -- 10010 = 90%
                when "10011" => duty_tmp <= TO_UNSIGNED(19, 5);   -- 10011 = 95%
                when "10100" => duty_tmp <= TO_UNSIGNED(21, 5);   -- 10101 = 100% (skips 20)
                when others  => duty_tmp <= TO_UNSIGNED(0, 5);    -- default = 00000 = 0%
            end case;
        end if;
    end process;

    duty_constant <= STD_LOGIC_VECTOR(duty_tmp);
end Behavioral;

