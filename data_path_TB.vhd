library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath_tb is
end datapath_tb;

architecture Behavioral of datapath_tb is
    -- Component declarations
    component datapath is
        Port (
            SRw: in std_logic;
            DRw: in std_logic;
            ARw: in std_logic;
            IRw: in std_logic;
            Pc_incremente: in std_logic;
            DRsrc: in std_logic;
            RFsrc: in std_logic;
            RFxy: in std_logic;
            data_in : in std_logic_vector(15 downto 0);
            clk: in std_logic;
            reset: in std_logic;
            M: out std_logic;
            OpCode: out std_logic_vector(4 downto 0);
            bus_out_AR, bus_out_PC: out std_logic_vector(5 downto 0);
            data_out: out std_logic_vector(15 downto 0)
        );
    end component;

    -- Signal declarations
    signal SRw_tb, DRw_tb, ARw_tb, IRw_tb, Pc_incremente_tb, DRsrc_tb, RFsrc_tb, RFxy_tb: std_logic;
    signal data_in_tb: std_logic_vector(15 downto 0);
    signal clk_tb, reset_tb: std_logic;
    signal M_tb: std_logic;
    signal OpCode_tb: std_logic_vector(4 downto 0);
    signal bus_out_AR_tb, bus_out_PC_tb: std_logic_vector(5 downto 0);
    signal data_out_tb: std_logic_vector(15 downto 0);

begin

    -- Instantiate the datapath component
    dut: datapath
    port map (
        SRw => SRw_tb,
        DRw => DRw_tb,
        ARw => ARw_tb,
        IRw => IRw_tb,
        Pc_incremente => Pc_incremente_tb,
        DRsrc => DRsrc_tb,
        RFsrc => RFsrc_tb,
        RFxy => RFxy_tb,
        data_in => data_in_tb,
        clk => clk_tb,
        reset => reset_tb,
        M => M_tb,
        OpCode => OpCode_tb,
        bus_out_AR => bus_out_AR_tb,
        bus_out_PC => bus_out_PC_tb,
        data_out => data_out_tb
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
        SRw_tb <= '0';
        DRw_tb <= '0';
        ARw_tb <= '0';
        IRw_tb <= '0';
        Pc_incremente_tb <= '0';
        DRsrc_tb <= '0';
        RFsrc_tb <= '0';
        RFxy_tb <= '0';
        data_in_tb <= (others => '0');
        reset_tb <= '0';

        -- Apply stimulus
        wait for 10 ns;
        reset_tb <= '1';
        wait for 10 ns;
        reset_tb <= '0';

        -- Provide test vectors
        -- Test case 1
        wait for 10 ns;
        SRw_tb <= '1';
        DRw_tb <= '1';
        ARw_tb <= '1';
        IRw_tb <= '1';
        Pc_incremente_tb <= '1';
        DRsrc_tb <= '1';
        RFsrc_tb <= '1';
        RFxy_tb <= '1';
        data_in_tb <= "1010101010101010";
        wait for 10 ns;

        -- Test case 2
        SRw_tb <= '0';
        DRw_tb <= '0';
        ARw_tb <= '0';
        IRw_tb <= '0';
        Pc_incremente_tb <= '0';
        DRsrc_tb <= '0';
        RFsrc_tb <= '0';
        RFxy_tb <= '0';
        data_in_tb <= "0101010101010101";
        wait for 10 ns;

-- Test case 3
wait for 10 ns;
SRw_tb <= '1';
DRw_tb <= '0';
ARw_tb <= '1';
IRw_tb <= '0';
Pc_incremente_tb <= '1';
DRsrc_tb <= '0';
RFsrc_tb <= '1';
RFxy_tb <= '0';
data_in_tb <= "1111000011110000";
wait for 10 ns;

-- Test case 4
SRw_tb <= '0';
DRw_tb <= '1';
ARw_tb <= '0';
IRw_tb <= '1';
Pc_incremente_tb <= '0';
DRsrc_tb <= '1';
RFsrc_tb <= '0';
RFxy_tb <= '1';
data_in_tb <= "0000111100001111";
wait for 10 ns;

-- Test case 5
SRw_tb <= '1';
DRw_tb <= '1';
ARw_tb <= '1';
IRw_tb <= '0';
Pc_incremente_tb <= '0';
DRsrc_tb <= '1';
RFsrc_tb <= '0';
RFxy_tb <= '1';
data_in_tb <= "0101010101010101";
wait for 10 ns;

-- Test case 6
SRw_tb <= '0';
DRw_tb <= '0';
ARw_tb <= '0';
IRw_tb <= '1';
Pc_incremente_tb <= '1';
DRsrc_tb <= '1';
RFsrc_tb <= '1';
RFxy_tb <= '0';
data_in_tb <= "1010101010101010";
wait for 10 ns;


        wait;
    end process;

end Behavioral;
