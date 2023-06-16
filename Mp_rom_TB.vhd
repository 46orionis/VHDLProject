library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testMemo is 
end testMemo;

architecture behave of testMemo is
Signal clk : std_logic := '0';  
Signal	adr: std_logic_vector(5 downto 0) := (others => '0');
Signal  enable: std_logic:= '1';  
Signal  RW : std_logic:= '0';
Signal  data_out :  std_logic_vector(15 downto 0);
                
component ROM is
    Port (
	 
     	clk :in std_logic;  
	adr:in std_logic_vector(5 downto 0);
     	enable: in std_logic;  
      	RW :in  std_logic;
        data_out : out std_logic_vector(15 downto 0)
    );
end component; 
 
Begin
rom1 : ROM
port map(clk=>clk,adr=>adr,enable=>enable,RW=>RW,data_out=>data_out);

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
        RW <= '1';
        adr <= "000100";
        wait for 20 ns;

        -- Test 2: Read data from address 0010
        RW <= '0';
	--data_out<=memo1(adr);

        wait for 10 ns;

        -- Test 3: Write data to address 1111
        RW <= '1';
	adr<= "011001";
        wait for 20 ns;

        -- Test 4: Read data from address 1111
        RW <= '0';
	--data_out<=memo1(adr);
        wait for 10 ns;

        -- Add more test cases as needed

    end process stimulus_process;

end architecture Behave;
