
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_TB is
end entity D_FF_TB;
             
architecture Behavioral of D_FF_TB is
  -- Constants
  constant CLK_PERIOD: time := 10 ns; -- Clock period
   
  -- Component declaration
  component D_FF
    port (
      clk: in std_logic;
      Wr: in std_logic;
      d: in std_logic;
      q: out std_logic
    );
  end component;
  
  -- Signals
  signal clk_tb: std_logic := '0';   -- Test bench clock signal
  signal Wr_tb: std_logic := '0';    -- Test bench write signal
  signal d_tb: std_logic := '0';     -- Test bench input signal
  signal q_tb: std_logic;            -- Test bench output signal

begin
  -- Instantiate D_FF component
  uut: D_FF port map (
    clk => clk_tb,
    Wr => Wr_tb,
    d => d_tb,
    q => q_tb
  );

  -- Clock process
  clk_process: process
  begin
    while now < 1000 ns loop  -- Simulate for 1000 ns
      clk_tb <= '0';
      wait for CLK_PERIOD/2;
      clk_tb <= '1';
      wait for CLK_PERIOD/2;
    end loop;
    wait;
  end process;
  
  -- Stimulus process
  stimulus_process: process
  begin
    d_tb <= '0'; -- Initialize input
    Wr_tb <= '0'; -- Initialize write signal
    wait for CLK_PERIOD;
    
    -- Test case 1: Write a '1' to the D_FF
    Wr_tb <= '1';
    d_tb <= '1';
    wait for CLK_PERIOD;
    
    -- Test case 2: Write a '0' to the D_FF
    Wr_tb <= '1';
    d_tb <= '0';
    wait for CLK_PERIOD;
    
    -- Test case 3: Do not write (keep Wr signal low)
    Wr_tb <= '0';
    d_tb <= '1';
    wait for CLK_PERIOD;
    
    -- Test case 4: Write a '1' to the D_FF again
    Wr_tb <= '1';
    d_tb <= '1';
    wait for CLK_PERIOD;
    
    -- End simulation
    wait;
  end process;
  
end architecture Behavioral;
