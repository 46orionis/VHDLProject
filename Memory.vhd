library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity Memory is
    Port (
	 
     	clk :in std_logic;  
	adrPc:in std_logic_vector(5 downto 0);
	adrData:in std_logic_vector(5 downto 0);
     	enable: in std_logic;  
      	Memw :in  std_logic;
      	data_in: in std_logic_vector(15 downto 0);
	instruction_out: out std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0)
    );
end Memory; 
   
architecture behaviour_Memory of Memory is

type darray is array(0 to 127)of std_logic_vector(15 downto 0);
signal mem: darray;

Begin

 process
    begin -- 
       
            -- Assign specific values to memory locations
            -- You can modify these values as per your requirement
	    mem(64) <= "1010000001000001"; 
	    mem(65) <= "1010000010000010"; 
            mem(66) <= "0000000000001010";  -- Add(r1,r2,r3)
	    mem(67) <= "1010001001000011"; 
            
       
        wait;
    end process;


	process(clk,adrPC,adrDATA)  
begin

if rising_edge(clk) then
	if  enable = '1' then 
	if adrDATA' event then
            if MEMw = '1' then
                mem(to_integer('0' & unsigned(adrData))) <= data_in;
            
            data_out <= mem(to_integer('0' & unsigned(adrData)));
        end if;
	end if;
	if adrPC' event  then
            
            instruction_out <= mem(to_integer('1' & unsigned(adrPC)));
        
    end if;
    end if;
    end if;
    end process;



end behaviour_Memory;
