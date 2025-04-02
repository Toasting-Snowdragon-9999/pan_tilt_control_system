-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pwm_generator_wrapper is
  Port ( 
    clk_0 : in STD_LOGIC;
    led_0 : out STD_LOGIC;
    led_1 : out STD_LOGIC;
    rpio_08_r : out STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end pwm_generator_wrapper;

architecture stub of pwm_generator_wrapper is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
begin
end;
