Library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counterR is
generic (
	constant N : natural :=5
);
port(
	clk:in std_logic;
	reset:in std_logic;
	PcW: in std_logic;
	S: out std_logic_vector(N-1 downto 0)
);           

end counterR;

architecture benschR of counterR is
signal temp:unsigned (N-1 downto 0) := (others =>'0');
	Begin
	process (clk,reset,PcW)
	Begin
		
		if rising_edge(clk) and PcW = '1' then
			
			temp<=temp+1;
			
			
		end if;
		if temp="11111" OR reset='1'  then
			temp<="00000"; 	
					
		end if;
	end process;
S<=std_logic_vector(temp);	
end benschR;
