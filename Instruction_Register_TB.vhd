library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_register_tb is
end entity instruction_register_tb;

architecture Behavioral of instruction_register_tb is
  -- Constants
  constant CLK_PERIOD: time := 10 ns; -- Clock period
  
  -- Component declarations
  component instruction_register
    
        Port (
        In0 : in std_logic_vector(15 downto 0);
        IRw, Clk : in std_logic;
        SR, SA, SB : out std_logic_vector(2 downto 0);
        opcode : out std_logic_vector(4 downto 0);
        M,U : out std_logic
     );
  end component;
  
  component mux2_16
    port (
      In0, In1 : in std_logic_vector(15 downto 0);
      s : in std_logic;
      Z : out std_logic_vector(15 downto 0)
    );
  end component;
  
  -- Signals
  signal In0_tb : std_logic_vector(15 downto 0) := (others => '0'); -- Test bench input signal (In0)
  signal IRw_tb : std_logic := '0'; -- Test bench input signal (IRw)
  signal Clk_tb : std_logic := '0'; -- Test bench clock signal (Clk)
  signal SR_tb, SA_tb, SB_tb : std_logic_vector(2 downto 0); -- Test bench output signals (SR, SA, SB)
  signal opcode_tb : std_logic_vector(4 downto 0); -- Test bench output signal (opcode)
  signal M_tb, U_tb : std_logic; -- Test bench output signals (M, U)
  
begin
  -- Instantiate instruction_register component
  uut: instruction_register port map (
    In0 => In0_tb,
    IRw => IRw_tb,
    Clk => Clk_tb,
    SR => SR_tb,
    SA => SA_tb,
    SB => SB_tb,
    opcode => opcode_tb,
    M => M_tb,
    U => U_tb
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
    -- Test case 1: Load input In0 into the register, IRw = '0'
    In0_tb <= "1010101010101010";
    IRw_tb <= '0';
    wait for CLK_PERIOD;
    
    -- Test case 2: Load input In0 into the register, IRw = '1'
    In0_tb <= "0011001100110011";
    IRw_tb <= '1';
    wait for CLK_PERIOD;
    
    -- Add more test cases if needed
    
    -- End simulation
    wait;
  end process;
  
end architecture Behavioral;

