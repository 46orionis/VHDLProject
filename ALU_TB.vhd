library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_16_tb is
end alu_16_tb;

architecture Behavioral_ALU_TB of alu_16_tb is
  -- Component declaration for the unit under test (UUT)
  component alu_16 is
    generic ( 
      constant N: natural := 1  -- number of shifted or rotated bits
    );
    Port (     
      A       : in  STD_LOGIC_VECTOR(15 downto 0);
      B       : in  STD_LOGIC_VECTOR(15 downto 0);
      fs4     : in  STD_LOGIC_VECTOR(3 downto 0);
      Q       : out STD_LOGIC_VECTOR(15 downto 0);
      overflow: out STD_LOGIC;
      c_final : out STD_LOGIC
    );
  end component;

  -- Inputs
  signal A       : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  signal B       : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  signal fs4     : STD_LOGIC_VECTOR(3 downto 0)  := (others => '0');

  -- Outputs
  signal Q       : STD_LOGIC_VECTOR(15 downto 0);
  signal overflow: STD_LOGIC;
  signal c_final : STD_LOGIC;

begin

  -- Instantiate the unit under test (UUT)
  uut: alu_16
    generic map (
      N => 1
    )
    port map (
      A        => A,
      B        => B,
      fs4      => fs4,
      Q        => Q,
      overflow => overflow,
      c_final  => c_final
    );

  -- Stimulus process
  stim_proc: process
  begin
    -- Test case 1
    A <= "0000000000000001";
    B <= "0000000000000010";
    fs4 <= "0000";
    wait for 10 ns;

    -- Test case 2
    A <= "0000000000000100";
    B <= "0000000000000001";
    fs4 <= "0001";
    wait for 10 ns;

   	  -- Test case 3: Multiplication
  A <= "0000000000000100";
  B <= "0000000000000011";
  fs4 <= "0010";
  wait for 10 ns;

  -- Test case 4: Division
  A <= "0000000000000100";
  B <= "0000000000000010";
  fs4 <= "0011";
  wait for 10 ns;

  -- Test case 5: Shift Left Logical
  A <= "0000000000000100";
  B <= "0000000000000001";
  fs4 <= "0100";
  wait for 10 ns;

  -- Test case 6: Shift Right Logical
  A <= "0000000000000100";
  B <= "0000000000000001";
  fs4 <= "0101";
  wait for 10 ns;

  -- Test case 7: Rotate Left
  A <= "0000000000000100";
  B <= "0000000000000001";
  fs4 <= "0110";
  wait for 10 ns;

  -- Test case 8: Rotate Right
  A <= "0000000000000100";
  B <= "0000000000000001";
  fs4 <= "0111";
  wait for 10 ns;

  -- Test case 9: AND
  A <= "0000000000000110";
  B <= "0000000000000101";
  fs4 <= "1000";
  wait for 10 ns;

  -- Test case 10: OR
  A <= "0000000000000110";
  B <= "0000000000000101";
  fs4 <= "1001";
  wait for 10 ns;

  -- Test case 11: XOR
  A <= "0000000000000110";
  B <= "0000000000000101";
  fs4 <= "1010";
  wait for 10 ns;

  -- Test case 12: NOR
  A <= "0000000000000110";
  B <= "0000000000000101";
  fs4 <= "1011";
  wait for 10 ns;

  -- Test case 13: NAND
  A <= "0000000000000110";
  B <= "0000000000000101";
  fs4 <= "1100";
  wait for 10 ns;

  -- Test case 14: XNOR
  A <= "0000000000000110";
  B <= "0000000000000101";
  fs4 <= "1101";
  wait for 10 ns;

  -- Test case 15: Greater Than
  A <= "0000000000000101";
  B <= "0000000000000100";
  fs4 <= "1110";
  wait for 10 ns;

  -- Test case 16: Equal To
  A <= "0000000000000101";
  B <= "0000000000000101";
  fs4 <= "1111";
  wait for 10 ns;


    wait;
  end process;

end Behavioral_ALU_TB;
