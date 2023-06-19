library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_TB is
end entity CPU_TB;

architecture Behavioral of CPU_TB is
    -- Component declaration
    component CPU is
        Port (
            clk: in std_logic;
            reset: in std_logic;
            data_in_cpu: in std_logic_vector(15 downto 0);
            instruction_in: in std_logic_vector(15 downto 0);
            adrPc: out std_logic_vector(5 downto 0);
            adrData: out std_logic_vector(5 downto 0);
            data_out_cpu: out std_logic_vector(15 downto 0);
            MEMw: out std_logic
        );
    end component;

    -- Signals
    signal clk_tb: std_logic := '0';
    signal reset_tb: std_logic := '0';
    signal data_in_cpu_tb: std_logic_vector(15 downto 0) := (others => '0');
    signal instruction_in_tb: std_logic_vector(15 downto 0) := (others => '0');
    signal adrPc_tb: std_logic_vector(5 downto 0);
    signal adrData_tb: std_logic_vector(5 downto 0);
    signal data_out_cpu_tb: std_logic_vector(15 downto 0);
    signal MEMw_tb: std_logic;

begin
    -- Instantiate the CPU
    uut: CPU
        port map (
            clk => clk_tb,
            reset => reset_tb,
            data_in_cpu => data_in_cpu_tb,
            instruction_in => instruction_in_tb,
            adrPc => adrPc_tb,
            adrData => adrData_tb,
            data_out_cpu => data_out_cpu_tb,
            MEMw => MEMw_tb
        );

    -- Clock process
    process
    begin
        clk_tb <= '0';
        wait for 5 ns;
        clk_tb <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process
    process
    begin
        -- Initialize inputs
        data_in_cpu_tb <= (others => '0');
        instruction_in_tb <= (others => '0');
        reset_tb <= '1';
        wait for 10 ns;
        reset_tb <= '0';

        -- Apply test vectors
        -- Example test vectors:
        data_in_cpu_tb <= "1010101010101010";
        instruction_in_tb <= "0101010101010101";
        wait for 10 ns;

        -- Add more test vectors here
        
        -- End simulation
        wait;
    end process;

end architecture Behavioral;

