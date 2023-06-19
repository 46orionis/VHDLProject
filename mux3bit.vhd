
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity mux_3bit is
    Port (
        In0, In1 : in std_logic_vector(2 downto 0);
        s : in std_logic;
        Z : out std_logic_vector(2 downto 0) 
     );
end mux_3bit;

architecture Behavioral of mux_3bit  is

begin

Z <= In0 when s='0' else
        In1 when s='1';
   end Behavioral;