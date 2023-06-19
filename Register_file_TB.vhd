library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Register_file_TB is
end entity Register_file_TB;

architecture Behavioral_TB of Register_file_TB is
  -- Constants
  constant CLK_PERIOD: time := 10 ns;
  
  -- Signals
 	signal clk:  std_logic;
   	signal Wr: std_logic;
    	signal Rd:  std_logic_vector(1 downto 0);
    	signal X:  std_logic_vector(1 downto 0);
    	signal Y:  std_logic_vector(1 downto 0);
    	signal D:  std_logic_vector(15 downto 0);
    	signal Q11:  std_logic_vector(15 downto 0);   
    	signal Q22:  std_logic_vector(15 downto 0);

 component Register_File 
 
	port(
    	clk: in std_logic;
   	Wr: in std_logic;
    	Rd: in std_logic_vector(1 downto 0);
    	X: in std_logic_vector(1 downto 0);
    	Y: in std_logic_vector(1 downto 0);
    	D: in std_logic_vector(15 downto 0);
    	Q11: out std_logic_vector(15 downto 0);
    	Q22: out std_logic_vector(15 downto 0)
  );
end component;
  begin
 -- Instantiate the Unit Under Test (UUT)
   uut: Register_File  PORT MAP (clk,Wr,Rd,X,Y,D,Q11,Q22);

  -- Instantiate the Register_16bit component
     
  -- Clock process
  clk_process: process
  begin
    while now < 1000 ns loop  -- Run for 1000 ns
      clk <= '0';
      wait for CLK_PERIOD/2;
      clk <= '1';
      wait for CLK_PERIOD/2;
    end loop;
    wait;
  end process;
  
  -- Stimulus process
  stimulus_process: process
  begin
	Wr <= '1';
	Rd <= "00";
X <= "00";
Y <= "00";
	D <= "0000000000000001"; 
   wait for 20 ns;
 for i in 0 to 15 loop 

    -- Apply inputs
   
    D <= D + "0000000000000010";  
    
    
    
    -- Start writing to the register
    Rd <= Rd + "1";
X <= X + "1";

	

	if rd = "11" then
   	 rd <= "00";
	end if;
if X = "11" then
   	 X <= "00";
	end if;
if Y = "00" then
   	 Y <= "11";
	end if;
wait for 20 ns;
  end loop;
    
  end process;
  

  
end architecture Behavioral_TB;

