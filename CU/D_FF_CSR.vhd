
library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;  

entity D_FF is
  port (
    clk: in std_logic;
    d: in std_logic;
    q: out std_logic
  );
end entity D_FF;

architecture Behavioral of D_FF is
begin
  process (clk)
  begin
    if (rising_edge(clk))then
      		q <= d;    -- Store input value on rising edge of clock
    end if;
  end process;
end architecture Behavioral;     
