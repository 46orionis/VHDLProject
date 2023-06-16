library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
              
entity CU is

  port (

    clk : in std_logic;
    M : in std_logic;
    opCode: in std_logic_vector(4 downto 0);
    controle: out std_logic_vector(15 downto 0)  		
  );

end CU;
   
architecture behaviourCU of CU is

component MP_ROM is
    Port (
	adr:in std_logic_vector(4 downto 0);
	 data_out : out std_logic_vector(15 downto 0)

    );

end component; 	
signal controle :  std_logic_vector(15 downto 0);

begin

uut:MP_ROM port map(

adr  => opCode,
data_out  => controle
  
);

diviseur: process(controle)
begin

    RFxy <= controle(15);

    RFw  <= controle(14);

    RFsrc  <= controle(13);

    DRsrc  <= controle(12);

    DRw  <= controle(11);

    IRw  <= controle(10);

    PCw  <= controle(9);

    StrM  <= controle(8);

    ARw  <= controle(7);

    CD  <= controle(6);

    BR  <= controle(5);

    AD <= controle(4)&controle(3)&controle(2)&controle(1)&controle(0);

    end process;

   


end behaviourCU;