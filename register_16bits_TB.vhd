
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_16bit_TB is
end entity Register_16bit_TB;

architecture Behavioral of Register_16bit_TB is
  -- Constants
  constant CLK_PERIOD: time := 10 ns;
           
  -- Signals
  signal clk: std_logic := '0';
  signal Wr: std_logic := '0';
  signal d: std_logic_vector(15 downto 0) := (others => '0');
  signal q: std_logic_vector(15 downto 0);
  
begin
  -- Instantiate the Register_16bit component
  uut: entity work.Register_16bit
    port map (
      clk => clk,
      Wr => Wr,
      d => d,
      q => q
    );
    
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
    -- Apply inputs
    Wr <= '0';
    d <= "0101010101010101";  -- Example input data
    
    wait for 20 ns;
    
    -- Start writing to the register
    Wr <= '1';
    
    wait for 10 ns;
    
    -- Stop writing
    Wr <= '0';
    
    wait for 100 ns;
    
    -- Change input data
    d <= "0011001100110011";  -- Example input data
    
    wait for 20 ns;
    
    -- Start writing to the register
    Wr <= '1';
    
    wait for 10 ns;
    
    -- Stop writing
    Wr <= '0';
    
    wait;
  end process;
  

  
end architecture Behavioral;