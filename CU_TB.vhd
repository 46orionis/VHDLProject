library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit_TB is
end ControlUnit_TB;

architecture Behavioral of ControlUnit_TB is
    signal clk : std_logic := '0';
    signal m : std_logic := '0';
    signal reset : std_logic := '1';
    signal opcode : std_logic_vector(4 downto 0) := "00000";
    signal MEMw : std_logic;
    signal SRw : std_logic;
    signal DRw : std_logic;
    signal ARw : std_logic;
    signal IRw : std_logic;
    signal Pc_incremente : std_logic;
    signal DRsrc : std_logic;
    signal RFsrc : std_logic;
    signal RFxy : std_logic;

    component ControlUnit is
        port (
            opcode : in std_logic_vector(4 downto 0);
            clk : in std_logic;
            m : in std_logic := '0';
            reset : in std_logic;
            MEMw : out std_logic;
            SRw : out std_logic;
            DRw : out std_logic;
            ARw : out std_logic;
            IRw : out std_logic;
            Pc_incremente : out std_logic;
            DRsrc : out std_logic;
            RFsrc : out std_logic;
            RFxy : out std_logic

        );
    end component;

begin
    uut: ControlUnit port map (
        opcode => opcode,
        clk => clk,
        m => m,
        reset => reset,
        MEMw => MEMw,
        SRw => SRw,
        DRw => DRw,
        ARw => ARw,
        IRw => IRw,
        Pc_incremente => Pc_incremente,
        DRsrc => DRsrc,
        RFsrc => RFsrc,
        RFxy => RFxy
    );

    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Initialize reset
        reset <= '1';
        wait for 100 ns;
        reset <= '0';

        -- Test case 1: opcode 00000
        opcode <= "00000";
        wait for 100 ns;
       
        -- Test case 2: opcode 00001
        opcode <= "00001";
        wait for 100 ns;

        opcode <= "10000";
        wait for 100 ns;
       
        opcode <= "10001";
        wait for 100 ns;

        -- Add more test cases for other opcodes as needed

        wait;
    end process;

end Behavioral;

