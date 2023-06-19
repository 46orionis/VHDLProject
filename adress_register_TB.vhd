library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_address_register_tb is
end entity control_address_register_tb;

architecture Behavioral of control_address_register_tb is
  -- Constants
  constant CLK_PERIOD: time := 10 ns; -- Clock period
         
  -- Component declaration
  component address_register
    port (
      In0 : in std_logic_vector(5 downto 0);
      Clk: in std_logic;
      Z : out std_logic_vector(5 downto 0)
    );
  end component;
  
  -- Signals
  signal In0_tb : std_logic_vector(5 downto 0) := (others => '0');  -- Test bench input signal
  signal Clk_tb: std_logic := '0';   -- Test bench clock signal
  signal Z_tb: std_logic_vector(5 downto 0);   -- Test bench output signal

begin
  -- Instantiate control_address_register component
  uut: address_register port map (
    In0 => In0_tb,
    Clk => Clk_tb,
    Z => Z_tb
  );

  -- Clock process
  clk_process: process
  begin
    while now < 1000 ns loop  -- Simulate for 1000 ns
      Clk_tb <= '0';
      wait for CLK_PERIOD/2;
      Clk_tb <= '1';
      wait for CLK_PERIOD/2;
    end loop;
    wait;
  end process;
  
  -- Stimulus process
  stimulus_process: process
  begin
    In0_tb <= "000000"; -- Initialize input In0
    wait for CLK_PERIOD;
    
    -- Test case 1: Apply input to the control_address_register
    In0_tb <= "010101";
    wait for 5 ns;
    assert Z_tb = "010101" report "Error: Mismatched output for Test case 1" severity error;
    
    -- Test case 2: Apply another input to the control_address_register
    In0_tb <= "111100";
    wait for 5 ns;
    assert Z_tb = "111100" report "Error: Mismatched output for Test case 2" severity error;
    
    -- End simulation
    wait;
  end process;
  
end architecture Behavioral;
