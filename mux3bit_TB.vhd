
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_3bit_tb is
end mux_3bit_tb;

architecture testbench of mux_3bit_tb is
    -- Component declaration
    component mux_3bit is
        Port (
            In0, In1 : in std_logic_vector(2 downto 0);
            s : in std_logic;
            Z : out std_logic_vector(2 downto 0)
        );
    end component;

    -- Signals
    signal In0_tb, In1_tb, Z_tb : std_logic_vector(2 downto 0);
    signal s_tb : std_logic;

begin
    -- Instantiate the mux_3bit component
    uut: mux_3bit
        port map (
            In0 => In0_tb,
            In1 => In1_tb,
            s => s_tb,
            Z => Z_tb
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Test case 1: s = '0', In0 = "001", In1 = "100"
        In0_tb <= "001";
        In1_tb <= "100";
        s_tb <= '0';
        wait for 10 ns;
        assert Z_tb = "001"
            report "Test case 1 failed" severity error;

        -- Test case 2: s = '1', In0 = "001", In1 = "100"
        s_tb <= '1';
        wait for 10 ns;
        assert Z_tb = "100"
            report "Test case 2 failed" severity error;

        -- Additional test cases can be added here

        wait;
    end process;

end testbench;
