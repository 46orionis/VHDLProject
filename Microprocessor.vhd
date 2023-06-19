library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Microprocessor is
   
end Microprocessor;

architecture Behavioral of Microprocessor is
    -- Component declarations
    component CPU is
        Port (
            clk: in std_logic;
            reset: in std_logic;
            data_in_cpu: in std_logic_vector(15 downto 0);
            instruction_in: in std_logic_vector(15 downto 0);
            adrPc: out std_logic_vector(5 downto 0):= "000000";
            adrData: out std_logic_vector(5 downto 0);
            data_out_cpu: out std_logic_vector(15 downto 0);
            MEMw: out std_logic
        );
    end component;

    component Memory is
        Port (
            clk: in std_logic;
            adrPc: in std_logic_vector(5 downto 0);
            adrData: in std_logic_vector(5 downto 0);
            enable: in std_logic;
            Memw: in std_logic;
            data_in: in std_logic_vector(15 downto 0);
            instruction_out: out std_logic_vector(15 downto 0);
            data_out: out std_logic_vector(15 downto 0)
        );
    end component;

    -- Signals
    signal cpu_data_out: std_logic_vector(15 downto 0);
    signal mem_instruction_out: std_logic_vector(15 downto 0);
    signal mem_data_out: std_logic_vector(15 downto 0);
    signal mem_adrPc: std_logic_vector(5 downto 0);
    signal mem_adrData: std_logic_vector(5 downto 0);
    signal mem_enable: std_logic;
    signal bus_MEMw: std_logic;
    signal clk: std_logic;
    signal reset: std_logic;

begin

    -- Instantiate the CPU component
    cpu_inst: CPU
        port map (
            clk => clk,
            reset => reset,
            data_in_cpu => mem_data_out,
            instruction_in => mem_instruction_out,
            adrPc => mem_adrPc,
            adrData => mem_adrData,
            data_out_cpu => cpu_data_out,
            MEMw => bus_MEMw
        );

    -- Instantiate the Memory component
    mem_inst: Memory
        port map (
            clk => clk,
            adrPc => mem_adrPc,
            adrData => mem_adrData,
            enable => mem_enable,
            Memw => bus_MEMw,
            data_in => cpu_data_out,
            instruction_out => mem_instruction_out,
            data_out => mem_data_out
        );

	reset <= '0';

    clk_process : process
    begin	

            clk<= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns; 
   
    end process clk_process;



end Behavioral;

