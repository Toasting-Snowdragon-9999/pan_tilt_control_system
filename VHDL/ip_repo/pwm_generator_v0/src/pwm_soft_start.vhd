-- pwm_soft_start.vhd
-- Soft-start PWM ramp without separate enable signal
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_soft_start is
    generic (
        WIDTH      : positive := 5;   -- duty-cycle resolution bits
        STEP       : natural  := 1;   -- increment per update
        UPDATE_DIV : positive := 1    -- PWM periods between steps
    );
    port (
        clk                 : in  std_logic;
        rst                 : in  std_logic;                
        target_duty_i       : in  unsigned(WIDTH-1 downto 0); -- desired duty (0 = off)
        pwm_period_pulse_i  : in  std_logic;                -- pulse at PWM period start
        duty_o              : out unsigned(WIDTH-1 downto 0); -- ramped duty output
        ready_o             : out std_logic                 -- ‘1’ when duty reaches target
    );
end entity pwm_soft_start;

architecture rtl of pwm_soft_start is
    signal duty_reg   : unsigned(WIDTH-1 downto 0) := (others => '0');
    signal update_cnt : unsigned(15 downto 0)      := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                -- reset ramp and counter
                duty_reg   <= (others => '0');
                update_cnt <= (others => '0');

            elsif pwm_period_pulse_i = '1' then
                -- update only at PWM period boundary
                if target_duty_i = 0 then
                    -- target = 0 → motor off: force duty to zero
                    duty_reg   <= (others => '0');
                    update_cnt <= (others => '0');
                else
                    -- count intervals between ramp steps
                    if update_cnt = to_unsigned(UPDATE_DIV - 1, update_cnt'length) then
                        update_cnt <= (others => '0');
                        -- step toward target, clamped
                        if duty_reg < target_duty_i then
                            if (target_duty_i - duty_reg) < to_unsigned(STEP, WIDTH) then
                                duty_reg <= target_duty_i;
                            else
                                duty_reg <= duty_reg + to_unsigned(STEP, WIDTH);
                            end if;
                        elsif duty_reg > target_duty_i then
                            if (duty_reg - target_duty_i) < to_unsigned(STEP, WIDTH) then
                                duty_reg <= target_duty_i;
                            else
                                duty_reg <= duty_reg - to_unsigned(STEP, WIDTH);
                            end if;
                        end if;
                    else
                        update_cnt <= update_cnt + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    duty_o  <= duty_reg;
    ready_o <= '1' when duty_reg = target_duty_i else '0';

end architecture rtl;