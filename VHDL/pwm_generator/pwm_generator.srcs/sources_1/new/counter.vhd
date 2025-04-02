library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    generic(n_bits : positive := 1);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clr : in STD_LOGIC;
           en : in STD_LOGIC;
           cnt : out STD_LOGIC_VECTOR(n_bits-1 downto 0));
end counter;

architecture Behavioral of counter is
    signal cnt_temp: unsigned(n_bits-1 downto 0):= (others => '0');
begin
    process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    cnt_temp <= (others => '0');
                elsif clr = '1' then
                    cnt_temp <= (others => '0');
                elsif en = '1' then
                    cnt_temp <= cnt_temp + 1;
                end if;
            end if;
        end process;

    cnt <= STD_LOGIC_VECTOR(cnt_temp);

end Behavioral;