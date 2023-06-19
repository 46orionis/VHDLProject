library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
    
entity address_register is
    Port (
        In0 : in std_logic_vector(5 downto 0);
        Clk: in std_logic;
	ARw: in std_logic;
        Z : out std_logic_vector(5 downto 0)
     );
end address_register;

architecture Behavioral of address_register is
begin
process(Clk,In0,ARw)
begin
	if (rising_edge(Clk)) and ( ARw = '1' ) then
			Z<=In0 after 5 ns;
		
	end if;
end process;
end Behavioral;
