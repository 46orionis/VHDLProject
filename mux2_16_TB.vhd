     
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_16_tb is
end entity mux2_16_tb;

architecture Behavioral of mux2_16_tb is
  -- Constants
  constant CLK_PERIOD: time := 10 ns; -- Clock period
  
  -- Component declaration
  component mux2_16
    port (
      In0, In1 : in std_logic_vector(15 downto 0);
      s : in std_logic;
      Z : out std_logic_vector(15 downto 0)
    );
  end component;
  
  -- Signals
  signal In0_tb, In1_tb : std_logic_vector(15 downto 0) := (others => '0');  -- Test bench input signals
  signal s_tb: std_logic := '0';   -- Test bench select signal
  signal Z_tb: std_logic_vector(15 downto 0);   -- Test bench output signal

begin
  -- Instantiate mux2_16 component
  uut: mux2_16 port map (
    In0 => In0_tb,
    In1 => In1_tb,
    s => s_tb,
    Z => Z_tb
  );

  -- Clock process
  clk_process: process
  begin
    while now < 1000 ns loop  -- Simulate for 1000 ns
      wait for CLK_PERIOD/2;
      wait for CLK_PERIOD/2;
    end loop;
    wait;
  end process;
  
  -- Stimulus process
  stimulus_process: process
  begin
    In0_tb <= "0000000000000000"; -- Initialize input In0
    In1_tb <= "1111111111111111"; -- Initialize input In1
    s_tb <= '0'; -- Initialize select signal
    wait for CLK_PERIOD;
    
    -- Test case 1: Select In0
    s_tb <= '0';
    wait for CLK_PERIOD;
    assert Z_tb = "0000000000000000" report "Error: Mismatched output for Test case 1" severity error;
    
    -- Test case 2: Select In1
    s_tb <= '1';
    wait for CLK_PERIOD;
    assert Z_tb = "1111111111111111" report "Error: Mismatched output for Test case 2" severity error;
    
    -- Test case 3: Select In0 again
    s_tb <= '0';
    wait for CLK_PERIOD;
    assert Z_tb = "0000000000000000" report "Error: Mismatched output for Test case 3" severity error;
    
    -- End simulation
    wait;
  end process;
  
end architecture Behavioral;
