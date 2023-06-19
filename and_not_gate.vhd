library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AndNotGate is
    port (
        signal1 : in std_logic;
        signal2 : in std_logic;
        output : out std_logic
    );
end AndNotGate;

architecture Behavioral of AndNotGate is
begin
    output <= signal1 and not signal2;
end Behavioral;

