library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity mux2_1_5 is
    Port (
        In0, In1 : in std_logic_vector(4 downto 0);
        s : in std_logic;
        Z : out std_logic_vector(4 downto 0) 
     );
end mux2_1_5;

architecture Behavioral_mux_2_1_5 of mux2_1_5 is

begin

Z <= In0 when s='0' else
        In1 when s='1';
   end Behavioral_mux_2_1_5;
