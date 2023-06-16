library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity Memory is
    Port (
	 
     	clk :in std_logic;  
	adrPc:in std_logic_vector(5 downto 0);
	adrData:in std_logic_vector(5 downto 0);
     	enable: in std_logic;  
      	RW :in  std_logic;
      	data_in: in std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0)
    );
end Memory; 
   
architecture behaviour_Memory of Memory is

type darray is array(0 to 127)of std_logic_vector(15 downto 0);
signal mem: darray;

Begin

 process
    begin -- 
        for i in 64 to 127 loop
            -- Assign specific values to memory locations
            -- You can modify these values as per your requirement
            mem(i) <= "0000000000001010";  -- Add(r1,r2,r3)
	    mem(i) <= "0000000000001010"; 
            
        end loop;
        wait;
    end process;


	process(clk,adrPC,adrDATA)  
begin

if rising_edge(clk) then
	if  enable = '1' then 
	if adrDATA' event then
            if RW = '1' then
                mem(to_integer('0' & unsigned(adrData))) <= data_in;
            else
            data_out <= mem(to_integer('0' & unsigned(adrData)));
        end if;
	end if;
	if adrPC' event  then
            if RW = '0' then
            data_out <= mem(to_integer('1' & unsigned(adrPC)));
        end if;
    end if;
end if;
    end if;
    end process;




end behaviour_Memory;
