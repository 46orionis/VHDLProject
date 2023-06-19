library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_File is
  port (
    clk: in std_logic;
    Wr: in std_logic;
    Rd: in std_logic_vector(2 downto 0);
    X: in std_logic_vector(2 downto 0);
    Y: in std_logic_vector(2 downto 0);
    D: in std_logic_vector(15 downto 0);
    Q11: out std_logic_vector(15 downto 0);
    Q22: out std_logic_vector(15 downto 0)
  );
end entity Register_File;
     


architecture Behavioral of Register_File is
  component Register_16bit is
    port (
      clk: in std_logic;
      Wr: in std_logic;
      D: in std_logic_vector(15 downto 0);	
      Q: out std_logic_vector(15 downto 0)
    );
  end component;

  
  signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7: std_logic_vector(15 downto 0);
  signal Wr0, Wr1, Wr2, Wr3, Wr4, Wr5, Wr6, Wr7: std_logic;
  signal Rdin : std_logic_vector(7 downto 0);

begin
  Register0: Register_16bit
    port map (
      clk => clk,
      Wr => Wr0,
      D => D,
      Q => Q0
    );
    
  Register1: Register_16bit
    port map (
      clk => clk,
      Wr => Wr1,
      D => D,
      Q => Q1
    );
    
  Register2: Register_16bit
    port map (
      clk => clk,
      Wr => Wr2,
      D => D,
      Q => Q2
    );
    
  Register3: Register_16bit
    port map (
      clk => clk,
      Wr => Wr3,
      D => D,
      Q => Q3
    );

 Register4: Register_16bit
    port map (
      clk => clk,
      Wr => Wr4,
      D => D,
      Q => Q4
    );
    
  Register5: Register_16bit
    port map (
      clk => clk,
      Wr => Wr5,
      D => D,
      Q => Q5
    );
    
  Register6: Register_16bit
    port map (
      clk => clk,
      Wr => Wr6,
      D => D,
      Q => Q6
    );
    
  Register7: Register_16bit
    port map (
      clk => clk,
      Wr => Wr7,
      D => D,
      Q => Q7
    );
mux1_process: process(X, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7)
begin 
  case X is
    when "000" =>
      Q11 <= Q0;
    when "001" =>
      Q11 <= Q1;
    when "010" =>
      Q11 <= Q2;
    when "011" =>
      Q11 <= Q3;
    when "100" =>
      Q11 <= Q4;
    when "101" =>
      Q11 <= Q5;
    when "110" =>
      Q11 <= Q6;
    when "111" =>
      Q11 <= Q7;
    when others =>
      Q11 <= (others => '0');
  end case;
end process mux1_process;

mux2_process: process(Y, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7)
begin 
  case Y is
    when "000" =>
      Q22 <= Q0;
    when "001" =>
      Q22 <= Q1;
    when "010" =>
      Q22 <= Q2;
    when "011" =>
      Q22 <= Q3;
    when "100" =>
      Q22 <= Q4;
    when "101" =>
      Q22 <= Q5;
    when "110" =>
      Q22 <= Q6;
    when "111" =>
      Q22 <= Q7;
    when others =>
      Q22 <= (others => '0');
  end case;
end process mux2_process;



 decoder_process : process(Rd)
	begin 

	case Rd is

    when "000" =>
      Rdin <= "00000001";
    when "001" =>
      Rdin <= "00000010";
    when "010" =>
      Rdin <= "00000100";
    when "011" =>
      Rdin <= "00001000";
    when "100" =>
      Rdin <= "00010000";
    when "101" =>
      Rdin <= "00100000";
    when "110" =>
      Rdin <= "01000000";
    when "111" =>
      Rdin <= "10000000";
    when others =>
      Rdin <= (others => '0');

  end case;

end process decoder_process;

   writedst1_process : process(Wr,Rdin)
	begin
			Wr0 <= Rdin(0) and Wr;
			Wr1 <= Rdin(1) and Wr;
			Wr2 <= Rdin(2) and Wr;
			Wr3 <= Rdin(3) and Wr;
			Wr4 <= Rdin(4) and Wr;
  			Wr5 <= Rdin(5) and Wr;
  			Wr6 <= Rdin(6) and Wr;
  			Wr7 <= Rdin(7) and Wr;
end process writedst1_process;

			

end architecture Behavioral;