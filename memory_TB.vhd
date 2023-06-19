library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testMemo is 
end testMemo;

architecture behave of testMemo is
Signal clk : std_logic := '0';  
Signal	adrData: std_logic_vector(5 downto 0) := (others => '0');
Signal adrPc: std_logic_vector(5 downto 0);
Signal  enable: std_logic:= '1';  
Signal  MEMw : std_logic:= '0';
Signal  data_in:  std_logic_vector(15 downto 0) := (others => '0');
Signal  data_out :  std_logic_vector(15 downto 0);
Signal instruction_out: std_logic_vector(15 downto 0);
  
component Memory is
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
end component; 
 
Begin
memo1 : Memory
port map(clk,adrPC,adrData,enable,MEMw,data_in,instruction_out,data_out);

    clk_process : process
    begin	

            clk<= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns; 
   
    end process clk_process;

    stimulus_process : process
    begin

        wait for 10 ns;  -- Initial wait

        -- Test 1: Write data to address 0010
        MEMw <= '1';
        data_in <= "1010101011101101";
        adrPc <= "000001";
        wait for 20 ns;

        -- Test 2: Read data from address 0010
        MEMw <= '0';
	--data_out<=memo1(adr);

        wait for 20 ns;

        -- Test 3: Write data to address 1111
        MEMw <= '1';
	adrdata<= "000000";
        data_in <= "1011101010111010";
        wait for 20 ns;

        -- Test 4: Read data from address 1111
        MEMw <= '0';
	--data_out<=memo1(adr);
        wait for 20 ns;

        -- Add more test cases as needed

    end process stimulus_process;

end architecture Behave;
